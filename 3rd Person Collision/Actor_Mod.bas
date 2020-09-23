Attribute VB_Name = "Actor_Mod"

Public Actor As New TVActor2
Dim PosX As Single, PosY As Single, PosZ As Single, Ang As Single
Public NewPosX As Single, NewPosY As Single, NewPosZ As Single, Newang As Single

Dim ActorWalking As Boolean, ActorRotating As Boolean  'To know if the actor is walking or if he is rotating his self
Public ActorAnimation As String
Public pUp As Boolean, pDown As Boolean, pLeft As Boolean, pRight As Boolean, pShoot As Boolean, pJump As Boolean

Public CollisionResult As TV_COLLISIONRESULT


Dim linestart As D3DVECTOR
Dim lineend As D3DVECTOR
Dim lineYTest As D3DVECTOR


'''''''''''''''''''''''''''''Jump'''''''''''''
 Public bjump As Boolean, bjumpstill As Boolean
 
 
 Public jcount As Long
 Public joffset As Long
''''''''''''''''''''''''''''''''''''''''''''''
Dim FallSpeed As Single






Public Sub Actor_Init()
PosX = 800
PosZ = 1000
PosY = Land.GetHeight(PosX, PosY) + 1800
Actor.Load "Etac.mdl", True
'Actor.SetScale 0.7, 0.7, 0.7
Actor.SetPosition PosX, PosY, PosZ
Actor.SetAnimationByName ("idle")
ActorAnimation = "idle"
Actor.PlayAnimation 25
Actor.SetRotation 0, 180, 0
Actor.SetAnimationLoop True
End Sub


Public Sub Actor_Update()
'do jump check.
Actor_Jump_Check

'This is what lets my actor walk on meshes
WalkoverMesh

Actor.SetPosition PosX, PosY + 36, PosZ


Ang = Actor.GetName

'Actor.SetRotation 0, 180 - Ang * 180 / 3.14, -arcc * 180 / 3.14
'Actor.SetRotation 0, Round(180 - Ang * 180 / 3.14, 4), 0
Actor.Render
End Sub

Public Sub Actor_Pressed_Up()

pUp = True
If bjump = False Then
    If ActorWalking = False Then
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If

    If ActorAnimation = "run" Then
    Else
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If
End If

ActorWalking = True

'This is what is infront of the actor for checking Collision. Note: its moving further then the actor because I want him farther ways from the collided object
    NewPosX = PosX + TV.AccurateTimeElapsed * Cos(Ang) * 1
    NewPosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang) * 1
    NewPosY = PosY + 20

'Here we set all the Vectors for the collision check.
    linestart = Vector(Actor.GetPosition.x, Actor.GetPosition.y - 15, Actor.GetPosition.z)
    lineend = Vector(NewPosX, NewPosY, NewPosZ)
    lineYTest = Vector(NewPosX, NewPosY + 50, NewPosZ) 'This vector checks if there is any collision between the bottom to the top of where the actor will move to.
      
'And here we check for collision
    'First we check for collision of whats infront
    If Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                'If nothing is there then check if there is any collision from the top to the bottome of the actor.
                If Scene.AdvancedCollision(lineend, lineYTest, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                'If there is none well then change the Position of the actor.
                    PosX = PosX + TV.AccurateTimeElapsed * Cos(Ang) * 0.22
                    PosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang) * 0.22
                    PosY = PosY
                End If
    End If


Actor.PlayAnimation 35

        


End Sub


Public Sub Actor_Pressed_Down(Move As Boolean)
pDown = True

If bjump = False Then
    If ActorWalking = False Then
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If

    If ActorAnimation = "run" Then
    Else
        Actor.SetAnimationByName "run"
         ActorAnimation = "run"
    End If
End If

ActorWalking = True

    
    NewPosX = PosX + TV.AccurateTimeElapsed * Cos(Ang + 3.159999) * 1
    NewPosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang + 3.159999) * 1
    
    NewPosY = PosY + 20

    linestart = Vector(Actor.GetPosition.x, Actor.GetPosition.y - 15, Actor.GetPosition.z)
    lineend = Vector(NewPosX, NewPosY, NewPosZ)
    lineYTest = Vector(NewPosX, NewPosY + 50, NewPosZ)

      If Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                If Scene.AdvancedCollision(lineend, lineYTest, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                    PosX = PosX + TV.AccurateTimeElapsed * Cos(Ang + 3.159999) * 0.22
                    PosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang + 3.159999) * 0.22
                    PosY = PosY
                End If
    End If


Actor.PlayAnimation 35
Actor.SetAnimationLoop True


End Sub


Public Sub Actor_Pressed_Left()
pLeft = True

If bjump = False Then
    If ActorWalking = False Then
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If

    If ActorAnimation = "run" Then
    Else
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If
End If

ActorWalking = True

    
    NewPosX = PosX + TV.AccurateTimeElapsed * Cos(Ang + 1.5799995) * 1
    NewPosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang + 1.5799995) * 1
    
    NewPosY = PosY + 20

    linestart = Vector(Actor.GetPosition.x, Actor.GetPosition.y - 15, Actor.GetPosition.z)
    lineend = Vector(NewPosX, NewPosY, NewPosZ)
    lineYTest = Vector(NewPosX, NewPosY + 50, NewPosZ)

      If Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                If Scene.AdvancedCollision(lineend, lineYTest, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                    PosX = PosX + TV.AccurateTimeElapsed * Cos(Ang + 1.5799995) * 0.22
                    PosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang + 1.5799995) * 0.22
                    PosY = PosY
                End If
    End If


