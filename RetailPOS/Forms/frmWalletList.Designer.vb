﻿<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmWalletList
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmWalletList))
        Me.flpTables = New System.Windows.Forms.FlowLayoutPanel()
        Me.Label5 = New System.Windows.Forms.Label()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.lblSet = New System.Windows.Forms.Label()
        Me.SuspendLayout()
        '
        'flpTables
        '
        Me.flpTables.Anchor = CType((((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Bottom) _
            Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.flpTables.AutoScroll = True
        Me.flpTables.BackColor = System.Drawing.Color.White
        Me.flpTables.Location = New System.Drawing.Point(0, 56)
        Me.flpTables.Name = "flpTables"
        Me.flpTables.Size = New System.Drawing.Size(817, 377)
        Me.flpTables.TabIndex = 4
        '
        'Label5
        '
        Me.Label5.Anchor = CType(((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Left) _
            Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.Label5.BackColor = System.Drawing.Color.Indigo
        Me.Label5.Font = New System.Drawing.Font("Segoe UI Semibold", 20.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label5.ForeColor = System.Drawing.Color.White
        Me.Label5.Location = New System.Drawing.Point(1, 1)
        Me.Label5.Name = "Label5"
        Me.Label5.Size = New System.Drawing.Size(762, 50)
        Me.Label5.TabIndex = 390
        Me.Label5.Text = "List of Wallets"
        Me.Label5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter
        '
        'btnClose
        '
        Me.btnClose.Anchor = CType((System.Windows.Forms.AnchorStyles.Top Or System.Windows.Forms.AnchorStyles.Right), System.Windows.Forms.AnchorStyles)
        Me.btnClose.BackColor = System.Drawing.Color.Transparent
        Me.btnClose.DialogResult = System.Windows.Forms.DialogResult.Cancel
        Me.btnClose.FlatAppearance.BorderSize = 0
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.25!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.Image = Global.RetailPOS.My.Resources.Resources.Button_Delete_icon1
        Me.btnClose.Location = New System.Drawing.Point(761, 2)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(52, 49)
        Me.btnClose.TabIndex = 392
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.UseVisualStyleBackColor = False
        '
        'lblSet
        '
        Me.lblSet.AutoSize = True
        Me.lblSet.Location = New System.Drawing.Point(46, 22)
        Me.lblSet.Name = "lblSet"
        Me.lblSet.Size = New System.Drawing.Size(23, 13)
        Me.lblSet.TabIndex = 3
        Me.lblSet.Text = "Set"
        Me.lblSet.Visible = False
        '
        'frmWalletList
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(817, 433)
        Me.Controls.Add(Me.lblSet)
        Me.Controls.Add(Me.btnClose)
        Me.Controls.Add(Me.Label5)
        Me.Controls.Add(Me.flpTables)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Icon = CType(resources.GetObject("$this.Icon"), System.Drawing.Icon)
        Me.Name = "frmWalletList"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "Tables"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents flpTables As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Label5 As System.Windows.Forms.Label
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents lblSet As System.Windows.Forms.Label
End Class
