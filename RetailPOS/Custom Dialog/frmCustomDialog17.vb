﻿Public Class frmCustomDialog17

    Sub LogOut()
        Try
            frmBackOffice.Hide()
            Dim st As String = "Successfully logged out"
            LogFunc(lblUser.Text, st)
            Me.Hide()
            frmLogin.Show()
            frmLogin.UserID.Text = ""
            frmLogin.Password.PasswordChar = ""
            frmLogin.Password.Text = "ENTER PIN"
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.[Error])
        End Try
    End Sub
    Private Sub btnOK_Click(sender As System.Object, e As System.EventArgs) Handles btnOK.Click
        LogOut()
    End Sub

    Private Sub btnCancel_Click(sender As System.Object, e As System.EventArgs) Handles btnCancel.Click
        Me.Close()
    End Sub
End Class