Actor.PlayAnimation 35
Actor.SetAnimationLoop True


End Sub

Public Sub Actor_Pressed_Right()
pRight = True

If bjump = False Then
    If ActorWalking = False Then
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If

    If ActorAnimation = "run" Then
    Else
        Actor.SetAnimationByName "run"
        ActorAnimation = "run"
    End If
End If

ActorWalking = True

    
    NewPosX = PosX + TV.AccurateTimeElapsed * Cos(Ang - 1.5799995) * 1
    NewPosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang - 1.5799995) * 1
    
    NewPosY = PosY + 20

    linestart = Vector(Actor.GetPosition.x, Actor.GetPosition.y - 15, Actor.GetPosition.z)
    lineend = Vector(NewPosX, NewPosY, NewPosZ)
    lineYTest = Vector(NewPosX, NewPosY + 50, NewPosZ)

      If Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                If Scene.AdvancedCollision(lineend, lineYTest, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = False Then
                    PosX = PosX + TV.AccurateTimeElapsed * Cos(Ang - 1.5799995) * 0.22
                    PosZ = PosZ + TV.AccurateTimeElapsed * Sin(Ang - 1.5799995) * 0.22
                    PosY = PosY
                End If
    End If


Actor.PlayAnimation 35
Actor.SetAnimationLoop True

End Sub


Public Sub Actor_Pressed_Jump()
pJump = True
'If ActorWalking = True Then  'If he is running then long jump
    If jcount = 0 Then
        
            If ActorWalking = False Then
                Actor.SetAnimationByName "jump"
                ActorAnimation = "jump"
                bjumpstill = True
            Else
                Actor.SetAnimationByName "long_jump"
                ActorAnimation = "long_jump"
            End If
        
        Actor.SetAnimationLoop False 'So that the jump animation doesn't repeat
        If pUp = True Then JumpWhere = Up
        If pDown = True Then JumpWhere = Down
        bjump = True
            
    End If
'End If
End Sub


Public Sub Actor_Jump_Check()

If bjump = True Then
         jcount = jcount + 1
        
                joffset = Sin((3.1415 / 35) * jcount) * 4 'The original was 200 and then 140


        If jcount = 35 Then
            jcount = 0
            bjump = False
            bjumpstill = False
 '           Actor.SetAnimationLoop True 'So that the actor starts to repeat the animations
 
            If ActorWalking = True Then
                Actor.SetAnimationByName "run"
                ActorAnimation = "run"
            Else
                Actor.SetAnimationByName "idle"
                ActorAnimation = "idle"
            End If
        End If
End If

End Sub


Public Sub Actor_False_Check()
'''''''Check If Nothing Is Pressed
If pUp = False And pDown = False And pLeft = False And pRight = False And pShoot = False Then
    If ActorWalking = True Then
        ActorWalking = False
        Actor.SetAnimationByName "idle"
        ActorAnimation = "idle"
    End If
    If ActorAnimation = "2handshoot" Then
        ActorWalking = False
        Actor.SetAnimationByName "idle"
        ActorAnimation = "idle"
    End If
    Actor.PlayAnimation 25
ElseIf pUp = False And pDown = False And pLeft = False And pRight = False And pShoot = False Then ActorWalking = False
End If
End Sub


Sub WalkoverMesh()
If bjump = False Then
    linestart.x = PosX
    linestart.y = PosY + 20
    linestart.z = PosZ
    
    'CollisionMesh.SetPosition PosX, linestart.y, PosZ

    lineend.x = PosX
    lineend.y = PosY - 10
    lineend.z = PosZ
Else
    linestart.x = PosX
    linestart.y = PosY + 2
    linestart.z = PosZ
    
    'CollisionMesh.SetPosition PosX, linestart.y, PosZ

    lineend.x = PosX
    lineend.y = PosY
    lineend.z = PosZ
End If


If bjump = True And Scene.AdvancedCollision(Vector(PosX, PosY + 45, PosZ), Vector(PosX, PosY + 55, PosZ), CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = True Then
bjump = False
joffset = 0
jcount = 0

End If

If Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_MESH, TV_TESTTYPE_ACCURATETESTING, True) = True Then
    'MSG = "Over Mesh"
    PosY = CollisionResult.collisionimpact.y + joffset
    'TV.AddToDebug "with Collision Impact + 5:" & PosY
    FallSpeed = 0.03
    'ElseIf Scene.AdvancedCollision(linestart, lineend, CollisionResult, TV_COLLIDE_LANDSCAPE, TV_TESTTYPE_ACCURATETESTING) = True Then
ElseIf Land.GetHeight(PosX, PosZ) >= PosY Then
    PosY = Land.GetHeight(PosX, PosZ) + joffset
    'MSG = "Over Landscape"
    FallSpeed = 0.03
    
Else
    If bjump = True Then
        PosY = PosY + joffset
    Else
        Fall
'        PosY = PosY - TV.AccurateTimeElapsed * 0.3
        'MSG = "Falling"
    End If
End If
    Actor.SetAnimationLoop True
End Sub


Sub Fall()

If FallSpeed < 1 Then
FallSpeed = FallSpeed + TV.AccurateTimeElapsed * 0.0009
End If

PosY = PosY - TV.AccurateTimeElapsed * FallSpeed
End Sub

