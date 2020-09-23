Attribute VB_Name = "Camera_Mod"
'
'Public Camera As TVCamera

Dim Ang As Single, AngY As Single
Public CameraAng As Single, CameraAngY As Single
Public GCamera As CameraGravity
Dim GetActorRot As D3DVECTOR
Public CameraPointY As D3DVECTOR
Public CameraHeight As Single, CameraFront As Single



Public Sub Camera_Init()
End Sub


Public Sub Camera_Update()

     
     AngY = AngY - (MY / 200)
   If AngY > ((22 / 7) * -0.1) Then

     AngY = ((22 / 7) * -0.1)

   End If
   If AngY < -((22 / 7) * 0.9) Then
     AngY = -((22 / 7) * 0.9)
   End If

CameraAngY = AngY
'-2.49
'If AngY > -2 Then CameraHeight = AngY * AngY * 13 Else CameraHeight = AngY * AngY * 7
If AngY > -2.5 Then CameraHeight = AngY * AngY * 12 Else CameraHeight = CameraHeight
'If AngY below 2 then make camerafrot or more
'If AngY > -2 Then CameraFront = CameraHeight * 1 Else CameraFront = CameraHeight * 1.5
If AngY > -2.9 Then CameraFront = CameraHeight * 1 Else CameraFront = CameraFront

MSG = AngY
Ang = Ang - (MX / 100)
Actor.SetRotation 0, 180 - Ang * 180 / 3.14, 0
Actor.SetName Ang

GCamera.Ang = Ang

CameraPoint.SetPosition Actor.GetPosition.x, Actor.GetPosition.y, Actor.GetPosition.z
Actor.GetRotation GetActorRot.x, GetActorRot.y, GetActorRot.z
CameraPoint.SetRotation GetActorRot.x, GetActorRot.y, GetActorRot.z
'CameraPoint.MoveRelative 0, 38 + CameraHeight, 30
CameraPoint.MoveRelative 0, 20 + CameraHeight, 150 - CameraFront
GCamera.x = CameraPoint.GetPosition.x
GCamera.y = CameraPoint.GetPosition.y
GCamera.z = CameraPoint.GetPosition.z

CameraPointY.x = Actor.GetPosition.x
CameraPointY.y = Actor.GetPosition.y + 50
CameraPointY.z = Actor.GetPosition.z

''Scene.GetCamera.SetLookAt CameraPointY.x, CameraPointY.y, CameraPointY.z
''Scene.GetCamera.RotateY Sin(AngY)
'''Scene.SetCamera GCamera.x, GCamera.y, GCamera.z, GCamera.x + Cos(GCamera.Ang), Scene.GetCamera.GetLookAt.y, GCamera.z + Sin(GCamera.Ang)



Scene.SetCamera GCamera.x, GCamera.y, GCamera.z, GCamera.x + Cos(GCamera.Ang), GCamera.y + Cos(AngY), GCamera.z + Sin(GCamera.Ang)
'CameraAng = GCamera.Ang

End Sub



