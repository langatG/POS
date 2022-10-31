Imports System.Data.SqlClient
Imports System.Text.RegularExpressions

Public Class frmLoyaltySetting
    Dim st1 As String
    Sub Reset()
        txtAmount.Text = ""
        txtPoint.Text = ""
        txtLoyaltyName.Text = ""
        txtLoyaltyName.Focus()
        btnSave.Enabled = True
        btnUpdate.Enabled = False
        btnDelete.Enabled = False
        Getdata()
    End Sub

    Private Sub DeleteRecord()
        Try
            Dim RowsAffected As Integer = 0
            con = New SqlConnection(cs)
            con.Open()
            Dim cq As String = "delete from LoyaltySetting where LoyaltyName=@d1"
            cmd = New SqlCommand(cq)
            cmd.Parameters.AddWithValue("@d1", txtLoyaltyName.Text)
            cmd.Connection = con
            RowsAffected = cmd.ExecuteNonQuery()
            If RowsAffected > 0 Then
                MessageBox.Show("Successfully deleted", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)
                Getdata()
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

    Public Sub Getdata()
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("SELECT RTRIM(Loyaltyname),Amount,Points from LoyaltySetting order by LoyaltyName", con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub


    'Private Sub dgw_RowPostPaint(ByVal sender As Object, ByVal e As System.Windows.Forms.DataGridViewRowPostPaintEventArgs) Handles dgw.RowPostPaint
    '    Dim strRowNumber As String = (e.RowIndex + 1).ToString()
    '    Dim size As SizeF = e.Graphics.MeasureString(strRowNumber, Me.Font)
    '    If dgw.RowHeadersWidth < Convert.ToInt32((size.Width + 20)) Then
    '        dgw.RowHeadersWidth = Convert.ToInt32((size.Width + 20))
    '    End If
    '    Dim b As Brush = SystemBrushes.ButtonHighlight
    '    e.Graphics.DrawString(strRowNumber, Me.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2))

    'End Sub

    Private Sub frmMember_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Getdata()
    End Sub

    Private Sub dgw_MouseClick(ByVal sender As System.Object, ByVal e As System.Windows.Forms.MouseEventArgs) Handles dgw.MouseClick
        Try
            If dgw.Rows.Count > 0 Then
                Dim dr As DataGridViewRow = dgw.SelectedRows(0)
                txtLoyaltyName.Text = dr.Cells(0).Value.ToString()
                txtLName.Text = dr.Cells(0).Value.ToString()
                txtPoint.Text = (dr.Cells(2).Value.ToString())
                txtAmount.Text = (dr.Cells(1).Value.ToString())
                btnUpdate.Enabled = True
                btnDelete.Enabled = True
                btnSave.Enabled = False
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnClose_Click_1(sender As System.Object, e As System.EventArgs)
        Me.Close()
    End Sub



    Private Sub btnUpdate_Click(sender As System.Object, e As System.EventArgs) Handles btnUpdate.Click
        If txtLoyaltyName.Text = "" Then
            MessageBox.Show("Please enter loyalty name", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtLoyaltyName.Focus()
            Return
        End If
        If txtAmount.Text = "" Then
            MessageBox.Show("Please enter amount", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtAmount.Focus()
            Return
        End If
        If txtPoint.Text = "" Then
            MessageBox.Show("Please enter point", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        If Val(txtPoint.Text) = 0 Then
            MessageBox.Show("Point must be greater than zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        If Val(txtAmount.Text) = 0 Then
            MessageBox.Show("Amount must be greater than zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim cb As String = "Update LoyaltySetting set LoyaltyName=@d1, Amount=@d2, Points=@d3 where Loyaltyname=@d4"
            cmd = New SqlCommand(cb)
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@d1", txtLoyaltyName.Text)
            cmd.Parameters.AddWithValue("@d2", Val(txtAmount.Text))
            cmd.Parameters.AddWithValue("@d3", Val(txtPoint.Text))
            cmd.Parameters.AddWithValue("@d4", txtLName.Text)
            cmd.ExecuteReader()
            con.Close()
            MessageBox.Show("Successfully updated", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)
            btnUpdate.Enabled = False
            Reset()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub Button2_Click(sender As System.Object, e As System.EventArgs) Handles btnDelete.Click
        Try
            If MessageBox.Show("Do you really want to delete this record?", "Confirmation", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) = Windows.Forms.DialogResult.Yes Then
                DeleteRecord()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub btnSave_Click(sender As System.Object, e As System.EventArgs) Handles btnSave.Click
        If txtLoyaltyName.Text = "" Then
            MessageBox.Show("Please enter loyalty name", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtLoyaltyName.Focus()
            Return
        End If
        If txtAmount.Text = "" Then
            MessageBox.Show("Please enter amount", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtAmount.Focus()
            Return
        End If
        If txtPoint.Text = "" Then
            MessageBox.Show("Please enter point", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        If Val(txtPoint.Text) = 0 Then
            MessageBox.Show("Point must be greater than zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        If Val(txtAmount.Text) = 0 Then
            MessageBox.Show("Amount must be greater than zero", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
            txtPoint.Focus()
            Return
        End If
        Try
            con = New SqlConnection(cs)
            con.Open()
            Dim ct As String = "select count(*) from LoyaltySetting Having count(*) >= 1"
            cmd = New SqlCommand(ct)
            cmd.Connection = con
            rdr = cmd.ExecuteReader()
            If rdr.Read Then
                MessageBox.Show("Setting Already Exists" & vbCrLf & "please update the existing setting", "Info", MessageBoxButtons.OK, MessageBoxIcon.Information)
                If Not rdr Is Nothing Then
                    rdr.Close()
                End If
                Exit Sub
            End If
            con = New SqlConnection(cs)
            con.Open()
            Dim cb As String = "insert into LoyaltySetting(LoyaltyName,Amount,Points) VALUES (@d1,@d2,@d3)"
            cmd = New SqlCommand(cb)
            cmd.Connection = con
            cmd.Parameters.AddWithValue("@d1", txtLoyaltyName.Text)
            cmd.Parameters.AddWithValue("@d2", Val(txtAmount.Text))
            cmd.Parameters.AddWithValue("@d3", Val(txtPoint.Text))
            cmd.ExecuteReader()
            con.Close()
            MessageBox.Show("Successfully saved", "Record", MessageBoxButtons.OK, MessageBoxIcon.Information)
            btnSave.Enabled = False
            Reset()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub

    Private Sub btnNew_Click(sender As System.Object, e As System.EventArgs) Handles btnNew.Click
        Reset()
    End Sub
    Private Sub txtAmount_KeyPress(sender As System.Object, e As System.Windows.Forms.KeyPressEventArgs) Handles txtAmount.KeyPress
        Dim keyChar = e.KeyChar

        If Char.IsControl(keyChar) Then
            'Allow all control characters.
        ElseIf Char.IsDigit(keyChar) OrElse keyChar = "."c Then
            Dim text = Me.txtAmount.Text
            Dim selectionStart = Me.txtAmount.SelectionStart
            Dim selectionLength = Me.txtAmount.SelectionLength

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

    Private Sub txtPoint_KeyPress(sender As System.Object, e As System.Windows.Forms.KeyPressEventArgs) Handles txtPoint.KeyPress
        If (e.KeyChar < Chr(48) Or e.KeyChar > Chr(57)) And e.KeyChar <> Chr(8) Then
            e.Handled = True
        End If
    End Sub

    Private Sub btnClose_Click(sender As Object, e As EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub
End Class
