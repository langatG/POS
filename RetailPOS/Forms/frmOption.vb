
Public Class frmOption
    Private Sub Button2_Click(sender As System.Object, e As System.EventArgs) Handles btnFrontOffice.Click

        Me.Hide()
        frmPOSOpening.Show()
        frmPOSOpening.txtUserID.Text = lblUser.Text
        frmPOSOpening.txtOpeningAmount.Focus()
    End Sub
  
    Private Sub btnBackOffice_Click(sender As System.Object, e As System.EventArgs) Handles btnBackOffice.Click
        frmBackOffice.lblUser.Text = lblUser.Text
        Me.Hide()
        frmBackOffice.Show()
    End Sub
   
    Private Sub frmOption_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

        BackColor = Color.Coral
        TransparencyKey = BackColor
    End Sub

    Private Sub btnCancel_Click(sender As System.Object, e As System.EventArgs) Handles btnCancel.Click
        End
    End Sub
End Class