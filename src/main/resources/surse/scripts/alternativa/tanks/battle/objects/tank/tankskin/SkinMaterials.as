package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.materials.TrackMaterial;
   
   public class SkinMaterials
   {
      
      public var cipic:TextureMaterial;
      
      public var feh:TextureMaterial;
      
      public var coru:TrackMaterial;
      
      public var pavew:TrackMaterial;
      
      public function SkinMaterials(_arg_1:TextureMaterial, _arg_2:TextureMaterial, _arg_3:TrackMaterial = null, _arg_4:TrackMaterial = null)
      {
         super();
         this.cipic = _arg_1;
         this.feh = _arg_2;
         this.coru = _arg_3;
         this.pavew = _arg_4;
      }
   }
}

