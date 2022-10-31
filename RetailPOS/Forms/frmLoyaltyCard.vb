Public Class frmLoyaltyCard


    Private Sub btnClose_Click(sender As System.Object, e As System.EventArgs) Handles btnClose.Click
        Me.Close()
    End Sub

    Private Sub btnAddMember_Click(sender As System.Object, e As System.EventArgs) Handles btnAddMember.Click
        frmLoyaltyMember.Reset()
        frmLoyaltyMember.lblUser.Text = lblUser.Text
        frmLoyaltyMember.ShowDialog()
    End Sub

    Private Sub btnAddFunds_Click(sender As System.Object, e As System.EventArgs) Handles btnLoyaltySetting.Click
        frmLoyaltySetting.Reset()
        frmLoyaltySetting.ShowDialog()
    End Sub
    Private Sub btnPrintCards_Click(sender As System.Object, e As System.EventArgs) Handles btnPrintCards.Click
        frmPrintLoyaltyCard.Reset()
        frmPrintLoyaltyCard.ShowDialog()
    End Sub

    Private Sub btnMemberLedger_Click(sender As System.Object, e As System.EventArgs) Handles btnMemberLedger.Click
        frmLoyaltyCardMemberLedgers.Reset()
        frmLoyaltyCardMemberLedgers.ShowDialog()
    End Sub
End Class