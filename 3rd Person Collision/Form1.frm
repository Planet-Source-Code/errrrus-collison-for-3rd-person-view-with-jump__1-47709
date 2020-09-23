VERSION 5.00
Begin VB.Form Form1 
   Caption         =   "Form1"
   ClientHeight    =   5685
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6525
   LinkTopic       =   "Form1"
   ScaleHeight     =   5685
   ScaleWidth      =   6525
   StartUpPosition =   1  'CenterOwner
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Resize()
TV.ResizeDevice
End Sub

Private Sub Form_Unload(Cancel As Integer)
UnloadEverything
End Sub
