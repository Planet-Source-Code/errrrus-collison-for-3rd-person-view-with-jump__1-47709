Attribute VB_Name = "Input_Mod"
Dim KeyDown_Space As Boolean, KeyDown_Down As Boolean


Public MX As Long, MY As Long, B1 As Integer, B2 As Integer, B3 As Integer


Public Sub InputCheck()
Inp.GetMouseState MX, MY, B1, B2

With Inp

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''Movement''''''''''''''''''''''''''''''''
If .IsKeyPressed(TV_KEY_UPARROW) = True Then Actor_Mod.Actor_Pressed_Up
'If Inp.IsKeyPressed(TV_KEY_DOWNARROW) = True Then Actor_Mod.Actor_Pressed_Down
If .IsKeyPressed(TV_KEY_LEFTARROW) = True Then Actor_Mod.Actor_Pressed_Left
If .IsKeyPressed(TV_KEY_RIGHTARROW) = True Then Actor_Mod.Actor_Pressed_Right
'If Inp.IsKeyPressed(TV_KEY_SPACE) = True Then Actor_Mod.Actor_Pressed_Jump


If .IsKeyPressed(TV_KEY_DOWNARROW) = True And KeyDown_Down = False Then
KeyDown_Down = True
Actor_Mod.Actor_Pressed_Down False
ElseIf .IsKeyPressed(TV_KEY_DOWNARROW) = False And KeyDown_Down = True Then
KeyDown_Down = False
ElseIf .IsKeyPressed(TV_KEY_DOWNARROW) = True And KeyDown_Down = True Then
Actor_Mod.Actor_Pressed_Down True
End If

''''''''''So that space can not be held down
'If Inp.IsKeyPressed(TV_KEY_SPACE) = True And KeyDown_Space = False Then
'KeyDown_Space = True
'>>>>>>>>>>>>>>>>Actor_Mod.Actor_Pressed_Jump
'ElseIf .IsKeyPressed(TV_KEY_SPACE) = False And KeyDown_Space = True Then
'KeyDown_Space = False
'End If

If B2 <> 0 And KeyDown_Space = False Then Actor_Mod.Actor_Pressed_Jump



'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''Movements disabled''''''''''''''''''''
If .IsKeyPressed(TV_KEY_UPARROW) = False Then pUp = False
If .IsKeyPressed(TV_KEY_DOWNARROW) = False Then pDown = False
If .IsKeyPressed(TV_KEY_LEFTARROW) = False Then pLeft = False
If .IsKeyPressed(TV_KEY_RIGHTARROW) = False Then pRight = False
'If .IsKeyPressed(TV_KEY_SPACE) = False Then
'If .IsKeyPressed(TV_KEY_Z) = False Then
If B2 <> 1 Then pJump = False

Actor_Mod.Actor_False_Check


'''''''''''


'''''''''''


If .IsKeyPressed(TV_KEY_1) = True Then Scene.SetRenderMode TV_LINE
If .IsKeyPressed(TV_KEY_2) = True Then Scene.SetRenderMode TV_POINT
If .IsKeyPressed(TV_KEY_3) = True Then Scene.SetRenderMode TV_SOLID

If .IsKeyPressed(TV_KEY_S) = True Then TV.ScreenShot "C:\screentshot.bmp"



If .IsKeyPressed(TV_KEY_Z) = True Then
    If TimeE >= 1 Then
        BulletMod.Bullet_Shoot
        pShoot = True
        TimeE = 0
    Else
        TimeE = TimeE + TV.AccurateTimeElapsed * 0.003
    'TimeE = TimeE + 0.05
    End If
End If

End With
End Sub

