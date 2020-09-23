Attribute VB_Name = "Initialize"
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'3rd Person Collision Detection (Mesh Collision)  with Jump
'
'I hope u can use this. I took this out directly from my game.
'I took alot of stuff that u don't need out. For example Automated Mesh loading.
'You are free to use any of this code but if u use the camera code plz
'at least tell me.
'
'All of the collision Code are in the Actor_Mod module.
'The sub WalkoverMesh in that module makes the actor walk on the wall.
'ANd when ever he presses left or right the sub Actor_Pressed_Up gets activated.
'And There it checks all the collision and thats kinda it.
'If u have any question or suggestion email me.
'
'By Pavel
'Mail: shah_pavel@hotmail.com
'http://www.geocities.com/shah_pavel/
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public TV As TVEngine
Public Scene As TVScene
Public Scr As TVScreen2DImmediate
Public ScrFont As TVScreen2DText
Public TexFactory As TVTextureFactory
Public Inp As TVInputEngine
Public Everything(5) As TVMesh
Public CameraPoint As TVMesh
Public CollisionMesh As TVMesh
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Dim mWidth As Long, mHeight As Long
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public MSG As String


Public Sub Main()
 On Error Resume Next

DoEvents
Set TV = New TVEngine
If TV.ShowDriverDialog = False Then End
TV.SetDebugFile App.Path & "\Debug.txt"
TV.Init3DWindowedMode (Form1.hWnd)

TV.DisplayFPS = True
TV.SetSearchDirectory App.Path
TV.SetVSync True
TV.GetVideoMode mWidth, mHeight, 0  'For the shooting cursor
TV.SetAngleSystem (TrueVision3D.CONST_TV_ANGLE.TV_ANGLE_DEGREE)


Form1.Show

'TV.VideoRecordInit "Video.avi", 10
Set Inp = New TVInputEngine
Set Scene = New TVScene
Set Scr = New TVScreen2DImmediate
Set ScrFont = New TVScreen2DText
Set TexFactory = New TVTextureFactory


Scene.SetViewFrustum 50, 2000

Land_Init
Actor_Init
Camera_Init




Set Everything(0) = Scene.CreateMeshBuilder
Everything(0).SetMeshName "Everything"
Everything(0).LoadXFile "stairs.x"
Everything(0).SetMaterial 0
Everything(0).SetPosition 900, 15, 1000 '.x
Everything(0).ScaleMesh 10, 2, 3
Set Everything(1) = Everything(0).DuplicateMesh
Everything(1).SetPosition 900, 90, 800
Set Everything(2) = Everything(0).DuplicateMesh
Everything(2).SetPosition 900, 160, 600
Set Everything(3) = Everything(0).DuplicateMesh
Everything(3).SetRotation 0, 180, 0
Everything(3).SetPosition 900, 200, 1200
Set Everything(4) = Everything(0).DuplicateMesh
Everything(4).SetPosition 900, 300, 800
Set Everything(5) = Everything(0).DuplicateMesh
Everything(5).SetPosition 900, 400, 400


Set CameraPoint = Scene.CreateMeshBuilder
CameraPoint.CreateBox 5, 5, 5
CameraPoint.SetPosition 0, 0, 0
CameraPoint.SetCollisionEnable False


Set CollisionMesh = Scene.CreateMeshBuilder
CollisionMesh.CreateBox 5, 5, 5
CollisionMesh.SetCollisionEnable False

Do
     DoEvents
     TV.Clear
     Camera_Update
Render

     TV.RenderToScreen

InputCheck

Loop Until Inp.IsKeyPressed(TV_KEY_ESCAPE) = True
UnloadEverything
End Sub

Public Sub UnloadEverything()
Unload Form1
Set TV = Nothing
Set Scene = Nothing
Set Actor = Nothing
Set Camera = Nothing
Set Land = Nothing
Set TexFactory = Nothing
Set Inp = Nothing
Set Scr = Nothing
Set ScrFont = Nothing
End Sub



Public Sub Render()
Land_Render

Everything(0).Render
Everything(1).Render
Everything(2).Render
Everything(3).Render
Everything(4).Render
Everything(5).Render

Actor_Update
End Sub

