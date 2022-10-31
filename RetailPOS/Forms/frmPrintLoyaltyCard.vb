Imports System.Data.SqlClient
Public Class frmPrintLoyaltyCard
    Dim st As String
    Private Sub btnGenerateBarcode_Click(sender As System.Object, e As System.EventArgs) Handles btnViewReport.Click

        If listView1.Items.Count = 0 Then
            MessageBox.Show("There is no members's record in listview to generate barcode ", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            Exit Sub
        End If
        Try
            If listView1.CheckedItems.Count > 0 Then
                Dim Condition As String = ""
                For I = 0 To listView1.CheckedItems.Count - 1
                    Condition += String.Format("{0},", listView1.CheckedItems(I).Text)
                Next
                Condition = Condition.Substring(0, Condition.Length - 1)
                Cursor = Cursors.WaitCursor
                Timer1.Enabled = True
                con = New SqlConnection(cs)
                con.Open()
                Dim st As String = "Select MemberID,RTRIM(Name),RTRIM(Address),RTRIM(ContactNo) from LoyaltyMember where MemberID in (" & Condition & ") order by Name"
                cmd = New SqlCommand(st, con)
                adp = New SqlDataAdapter(cmd)
                dtable = New DataTable()
                adp.Fill(dtable)
                con.Close()
                ds = New DataSet()
                ds.Tables.Add(dtable)
                ds.WriteXmlSchema("LoyaltyCard1.xml")
                Dim rpt As New rptLoyaltyCard
                rpt.SetDataSource(ds)
                rpt.SetParameterValue("p1", txtHotelName.Text)
                frmReport.CrystalReportViewer1.ReportSource = rpt
                frmReport.ShowDialog()
                rpt.Close()
                rpt.Dispose()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub
    Sub Reset()
        txtMemberID.Text = ""
        txtMemberName.Text = ""
        GetData()
    End Sub
    Private Sub btnReset_Click(sender As System.Object, e As System.EventArgs) Handles btnReset.Click
        Reset()
    End Sub

    Private Sub Timer1_Tick(sender As System.Object, e As System.EventArgs) Handles Timer1.Tick
        Cursor = Cursors.Default
        Timer1.Enabled = False
    End Sub


    Private Sub txtMemberName_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtMemberName.TextChanged
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("Select RTRIM(MemberID),RTRIM(Name),RTRIM(Address),RTRIM(ContactNo) from LoyaltyMember where Name like '%" & txtMemberName.Text & "%' order by Name", con)
            rdr = cmd.ExecuteReader()
            listView1.Items.Clear()
            While rdr.Read()
                Dim item = New ListViewItem()
                item.Text = rdr(0).ToString().Trim()
                item.SubItems.Add(rdr(1).ToString().Trim())
                item.SubItems.Add(rdr(2).ToString().Trim())
                item.SubItems.Add(rdr(3).ToString().Trim())
                listView1.Items.Add(item)
            End While
            For i = 0 To listView1.Items.Count - 1
                listView1.Items(i).Checked = True
            Next
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub txtMemberID_TextChanged(sender As System.Object, e As System.EventArgs) Handles txtMemberID.TextChanged
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("Select RTRIM(MemberID),RTRIM(Name),RTRIM(Address),RTRIM(ContactNo) from LoyaltyMember where MemberID like '" & txtMemberID.Text & "%'  order by Name", con)
            rdr = cmd.ExecuteReader()
            listView1.Items.Clear()
            While rdr.Read()
                Dim item = New ListViewItem()
                item.Text = rdr(0).ToString().Trim()
                item.SubItems.Add(rdr(1).ToString().Trim())
                item.SubItems.Add(rdr(2).ToString().Trim())
                item.SubItems.Add(rdr(3).ToString().Trim())
                listView1.Items.Add(item)
            End While
            For i = 0 To listView1.Items.Count - 1
                listView1.Items(i).Checked = True
            Next
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Sub GetData()
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("Select RTRIM(MemberID),RTRIM(Name),RTRIM(Address),RTRIM(ContactNo) from LoyaltyMember order by Name", con)
            rdr = cmd.ExecuteReader()
            listView1.Items.Clear()
            While rdr.Read()
                Dim item = New ListViewItem()
                item.Text = rdr(0).ToString().Trim()
                item.SubItems.Add(rdr(1).ToString().Trim())
                item.SubItems.Add(rdr(2).ToString().Trim())
                item.SubItems.Add(rdr(3).ToString().Trim())
                listView1.Items.Add(item)
            End While
            For i = 0 To listView1.Items.Count - 1
                listView1.Items(i).Checked = True
            Next
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Sub GetInfo()
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = con.CreateCommand()
            cmd.CommandText = "SELECT RTRIM(CompanyName) from Company"
            rdr = cmd.ExecuteReader()
            If rdr.Read() Then
                txtHotelName.Text = rdr.GetValue(0)
            End If
            If (rdr IsNot Nothing) Then
                rdr.Close()
            End If
            If con.State = ConnectionState.Open Then
                con.Close()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub
    Private Sub frmPrintCard_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        GetData()
        GetInfo()
    End Sub

    Private Sub txtHotelName_TextChanged(sender As Object, e As EventArgs) Handles txtHotelName.TextChanged

    End Sub

    Private Sub GroupBox2_Enter(sender As Object, e As EventArgs) Handles GroupBox2.Enter

    End Sub

    Private Sub GroupBox1_Enter(sender As Object, e As EventArgs) Handles GroupBox1.Enter

    End Sub
End Class