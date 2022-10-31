﻿Imports System.Data.SqlClient
Imports System.IO

Public Class frmStockAdjustment_Store
    Dim str As String
    Private Sub auto()
        Try
            Dim Num As Integer = 0
            con = New SqlConnection(cs)
            con.Open()
            Dim sql As String = ("SELECT MAX(SA_ID) FROM StockAdjustment_Store")
            cmd = New SqlCommand(sql)
            cmd.Connection = con
            If (IsDBNull(cmd.ExecuteScalar)) Then
                Num = 1
                txtAdjustmentID.Text = Num.ToString
            Else
                Num = cmd.ExecuteScalar + 1
                txtAdjustmentID.Text = Num.ToString
            End If
            cmd.Dispose()
            con.Close()
            con.Dispose()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Sub Reset()
        txtBarcode.Text = ""
        cmbProductName.Text = ""
        rbPlus.Checked = True
        rbMinus.Checked = False
        txtReason.Text = ""
        txtQty.Text = ""
        txtQ.Text = ""
        txtProductID.Text = ""
        txtProductCode.Text = ""
        lblQty_S.Visible = False
        dtpDate.Value = Today
        btnSave.Enabled = True
        btnDelete.Enabled = False
        btnUpdate.Enabled = False
        txtBarcode.Enabled = True
        cmbProductName.Enabled = True
        gbAdjustment.Enabled = True
        auto()
    End Sub

    Private Sub DeleteRecord()
        Try
            Dim RowsAffected As Integer = 0
            con = New SqlConnection(cs)
            con.Open()
            Dim cq As String = "delete from StockAdjustment_Store where SA_ID=@d1"
            cmd = New SqlCommand(cq)
            cmd.Parameters.AddWithValue("@d1", Val(txtAdjustmentID.Text))
            cmd.Connection = con
            RowsAffected = cmd.ExecuteNonQuery()
            If RowsAffected > 0 Then
                If rbPlus.Checked = True Then
                    con = New SqlConnection(cs)
                    con.Open()
                    Dim cb1 As String = "Update Temp_Stock_Company set qty=qty - " & Val(txtQty.Text) & " where ProductID=@d1 and Barcode=@d2"
                    cmd = New SqlCommand(cb1)
                    cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                    cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                    cmd.Connection = con
                    cmd.ExecuteNonQuery()
                    con.Close()
                End If
                If rbMinus.Checked = True Then
                    con = New SqlConnection(cs)
                    con.Open()
                    Dim cb1 As String = "Update Temp_Stock_Company set qty=qty + " & Val(txtQty.Text) & " where ProductID=@d1 and Barcode=@d2"
                    cmd = New SqlCommand(cb1)
                    cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                    cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                    cmd.Connection = con
                    cmd.ExecuteNonQuery()
                    con.Close()
                End If
                LogFunc(lblUser.Text, "Deleted the Stock Adjustment(S) record having adjustment id '" & txtAdjustmentID.Text & "'")
                MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Reset()
            Else
                MessageBox.Show("No Record found", "Sorry", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Reset()
            End If
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub btnNew_Click(sender As System.Object, e As System.EventArgs) Handles btnNew.Click
        Reset()
    End Sub

    Private Sub btnSave_Click(sender As System.Object, e As System.EventArgs) Handles btnSave.Click
        If Len(Trim(cmbProductName.Text)) = 0 Then
            MessageBox.Show("Please select product name", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            cmbProductName.Focus()
            Exit Sub
        End If
        If txtBarcode.Text = "" Then
            MessageBox.Show("Please Enter Barcode", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtBarcode.Focus()
            Exit Sub
        End If
        If txtQty.Text = "" Then
            MessageBox.Show("Please enter quantity", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtQty.Focus()
            Exit Sub
        End If
        If Val(txtQty.Text = 0) Then
            MessageBox.Show("Quantity can not be zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtQty.Focus()
            Exit Sub
        End If
        If txtReason.Text = "" Then
            MessageBox.Show("Please enter reason", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtReason.Focus()
            Exit Sub
        End If
        Try
            If rbPlus.Checked = True Then
                str = rbPlus.Text
            Else
                str = rbMinus.Text
            End If
            auto()
            con = New SqlConnection(cs)
            con.Open()
            Dim cb As String = "insert into StockAdjustment_Store(SA_ID, ProductID, Barcode, Date, AdjustmentType, Qty, Reason) VALUES (@d1,@d2,@d3,@d4,@d5,@d6,@d7)"
            cmd = New SqlCommand(cb)
            cmd.Parameters.AddWithValue("@d1", Val(txtAdjustmentID.Text))
            cmd.Parameters.AddWithValue("@d2", Val(txtProductID.Text))
            cmd.Parameters.AddWithValue("@d3", txtBarcode.Text)
            cmd.Parameters.AddWithValue("@d4", dtpDate.Value.Date)
            cmd.Parameters.AddWithValue("@d5", str)
            cmd.Parameters.AddWithValue("@d6", Val(txtQty.Text))
            cmd.Parameters.AddWithValue("@d7", txtReason.Text)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            If rbPlus.Checked = True Then
                con = New SqlConnection(cs)
                con.Open()
                Dim cb1 As String = "Update Temp_Stock_Company set qty=qty + " & Val(txtQty.Text) & " where ProductID=@d1 and Barcode=@d2"
                cmd = New SqlCommand(cb1)
                cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                con.Close()
            End If
            If rbMinus.Checked = True Then
                con = New SqlConnection(cs)
                con.Open()
                Dim cb1 As String = "Update Temp_Stock_Company set qty=qty - " & Val(txtQty.Text) & " where ProductID=@d1 and Barcode=@d2"
                cmd = New SqlCommand(cb1)
                cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                con.Close()
            End If
            LogFunc(lblUser.Text, "added the new Stock Adjustment(S) record having adjustment id '" & txtAdjustmentID.Text & "'")
            MessageBox.Show("Successfully adjusted", "Stock", MessageBoxButtons.OK, MessageBoxIcon.Information)
            btnSave.Enabled = False
            con.Close()
            Reset()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Sub fillCombo()
        Try
            Cursor = Cursors.WaitCursor
            Timer1.Enabled = True
            SqlConnection.ClearAllPools()
            con = New SqlConnection(cs)
            con.Open()
            Dim ctn1 As String = "SELECT ProductName FROM Product,Temp_Stock_Company where Product.PID=Temp_Stock_Company.ProductID order by 1"
            cmd = New SqlCommand(ctn1)
            cmd.Connection = con
            cmd.CommandTimeout = 0
            cmbProductName.Items.Clear()
            rdr = cmd.ExecuteReader()
            While rdr.Read()
                cmbProductName.Items.Add(rdr(0).ToString())
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub btnDelete_Click(sender As System.Object, e As System.EventArgs) Handles btnDelete.Click
        Try
            If MessageBox.Show("Do you really want to delete this record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) = Windows.Forms.DialogResult.Yes Then
                DeleteRecord()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub cmbProductName_Format(sender As System.Object, e As System.Windows.Forms.ListControlConvertEventArgs) Handles cmbProductName.Format
        If (e.DesiredType Is GetType(String)) Then
            e.Value = e.Value.ToString.Trim
        End If
    End Sub

    Private Sub cmbProductName_SelectedIndexChanged(sender As System.Object, e As System.EventArgs) Handles cmbProductName.SelectedIndexChanged
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim ctn1 As String = "select * from Company"
            cmd = New SqlCommand(ctn1)
            cmd.Connection = con
            rdr = cmd.ExecuteReader()
            If Not rdr.Read() Then
                MessageBox.Show("Add company profile first in master entry", "", MessageBoxButtons.OK, MessageBoxIcon.Information)
                If (rdr IsNot Nothing) Then
                    rdr.Close()
                End If
                Return
            End If
            con = New SqlConnection(cs)
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandText = "SELECT PID,RTRIM(ProductCode),RTRIM(Barcode) from Product where ProductName=@d1"
            cmd.Parameters.AddWithValue("@d1", cmbProductName.Text)
            rdr = cmd.ExecuteReader()
            If rdr.Read() Then
                txtProductID.Text = rdr.GetValue(0)
                txtProductCode.Text = rdr.GetValue(1).ToString()
                txtBarcode.Text = rdr.GetValue(2).ToString()
                txtQty.Focus()
                GetQty_S()
            End If
            If (rdr IsNot Nothing) Then
                rdr.Close()
            End If
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Sub GetQty_S()
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandText = "Select IsNull(Sum(Qty),0) from temp_stock_Company,Product where Temp_Stock_Company.ProductID=Product.PID and ProductID=@d1 and Temp_Stock_Company.Barcode=@d2 group by ProductID,Temp_Stock_Company.Barcode"
            cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
            cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
            rdr = cmd.ExecuteReader()
            If rdr.Read() Then
                lblQty_S.Visible = True
                lblQty_S.Text = rdr.GetValue(0)
            Else
                lblQty_S.Visible = True
                lblQty_S.Text = "0.00"
            End If
            If (rdr IsNot Nothing) Then
                rdr.Close()
            End If
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub txtBarcode_KeyDown(sender As System.Object, e As System.Windows.Forms.KeyEventArgs) Handles txtBarcode.KeyDown
        Try
            If e.KeyCode = Keys.Enter Then
                con = New SqlConnection(cs)
                con.Open()
                Dim ctn1 As String = "select * from Company"
                cmd = New SqlCommand(ctn1)
                cmd.Connection = con
                rdr = cmd.ExecuteReader()
                If Not rdr.Read() Then
                    MessageBox.Show("Add company profile first in master entry", "", MessageBoxButtons.OK, MessageBoxIcon.Information)
                    If (rdr IsNot Nothing) Then
                        rdr.Close()
                    End If
                    Return
                End If
                con = New SqlConnection(cs)
                con.Open()
                cmd = con.CreateCommand()
                cmd.CommandText = "SELECT PID,RTRIM(ProductCode),RTRIM(ProductName) from Product,Temp_Stock_Company where Product.PID=Temp_Stock_Company.ProductID and Temp_Stock_Company.Barcode=@d1"
                cmd.Parameters.AddWithValue("@d1", txtBarcode.Text)
                rdr = cmd.ExecuteReader()
                If rdr.Read() Then
                    txtProductID.Text = rdr.GetValue(0)
                    txtProductCode.Text = rdr.GetValue(1).ToString()
                    cmbProductName.Text = rdr.GetValue(2).ToString()
                    txtQty.Focus()
                    GetQty_S()
                End If
                If (rdr IsNot Nothing) Then
                    rdr.Close()
                End If
                If con.State = ConnectionState.Open Then
                    con.Close()
                End If
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try

    End Sub

    Private Sub btnScanBarcode_Click(sender As System.Object, e As System.EventArgs) 
        txtBarcode.Focus()
    End Sub

    Private Sub btnLoadProducts_Click(sender As System.Object, e As System.EventArgs) 
        If MessageBox.Show("Do you really want to load all the products?" & vbCrLf & "It will take time to load the records based on no. of records in database.", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = Windows.Forms.DialogResult.Yes Then
            fillCombo()
        End If
    End Sub

    Private Sub txtQty_KeyPress(sender As System.Object, e As System.Windows.Forms.KeyPressEventArgs) Handles txtQty.KeyPress
        Dim keyChar = e.KeyChar

        If Char.IsControl(keyChar) Then
            'Allow all control characters.
        ElseIf Char.IsDigit(keyChar) OrElse keyChar = "."c Then
            Dim text = Me.txtQty.Text
            Dim selectionStart = Me.txtQty.SelectionStart
            Dim selectionLength = Me.txtQty.SelectionLength

            text = text.Substring(0, selectionStart) & keyChar & text.Substring(selectionStart + selectionLength)

            If Integer.TryParse(text, New Integer) AndAlso text.Length > 16 Then
                'Reject an integer that is longer than 16 digits.
                e.Handled = True
            ElseIf Double.TryParse(text, New Double) AndAlso text.IndexOf("."c) < text.Length - 3 Then
                'Reject a real number with two many decimal places.
                e.Handled = False
            End If
        Else
            'Reject all other characters.
            e.Handled = True
        End If
    End Sub

    Private Sub Timer1_Tick(sender As System.Object, e As System.EventArgs) Handles Timer1.Tick
        Cursor = Cursors.Default
        Timer1.Enabled = False
    End Sub

    Private Sub btnUpdate_Click(sender As System.Object, e As System.EventArgs) Handles btnUpdate.Click
        If Len(Trim(cmbProductName.Text)) = 0 Then
            MessageBox.Show("Please select product name", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            cmbProductName.Focus()
            Exit Sub
        End If
        If txtBarcode.Text = "" Then
            MessageBox.Show("Please Enter Barcode", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtBarcode.Focus()
            Exit Sub
        End If
        If txtQty.Text = "" Then
            MessageBox.Show("Please enter quantity", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtQty.Focus()
            Exit Sub
        End If
        If Val(txtQty.Text = 0) Then
            MessageBox.Show("Quantity can not be zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtQty.Focus()
            Exit Sub
        End If
        If txtReason.Text = "" Then
            MessageBox.Show("Please enter reason", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtReason.Focus()
            Exit Sub
        End If
        Try
            If rbPlus.Checked = True Then
                str = rbPlus.Text
            Else
                str = rbMinus.Text
            End If
            con = New SqlConnection(cs)
            con.Open()
            Dim cb As String = "Update StockAdjustment_Store set ProductID=@d2, Barcode=@d3, Date=@d4, AdjustmentType=@d5, Qty=@d6, Reason=@d7 where SA_ID=@d1"
            cmd = New SqlCommand(cb)
            cmd.Parameters.AddWithValue("@d1", Val(txtAdjustmentID.Text))
            cmd.Parameters.AddWithValue("@d2", Val(txtProductID.Text))
            cmd.Parameters.AddWithValue("@d3", txtBarcode.Text)
            cmd.Parameters.AddWithValue("@d4", dtpDate.Value.Date)
            cmd.Parameters.AddWithValue("@d5", str)
            cmd.Parameters.AddWithValue("@d6", Val(txtQty.Text))
            cmd.Parameters.AddWithValue("@d7", txtReason.Text)
            cmd.Connection = con
            cmd.ExecuteNonQuery()
            con.Close()
            If rbPlus.Checked = True Then
                con = New SqlConnection(cs)
                con.Open()
                Dim cb1 As String = "Update Temp_Stock_Company set qty=qty + ( " & Val(txtQty.Text) & " - " & Val(txtQ.Text) & ") where ProductID=@d1 and Barcode=@d2"
                cmd = New SqlCommand(cb1)
                cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                con.Close()
            End If
            If rbMinus.Checked = True Then
                con = New SqlConnection(cs)
                con.Open()
                Dim cb1 As String = "Update Temp_Stock_Company set qty=qty - ( " & Val(txtQty.Text) & " - " & Val(txtQ.Text) & ") where ProductID=@d1 and Barcode=@d2"
                cmd = New SqlCommand(cb1)
                cmd.Parameters.AddWithValue("@d1", Val(txtProductID.Text))
                cmd.Parameters.AddWithValue("@d2", txtBarcode.Text)
                cmd.Connection = con
                cmd.ExecuteNonQuery()
                con.Close()
            End If
            LogFunc(lblUser.Text, "Updated the Stock Adjustment(S) record having adjustment id '" & txtAdjustmentID.Text & "'")
            MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)
            btnUpdate.Enabled = False
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnGetData_Click(sender As System.Object, e As System.EventArgs) Handles btnGetData.Click
        frmStockAdjustment_Store_Record.lblSet.Text = "SA"
        frmStockAdjustment_Store_Record.Reset()
        frmStockAdjustment_Store_Record.ShowDialog()
    End Sub
End Class
