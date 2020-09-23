Attribute VB_Name = "Collision_Detection_Mod"

Function Collision_Check(PosX As Single, PosY As Single, PosZ As Single, NewPosX As Single, NewPosY As Single, NewPosZ As Single) As Boolean
If Scene.Collide(Vector(PosX, PosY, PosZ), Vector(NewPosX, NewPosY, NewPosZ), TV_TESTTYPE_BOUNDINGBOX) = True Then Collision_Check = True
End Function
