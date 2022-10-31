Imports System.Data.SqlClient
Imports System.Security.Cryptography
Imports System.IO
Imports System.Text
Public Class frmActivation
    Private Sub btnSave_Click(sender As System.Object, e As System.EventArgs) Handles btnSave.Click
        Try
            If txtHardwareID.Text = "" Then
                MessageBox.Show("Please enter hardware id", "", MessageBoxButtons.OK, MessageBoxIcon.Warning)
                txtHardwareID.Focus()
                Exit Sub
            End If
            Dim st As String = (txtHardwareID.Text)
            txtActivationID.Text = Encryption.MakePassword(st, 653)
        Catch ex As Exception
            MessageBox.Show(ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub frmActivation_FormClosing(sender As System.Object, e As System.Windows.Forms.FormClosingEventArgs) Handles MyBase.FormClosing
        End
    End Sub

    Private Sub frmActivation_Load(sender As System.Object, e As System.EventArgs) Handles MyBase.Load

    End Sub
End Class
