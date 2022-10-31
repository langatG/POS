<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmLoyaltyCard
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
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(frmLoyaltyCard))
        Me.lblUser = New System.Windows.Forms.Label()
        Me.btnMemberLedger = New System.Windows.Forms.Button()
        Me.btnClose = New System.Windows.Forms.Button()
        Me.btnLoyaltySetting = New System.Windows.Forms.Button()
        Me.btnPrintCards = New System.Windows.Forms.Button()
        Me.btnAddMember = New System.Windows.Forms.Button()
        Me.SuspendLayout()
        '
        'lblUser
        '
        Me.lblUser.AutoSize = True
        Me.lblUser.Font = New System.Drawing.Font("Segoe UI", 8.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.lblUser.ForeColor = System.Drawing.Color.Black
        Me.lblUser.Location = New System.Drawing.Point(12, 4)
        Me.lblUser.Name = "lblUser"
        Me.lblUser.Size = New System.Drawing.Size(43, 13)
        Me.lblUser.TabIndex = 321
        Me.lblUser.Text = "lblUser"
        Me.lblUser.Visible = False
        '
        'btnMemberLedger
        '
        Me.btnMemberLedger.AutoSize = True
        Me.btnMemberLedger.BackColor = System.Drawing.Color.Indigo
        Me.btnMemberLedger.FlatAppearance.BorderSize = 0
        Me.btnMemberLedger.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnMemberLedger.Font = New System.Drawing.Font("Segoe UI Semibold", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnMemberLedger.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnMemberLedger.Image = CType(resources.GetObject("btnMemberLedger.Image"), System.Drawing.Image)
        Me.btnMemberLedger.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnMemberLedger.Location = New System.Drawing.Point(238, 131)
        Me.btnMemberLedger.Name = "btnMemberLedger"
        Me.btnMemberLedger.Size = New System.Drawing.Size(217, 65)
        Me.btnMemberLedger.TabIndex = 324
        Me.btnMemberLedger.Text = "Member Ledger"
        Me.btnMemberLedger.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btnMemberLedger.UseVisualStyleBackColor = False
        '
        'btnClose
        '
        Me.btnClose.BackColor = System.Drawing.Color.Transparent
        Me.btnClose.Cursor = System.Windows.Forms.Cursors.Hand
        Me.btnClose.FlatAppearance.BorderSize = 0
        Me.btnClose.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnClose.Font = New System.Drawing.Font("Microsoft Sans Serif", 9.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnClose.Image = CType(resources.GetObject("btnClose.Image"), System.Drawing.Image)
        Me.btnClose.Location = New System.Drawing.Point(424, 1)
        Me.btnClose.Name = "btnClose"
        Me.btnClose.Size = New System.Drawing.Size(37, 36)
        Me.btnClose.TabIndex = 322
        Me.btnClose.TextAlign = System.Drawing.ContentAlignment.MiddleRight
        Me.btnClose.UseVisualStyleBackColor = False
        '
        'btnLoyaltySetting
        '
        Me.btnLoyaltySetting.AutoSize = True
        Me.btnLoyaltySetting.BackColor = System.Drawing.Color.Indigo
        Me.btnLoyaltySetting.FlatAppearance.BorderSize = 0
        Me.btnLoyaltySetting.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnLoyaltySetting.Font = New System.Drawing.Font("Segoe UI Semibold", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnLoyaltySetting.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnLoyaltySetting.Image = CType(resources.GetObject("btnLoyaltySetting.Image"), System.Drawing.Image)
        Me.btnLoyaltySetting.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnLoyaltySetting.Location = New System.Drawing.Point(15, 60)
        Me.btnLoyaltySetting.Name = "btnLoyaltySetting"
        Me.btnLoyaltySetting.Size = New System.Drawing.Size(217, 65)
        Me.btnLoyaltySetting.TabIndex = 52
        Me.btnLoyaltySetting.Text = "Loyalty Setting"
        Me.btnLoyaltySetting.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btnLoyaltySetting.UseVisualStyleBackColor = False
        '
        'btnPrintCards
        '
        Me.btnPrintCards.AutoSize = True
        Me.btnPrintCards.BackColor = System.Drawing.Color.Indigo
        Me.btnPrintCards.FlatAppearance.BorderSize = 0
        Me.btnPrintCards.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnPrintCards.Font = New System.Drawing.Font("Segoe UI Semibold", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnPrintCards.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnPrintCards.Image = CType(resources.GetObject("btnPrintCards.Image"), System.Drawing.Image)
        Me.btnPrintCards.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnPrintCards.Location = New System.Drawing.Point(15, 131)
        Me.btnPrintCards.Name = "btnPrintCards"
        Me.btnPrintCards.Size = New System.Drawing.Size(217, 65)
        Me.btnPrintCards.TabIndex = 51
        Me.btnPrintCards.Text = "Print Cards"
        Me.btnPrintCards.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btnPrintCards.UseVisualStyleBackColor = False
        '
        'btnAddMember
        '
        Me.btnAddMember.AutoSize = True
        Me.btnAddMember.BackColor = System.Drawing.Color.Indigo
        Me.btnAddMember.FlatAppearance.BorderSize = 0
        Me.btnAddMember.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnAddMember.Font = New System.Drawing.Font("Segoe UI Semibold", 14.25!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnAddMember.ForeColor = System.Drawing.SystemColors.ButtonHighlight
        Me.btnAddMember.Image = CType(resources.GetObject("btnAddMember.Image"), System.Drawing.Image)
        Me.btnAddMember.ImageAlign = System.Drawing.ContentAlignment.TopCenter
        Me.btnAddMember.Location = New System.Drawing.Point(238, 60)
        Me.btnAddMember.Name = "btnAddMember"
        Me.btnAddMember.Size = New System.Drawing.Size(217, 65)
        Me.btnAddMember.TabIndex = 28
        Me.btnAddMember.Text = "Add Member"
        Me.btnAddMember.TextAlign = System.Drawing.ContentAlignment.BottomCenter
        Me.btnAddMember.UseVisualStyleBackColor = False
        '
        'frmLoyaltyCard
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.BackColor = System.Drawing.Color.White
        Me.ClientSize = New System.Drawing.Size(462, 210)
        Me.Controls.Add(Me.btnMemberLedger)
        Me.Controls.Add(Me.btnClose)
        Me.Controls.Add(Me.lblUser)
        Me.Controls.Add(Me.btnLoyaltySetting)
        Me.Controls.Add(Me.btnPrintCards)
        Me.Controls.Add(Me.btnAddMember)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None
        Me.Name = "frmLoyaltyCard"
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "frmSettings"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents btnAddMember As System.Windows.Forms.Button
    Friend WithEvents btnPrintCards As System.Windows.Forms.Button
    Friend WithEvents btnLoyaltySetting As System.Windows.Forms.Button
    Friend WithEvents lblUser As System.Windows.Forms.Label
    Friend WithEvents btnClose As System.Windows.Forms.Button
    Friend WithEvents btnMemberLedger As System.Windows.Forms.Button
End Class
