Imports System.Data.SqlClient
Public Class frmLoyaltyCardMemberPoints
    Sub Reset()
        txtCardNo.Text = ""
        txtMemberName.Text = ""
        GetData()
    End Sub
    Sub GetData()
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("SELECT LoyaltyMember.MemberID,RTRIM(Name),RTRIM(CardNo),RTRIM(ContactNo),IsNull(sum(PointsEarned)-sum(PointsRedeem),0) FROM LoyaltyMember Left join LoyaltyMemberLedgerBook on LoyaltyMember.MemberID=LoyaltyMemberLedgerBook.MemberID group by LoyaltyMember.MemberID,name,ContactNo,CardNo order by Name", con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub
    Private Sub frmMemberBalance_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load
        GetData()
    End Sub

    Private Sub Button3_Click(sender As System.Object, e As System.EventArgs) Handles Button3.Click
        Try
            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("SELECT LoyaltyMember.MemberID,RTRIM(Name),RTRIM(CardNo),RTRIM(ContactNo),IsNull(sum(PointsEarned)-sum(PointsRedeem),0) FROM LoyaltyMember Left join LoyaltyMemberLedgerBook on LoyaltyMember.MemberID=LoyaltyMemberLedgerBook.MemberID where Name like '%" & txtMemberName.Text & "%' group by LoyaltyMember.MemberID,name,ContactNo,CardNo order by Name", con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub btnSearch_Click(sender As System.Object, e As System.EventArgs) Handles btnSearch.Click
        Try

            con = New SqlConnection(cs)
            con.Open()
            cmd = New SqlCommand("SELECT LoyaltyMember.MemberID,RTRIM(Name),RTRIM(CardNo),RTRIM(ContactNo),IsNull(sum(PointsEarned)-sum(PointsRedeem),0) FROM LoyaltyMember Left join LoyaltyMemberLedgerBook on LoyaltyMember.MemberID=LoyaltyMemberLedgerBook.MemberID where LoyaltyMember.CardNo like '%" & txtCardNo.Text & "%' group by LoyaltyMember.MemberID,name,ContactNo,CardNo order by Name", con)
            rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
            dgw.Rows.Clear()
            While (rdr.Read() = True)
                dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4))
            End While
            con.Close()
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub txtMemberID_KeyDown(sender As System.Object, e As System.Windows.Forms.KeyEventArgs) Handles txtCardNo.KeyDown
        Try
            If e.KeyCode = Keys.Enter Then
                con = New SqlConnection(cs)
                con.Open()
                cmd = New SqlCommand("SELECT LoyaltyMember.MemberID,RTRIM(Name),RTRIM(CardNo),RTRIM(ContactNo),IsNull(sum(PointsEarned)-sum(PointsRedeem),0) FROM LoyaltyMember Left join LoyaltyMemberLedgerBook on LoyaltyMember.MemberID=LoyaltyMemberLedgerBook.MemberID where LoyaltyMember.CardNo like '%" & txtCardNo.Text & "%' group by LoyaltyMember.MemberID,name,ContactNo,CardNo order by Name", con)
                rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection)
                dgw.Rows.Clear()
                While (rdr.Read() = True)
                    dgw.Rows.Add(rdr(0), rdr(1), rdr(2), rdr(3), rdr(4))
                End While
                con.Close()
            End If
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub Button1_Click(sender As System.Object, e As System.EventArgs) Handles btnScanCard.Click
        txtCardNo.Focus()
    End Sub

    Private Sub btnReset_Click(sender As System.Object, e As System.EventArgs) Handles btnReset.Click
        Reset()
    End Sub

    Private Sub dgw_MouseClick(sender As Object, e As System.Windows.Forms.MouseEventArgs) Handles dgw.MouseClick
        Try
            If dgw.Rows.Count > 0 Then
                If lblSet.Text = "POS" Then
                    Dim dr As DataGridViewRow = dgw.SelectedRows(0)
                    Me.Hide()
                    ' frmCards_POS.Hide()
                    frmPOS.Show()
                    frmPOS.lblMemberID.Text = dr.Cells(0).Value
                    frmPOS.txtMemberID.Text = dr.Cells(0).Value
                    frmPOS.txtLoyaltyPoints.ReadOnly = False
                    frmPOS.txtLoyaltyPoints.Text = dr.Cells(4).Value
                    frmPOS.lblMemberType.Text = "Loyalty Member"
                    frmPOS.LoyaltyKOTCalc()
                    frmPOS.lblMemberType.Visible = False
                End If

            End If
            lblSet.Text = ""
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub dgw_RowPostPaint(sender As Object, e As System.Windows.Forms.DataGridViewRowPostPaintEventArgs) Handles dgw.RowPostPaint
        Dim strRowNumber As String = (e.RowIndex + 1).ToString()
        Dim size As SizeF = e.Graphics.MeasureString(strRowNumber, Me.Font)
        If dgw.RowHeadersWidth < Convert.ToInt32((size.Width + 20)) Then
            dgw.RowHeadersWidth = Convert.ToInt32((size.Width + 20))
        End If
        Dim b As Brush = SystemBrushes.ButtonHighlight
        e.Graphics.DrawString(strRowNumber, Me.Font, b, e.RowBounds.Location.X + 15, e.RowBounds.Location.Y + ((e.RowBounds.Height - size.Height) / 2))
    End Sub
End Class