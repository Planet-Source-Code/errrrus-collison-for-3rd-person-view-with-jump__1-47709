Attribute VB_Name = "Landscape_Mod"

Public Land As TVLandscape

Public Sub Land_Init()
Set Land = New TVLandscape

 
TexFactory.LoadTexture "water.jpg", "water"


With Land
.SetFactorY 0.6
.GenerateHugeTerrain "1,1.jpg", TV_PRECISION_ULTRA_LOW, 8, 8, 0, 0, True
.SetAffineDetail TV_AFFINE_HIGH
  
'Land.ExpandTexture GetTex("TerrainTexture"), 0, 0, 8, 8
  Scene.LoadTexture "Terrain.jpg", , , "TerrainTexture"
  .SetTexture GetTex("TerrainTexture")
 .SetTextureScale 5, 5

'Land.SetDetailTexture GetTex("detail")

.SetWaterEnable True
    .SetWaterAltitude 30
  .SetWaterTexture GetTex("water")
  .SetWaterTextureScale 5
  .SetWaterEffect True, 0.1, False, D3DBLEND_DESTCOLOR, D3DBLEND_SRCCOLOR, False
End With

End Sub


Public Sub Land_Render()
'Scene.SetRenderMode TV_LINE
Land.Render
'Scene.SetRenderMode TV_SOLID

End Sub

