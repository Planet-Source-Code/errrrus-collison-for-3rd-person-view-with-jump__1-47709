Attribute VB_Name = "Environment_Mesh"
Public Mesh(1 To 100) As New TVMesh
Public CollisionFound As Boolean
Public MeshAmount As Single
Private From As D3DVECTOR, DestinationC As D3DVECTOR
Public LastNonDuplicte As Single
'''''''''''''''''''''''''Copy'''''''''''''''''''''''''''''
Public DB                       As Database
Public rstInfo                  As Recordset
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Public CollisionDetection As String



Public Sub Map_Read()
Dim PossitionArray  'Position and scale for the meshes
Dim Map 'Everything else for the meshes
Dim MapS 'Everything for the Shaders
Dim Size
'''''''''''''''''''''''''''''Copy'''''''''''''''''''''''
Set DB = OpenDatabase(App.LogPath & "Models.mdb")


Set rstInfo = DB.OpenRecordset("Models ID")
With rstInfo
'If .RecordCount = 0 Then Exit Sub

'''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''Load Meshes'''''''''''''''''
Open "Map\2Meshes.txt" For Input As #1 'Open File
Line Input #1, strline
MeshAmount = strline
For i = 1 To strline
Line Input #1, strline 'Read Line 1 into strLine
Map = Split(strline, "||")
Set Mesh(i) = Scene.CreateMeshBuilder
.MoveFirst
.Move CStr(Trim$(Map(0)))
Mesh(i).SetMeshName (!Name)
Mesh(i).Load3DsMesh (!File)
PossitionArray = Split(CStr(Trim$(Map(1))), ",")
Mesh(i).SetPosition CSng(Trim$(PossitionArray(0))), CSng(Trim$(PossitionArray(1))), CSng(Trim$(PossitionArray(2)))
PossitionArray = Split(CStr(Trim$(Map(2))), ",")
Mesh(i).SetRotation CSng(Trim$(PossitionArray(0))), CSng(Trim$(PossitionArray(1))), CSng(Trim$(PossitionArray(2)))
PossitionArray = Split(CStr(Trim$(Map(3))), ",")
Size = Split((!Size), ",")
Mesh(i).ScaleMesh CSng(Trim$(PossitionArray(0))) + CSng(Trim$(Size(0))), CSng(Trim$(PossitionArray(1))) + CSng(Trim$(Size(0))), CSng(Trim$(PossitionArray(2))) + CSng(Trim$(Size(0)))
Mesh(i).SetCollisionEnable True
Mesh(i).SetCullMode TV_FRONT_CULL
Next i
Close #1
End With
''''''''''''''''''''''''''''''''Copy Ends''''''''''''''''''''''''''''
End Sub


Public Sub Map_Render()
For i = 1 To MeshAmount
Mesh(i).Render
Next i
End Sub

