Attribute VB_Name = "BulletMod"
Public Bullet(20) As TVMesh
Dim LastShot As Single
Dim LeftRightShoot As Single



Public Enum Gun_using_Enum
    PunchAndKick = 1
    NormalGun = 2
    Shotgun = 3
    MachineGun = 4
End Enum
Public Gun_USING As Gun_using_Enum

Public BulletCollision As TV_COLLISIONRESULT
Public Bulletlinestart As D3DVECTOR, Bulletlineend As D3DVECTOR  'f


Public Sub Bullet_Initialize()
Gun_USING = NormalGun


'''''''''''For Bullet Normal Gun
TexFactory.LoadTexture "RedTrans.bmp", "BulletTex", , , TV_COLORKEY_BLACK
Set Bullet(0) = Scene.CreateMeshBuilder
Bullet(0).SetMeshName "Bulletthing"
Bullet(0).Load3DsMesh "Bullet.3DS"
'Bullet(0).SetTexture GetTex("BulletTex")
Bullet(0).ScaleMesh 0.5, 0.5, 0.5
Bullet(0).Optimize
For i = 1 To 20
Set Bullet(i) = Bullet(0).DuplicateMesh
Bullet(i).Enable False
Bullet(i).SetCollisionEnable True
Next i
LastShot = 0

End Sub


Public Sub Bullet_Render()
If Gun_USING = NormalGun Then Bullet_NormalGun (True)
End Sub


Sub Bullet_NormalGun(Render As Boolean)



If Render = False Then '''When someone presses shoot
    Actor.SetAnimationByName "2handshoot"
    ActorAnimation = "2handshoot"
    ActorWalking = False

    If LastShot <= 20 Then
        LastShot = LastShot + 1 'Adds one to the LastShot COunt so that the next mesh is shot
        Bullet(LastShot).Enable True 'Enables the mesh. This is needed because .setdeathtime disables it
   
'''''''We need this line so that he can shoot corners also


Bullet(LastShot).SetRotation 0, 180 - ang * 180 / 3.14, -arcc * 180 / 3.14 'Rotates with the characters
Bullet(LastShot).SetPosition Actor.GetPosition.x, Actor.GetPosition.y, Actor.GetPosition.z ' Uses characters positions

''''''''''''''''''So its like shoot left once and then shoot right
If LeftRightShoot = 1 Then
Bullet(LastShot).MoveRelative 1, 0, -10
LeftRightShoot = 0
Else
Bullet(LastShot).MoveRelative -1, 0, -10
LeftRightShoot = 1
End If

Bullet(LastShot).SetDeathTime 1400  'So that the bullet gets disabled in a few second
Else
LastShot = -1  'If Lastshot is over 20 then make it 0
End If


ElseIf Render = True Then '''''This happens when the bullet is already shot and needs to be rendered and moved
For i = 0 To 20
    If Bullet(i).IsMeshEnabled = True Then 'So that it only renders bullets that are enabled
        Bullet(i).Render
        Bulletlinestart = Bullet(i).GetPosition
        Bullet(i).MoveRelative 0, 0, -9.5  'Moves the Bullet. Change the last digit so say how fast the bullet will go.
        Bulletlineend = Bullet(i).GetPosition
        Bullet(i).MoveRelative 0, 0, 9.5
        If Scene.AdvancedCollision(Bulletlinestart, Bulletlineend, BulletCollision, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING) = True Then
'            Scene.SetCamera Bullet(i).GetPosition.x + 50, Bullet(i).GetPosition.y + 50, Bullet(i).GetPosition.x + 50, Bullet(i).GetPosition.x, Bullet(i).GetPosition.y, Bullet(i).GetPosition.z
 'If Bullet(i).Collision(Bulletlinestart, Bulletlineend, TV_TESTTYPE_ACCURATETESTING) = True Then
            Bullet(i).Enable False
        Else
        Bullet(i).MoveRelative 0, 0, -9.5
        End If
    End If
Next i

End If
End Sub


Public Sub Bullet_Shoot()
If Gun_USING = NormalGun Then Bullet_NormalGun (False)

'''This line is here so that he can shoot corners
If pLeft = True And pUp = True Then
ang = ang - 0.7899975
ElseIf pRight = True And pUp = True Then
ang = ang + 0.7899975
ElseIf pRight = True And pDown = True Then
ang = ang + 0.7899975
ElseIf pLeft = True And pDown = True Then
ang = ang - 0.7899975
End If

End Sub
