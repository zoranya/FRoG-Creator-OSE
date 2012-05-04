VERSION 5.00
Object = "{F9043C88-F6F2-101A-A3C9-08002B2F49FB}#1.2#0"; "comdlg32.ocx"
Begin VB.Form frmOptInfoBulle 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Options des Infos Bulles"
   ClientHeight    =   2640
   ClientLeft      =   45
   ClientTop       =   390
   ClientWidth     =   5250
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2640
   ScaleWidth      =   5250
   StartUpPosition =   2  'CenterScreen
   Begin MSComDlg.CommonDialog cmd 
      Left            =   4320
      Top             =   2160
      _ExtentX        =   847
      _ExtentY        =   847
      _Version        =   393216
   End
   Begin VB.CommandButton sauv 
      Caption         =   "Sauvegarder"
      Height          =   255
      Left            =   1440
      TabIndex        =   6
      Top             =   2280
      Width           =   2175
   End
   Begin VB.Frame Frame1 
      Caption         =   "Messages � afficher"
      BeginProperty Font 
         Name            =   "Segoe UI"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   2055
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   5055
      Begin VB.CheckBox mt 
         Caption         =   "Tout les messages"
         Height          =   195
         Left            =   240
         TabIndex        =   7
         Top             =   480
         Width           =   2175
      End
      Begin VB.PictureBox acoul 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   4080
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   5
         ToolTipText     =   "Cliquez pour modifier"
         Top             =   1320
         Width           =   495
      End
      Begin VB.PictureBox jcoul 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         BorderStyle     =   0  'None
         ForeColor       =   &H80000008&
         Height          =   495
         Left            =   4080
         ScaleHeight     =   495
         ScaleWidth      =   495
         TabIndex        =   4
         ToolTipText     =   "Cliquez pour modifier"
         Top             =   480
         Width           =   495
      End
      Begin VB.CheckBox ma 
         Caption         =   "Messages sur les admins"
         Height          =   195
         Left            =   240
         TabIndex        =   3
         Top             =   1200
         Width           =   2175
      End
      Begin VB.CheckBox mer 
         Caption         =   "Messages sur les erreurs"
         Height          =   195
         Left            =   240
         TabIndex        =   2
         Top             =   1560
         Width           =   2175
      End
      Begin VB.CheckBox mj 
         Caption         =   "Messages sur les joueurs"
         Height          =   195
         Left            =   240
         TabIndex        =   1
         Top             =   840
         Width           =   2175
      End
   End
End
Attribute VB_Name = "frmOptInfoBulle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub acoul_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
    cmd.Flags = &H2& + &H1&
    cmd.ShowColor
    If cmd.Color > -1 And cmd.Color <> RGB(255, 255, 255) Then acoul.BackColor = cmd.Color
End If
End Sub


Private Sub jcoul_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If Button = 1 Then
    cmd.Flags = &H2& + &H1&
    cmd.ShowColor
    If cmd.Color > -1 And cmd.Color <> RGB(255, 255, 255) Then jcoul.BackColor = cmd.Color
End If
End Sub

Private Sub ma_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If ma.Value = Checked Then IBAdmin = False: mt.Value = Unchecked: mt.Refresh: IBTout = False Else IBAdmin = True
End Sub

Private Sub mer_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If mer.Value = Checked Then IBErr = False: mt.Value = Unchecked: mt.Refresh: IBTout = False Else IBErr = True
End Sub

Private Sub mj_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If mj.Value = Checked Then IBJoueur = False: mt.Value = Unchecked: mt.Refresh: IBTout = False Else IBJoueur = True
End Sub

Private Sub mt_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
If mt.Value = Unchecked Then ma.Value = Checked: mer.Value = Checked: mj.Value = Checked: mj.Refresh: ma.Refresh: mer.Refresh
If mt.Value = Checked Then IBTout = False Else IBTout = True: IBJoueur = True: IBAdmin = True: IBErr = True
End Sub

Private Sub sauv_Click()
IBCJoueur = jcoul.BackColor
IBCAdmin = acoul.BackColor
Call SauvIBOpt
Unload Me
End Sub
