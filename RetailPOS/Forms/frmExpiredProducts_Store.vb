﻿Imports System.Data.SqlClient

Public Class frmExpiredProducts_Store

    Public Sub GetData()
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim sql As String = "Select RTRIM(ProductCode),RTRIM(ProductName),RTRIM(ExpiryDate),Sum(Qty) from Temp_Stock_Company,Product where Temp_Stock_Company.ProductID=Product.PID  and Convert(Datetime,ExpiryDate,103) < GetDate() and ExpiryDate <>'' and ExpiryDate is not null group by ProductCode,ProductName,ExpiryDate having sum(Qty) > 0 order by ProductName"
            cmd = New SqlCommand(sql, con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub frmLogs_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        GetData()
    End Sub
    Sub Reset()
        dtpDateFrom.Value = Today
        dtpDateTo.Value = Today
        txtProductName.Text = ""
        GetData()
    End Sub
    Private Sub btnReset_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnReset.Click
        Reset()
    End Sub

    Private Sub btnExportExcel_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles btnExportExcel.Click
        ExportExcel(dgw)
    End Sub

    Private Sub dgw_RowPostPaint(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewRowPostPaintEventArgs) Handles dgw.RowPostPaint
        Dim strRowNumber As String = (e.RowIndex + 1).ToString()
        Dim size As SizeF = e.Graphics.MeasureString(strRowNumber, Me.Font)
        If dgw.RowHeadersWidth < Convert.ToInt32((size.Width + 20)) Then
            dgw.RowHeadersWidth = Convert.ToInt32((size.Width + 20))
        End If
        Dim b As Brush = SystemBrushes.ControlText
        e.Graphics.DrawString(strRowNumber, Me.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2))
    End Sub

    Private Sub txtProductName_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtProductName.TextChanged
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim sql As String = "Select RTRIM(ProductCode),RTRIM(ProductName),RTRIM(ExpiryDate),Sum(Qty) from Temp_Stock_Company,Product where Temp_Stock_Company.ProductID=Product.PID  and ProductName like '%" & txtProductName.Text & "%' and Convert(Datetime,ExpiryDate,103) < GetDate() and ExpiryDate <>'' and ExpiryDate is not null group by ProductCode,ProductName,ExpiryDate having sum(Qty) > 0 order by ProductName"
            cmd = New SqlCommand(sql, con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles Button1.Click
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim sql As String = "Select RTRIM(ProductCode),RTRIM(ProductName),RTRIM(ExpiryDate),Sum(Qty) from Temp_Stock_Company,Product where Temp_Stock_Company.ProductID=Product.PID and Convert(Datetime,ExpiryDate,103) >=@d1 and Convert(Datetime,ExpiryDate,103) < @d2 and ExpiryDate <>'' and ExpiryDate is not null group by ProductCode,ProductName,ExpiryDate having sum(Qty) > 0 order by ProductName"
            cmd = New SqlCommand(sql, con)
            cmd.Parameters.Add("@d1", SqlDbType.DateTime, 30, "Date").Value = dtpDateFrom.Value.Date
            cmd.Parameters.Add("@d2", SqlDbType.DateTime, 30, "Date").Value = dtpDateTo.Value.Date.AddDays(1)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
End Class

