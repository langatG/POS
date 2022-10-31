Imports System.Data.SqlClient
Public Class frmStockIn_Store

    Private Sub DataGridView1_RowPostPaint(sender As Object, e As System.Windows.Forms.DataGridViewRowPostPaintEventArgs) Handles DataGridView1.RowPostPaint
        Dim strRowNumber As String = (e.RowIndex + 1).ToString()
        Dim size As SizeF = e.Graphics.MeasureString(strRowNumber, Me.Font)
        If DataGridView1.RowHeadersWidth < Convert.ToInt32((size.Width + 20)) Then
            DataGridView1.RowHeadersWidth = Convert.ToInt32((size.Width + 20))
        End If
        Dim b As Brush = SystemBrushes.ButtonHighlight
        e.Graphics.DrawString(strRowNumber, Me.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2))

    End Sub
    Sub Reset()
        txtBarcode.Text = ""
        txtProductName.Text = ""
    End Sub
    Sub GetData()
        Try
            Cursor = Cursors.WaitCursor
            Timer1.Enabled = True
            SqlConnection.ClearAllPools()
            con = New SqlConnection(cs)
            con.Open()
            Dim sql As String = "SELECT (PID),RTRIM(ProductCode),RTRIM(ProductName),RTRIM(Temp_Stock_Company.Barcode),Temp_Stock_Company.SalesRate,TaxMaster.Percentage,RTRIM(Product.SalesUnit),RTRIM(Temp_Stock_Company.ManufacturingDate),RTRIM(Temp_Stock_Company.ExpiryDate),Temp_Stock_Company.Qty from Product,Temp_Stock_Company,TaxMaster where Product.PID=Temp_Stock_Company.ProductID and TaxMaster.TaxName=Product.VATCommodity and Qty > 0 order by ProductName"
            cmd = New SqlCommand(sql, con)
            cmd.CommandTimeout = 0
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            DataGridView1.Rows.Clear()
            While (rdr.Read() = True)
                DataGridView1.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4), rdr(5), rdr(6), rdr(7), rdr(8), rdr(9))
            End While
            con.Close()
            con = New SqlConnection(cs)
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandText = "SELECT isnull(sum(PurchaseRate*Qty),0),isnull(sum(SalesRate*Qty),0) from Temp_Stock_Company"
            rdr = cmd.ExecuteReader()
            If rdr.Read() Then
                Dim val1, val2 As Decimal
                val1 = rdr.GetValue(0)
                val1 = Math.Round(val1, 2)
                txtPurchaseValue.Text = val1

                val2 = rdr.GetValue(1)
                val2 = Math.Round(val2, 2)
                txtSalesValue.Text = val2
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

    Private Sub btnReset_Click(sender As System.Object, e As System.EventArgs) Handles btnReset.Click
        Reset()
    End Sub

    Private Sub btnExportExcel_Click(sender As System.Object, e As System.EventArgs) Handles btnExportExcel.Click
        ExportExcel(DataGridView1)
    End Sub

    Private Sub btnShowAll_Click(sender As System.Object, e As System.EventArgs) Handles btnShowAll.Click
        If MessageBox.Show("Do you really want to load all the records?" & vbCrLf & "It will take time to load the records based on no. of records in database.", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Information) = Windows.Forms.DialogResult.Yes Then
            GetData()
        End If
    End Sub

    Private Sub Timer1_Tick(sender As System.Object, e As System.EventArgs) Handles Timer1.Tick
        Cursor = Cursors.Default
        Timer1.Enabled = False
    End Sub

    Private Sub txtProductName_KeyDown(sender As System.Object, e As System.Windows.Forms.KeyEventArgs) Handles txtProductName.KeyDown
        Try
            If e.KeyCode = Keys.Enter Then
                con = New SqlConnection(cs)
                con.Open()
                Dim sql As String = "SELECT (PID),RTRIM(ProductCode),RTRIM(ProductName),RTRIM(Temp_Stock_Company.Barcode),Temp_Stock_Company.SalesRate,TaxMaster.Percentage,RTRIM(Product.SalesUnit),RTRIM(Temp_Stock_Company.ManufacturingDate),RTRIM(Temp_Stock_Company.ExpiryDate),Temp_Stock_Company.Qty from Product,Temp_Stock_Company,TaxMaster where Product.PID=Temp_Stock_Company.ProductID and TaxMaster.TaxName=Product.VATCommodity and Qty > 0 and Product.ProductName like '" & txtProductName.Text & "%' order by ProductName"
                cmd = New SqlCommand(sql, con)
                cmd.CommandTimeout = 0
                rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
                DataGridView1.Rows.Clear()
                While (rdr.Read() = True)
                    DataGridView1.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4), rdr(5), rdr(6), rdr(7), rdr(8), rdr(9))
                End While
                con.Close()

                con = New SqlConnection(cs)
                con.Open()
                cmd = con.CreateCommand()
                cmd.CommandText = "SELECT isnull(sum(PurchaseRate*Qty),0),isnull(sum(SalesRate*Qty),0) from Temp_Stock_Company"
                rdr = cmd.ExecuteReader()
                If rdr.Read() Then
                    Dim val1, val2 As Decimal
                    val1 = rdr.GetValue(0)
                    val1 = Math.Round(val1, 2)
                    txtPurchaseValue.Text = val1

                    val2 = rdr.GetValue(1)
                    val2 = Math.Round(val2, 2)
                    txtSalesValue.Text = val2
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

    Private Sub txtBarcode_KeyDown(sender As System.Object, e As System.Windows.Forms.KeyEventArgs) Handles txtBarcode.KeyDown
        Try
            If e.KeyCode = Keys.Enter Then
                con = New SqlConnection(cs)
                con.Open()
                Dim sql As String = "SELECT (PID),RTRIM(ProductCode),RTRIM(ProductName),RTRIM(Temp_Stock_Company.Barcode),Temp_Stock_Company.SalesRate,TaxMaster.Percentage,RTRIM(Product.SalesUnit),RTRIM(Temp_Stock_Company.ManufacturingDate),RTRIM(Temp_Stock_Company.ExpiryDate),Temp_Stock_Company.Qty from Product,Temp_Stock_Company,TaxMaster where Product.PID=Temp_Stock_Company.ProductID and TaxMaster.TaxName=Product.VATCommodity and Qty > 0 and Temp_Stock_Company.Barcode like '" & txtBarcode.Text & "%' order by ProductName"
                cmd = New SqlCommand(sql, con)
                cmd.CommandTimeout = 0
                rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
                DataGridView1.Rows.Clear()
                While (rdr.Read() = True)
                    DataGridView1.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4), rdr(5), rdr(6), rdr(7), rdr(8), rdr(9))
                End While
                con.Close()
                con = New SqlConnection(cs)
                con.Open()
                cmd = con.CreateCommand()
                cmd.CommandText = "SELECT isnull(sum(PurchaseRate*Qty),0),isnull(sum(SalesRate*Qty),0) from Temp_Stock_Company"
                rdr = cmd.ExecuteReader()
                If rdr.Read() Then
                    Dim val1, val2 As Decimal
                    val1 = rdr.GetValue(0)
                    val1 = Math.Round(val1, 2)
                    txtPurchaseValue.Text = val1

                    val2 = rdr.GetValue(1)
                    val2 = Math.Round(val2, 2)
                    txtSalesValue.Text = val2
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

    Private Sub frmStockIn_Store_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    End Sub

    Private Sub btnViewReport_Click(sender As System.Object, e As System.EventArgs) Handles btnViewReport.Click
        Try
            Cursor = Cursors.WaitCursor
            Timer1.Enabled = True
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("SELECT (PID),RTRIM(ProductCode) as Productcode,RTRIM(ProductName) as Productname,RTRIM(Temp_Stock_Company.Barcode) as barcode,Temp_Stock_Company.PurchaseRate,Temp_Stock_Company.SalesRate,TaxMaster.Percentage as VATpercents,RTRIM(Product.SalesUnit) as unit,RTRIM(Temp_Stock_Company.ManufacturingDate) as MDate,RTRIM(Temp_Stock_Company.ExpiryDate) as eDate,Temp_Stock_Company.Qty from Product,Temp_Stock_Company,TaxMaster where Product.PID=Temp_Stock_Company.ProductID and TaxMaster.TaxName=Product.VATCommodity and Qty > 0 order by ProductName", con)
       adp = New SqlDataAdapter(cmd)
            dtable = New DataTable()
            adp.Fill(dtable)
            con.Close()
            ds = New DataSet()
            ds.Tables.Add(dtable)
            ds.WriteXmlSchema("Stocks.xml")
            Dim rpt As New rptStocksINStore
            rpt.SetDataSource(ds)
            frmReport.CrystalReportViewer1.ReportSource = rpt
            frmReport.ShowDialog()
            rpt.Dispose()
            rpt.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
End Class