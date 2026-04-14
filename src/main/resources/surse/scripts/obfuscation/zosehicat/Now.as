package obfuscation.zosehicat
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.tankskin.SkinMaterials;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.materials.TrackMaterial;
   import alternativa.utils.TextureMaterialRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import projects.tanks.clients.flash.commons.models.coloring.IColoring;
   
   public class Now implements Husunyb
   {
      
      [Inject]
      public static var dyb:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Now()
      {
         super();
      }
      
      public function hidysyv(_arg_1:TankSkin, _arg_2:IColoring) : SkinMaterials
      {
         var _local_3:MultiframeImageResource = null;
         var _local_4:TextureMaterial = null;
         var _local_5:TextureMaterial = null;
         var _local_6:ImageResource = null;
         if(_arg_2.isAnimated())
         {
            _local_3 = _arg_2.getAnimatedColoring();
            _local_4 = dyb.getAnimatedPaint(_local_3,_arg_1.cyhajycip());
            _local_5 = dyb.getAnimatedPaint(_local_3,_arg_1.tytew());
         }
         else
         {
            _local_6 = _arg_2.getColoring();
            _local_4 = dyb.getPaint(_local_6,_arg_1.cyhajycip());
            _local_5 = dyb.getPaint(_local_6,_arg_1.tytew());
         }
         var _local_7:TrackMaterial = new TrackMaterial(_arg_1.cyhajycip().details);
         var _local_8:TrackMaterial = new TrackMaterial(_arg_1.cyhajycip().details);
         dyb.addMaterial(_local_7);
         dyb.addMaterial(_local_8);
         return new SkinMaterials(_local_4,_local_5,_local_7,_local_8);
      }
      
      public function vifucuqir(_arg_1:TankSkin, _arg_2:ImageResource) : SkinMaterials
      {
         var _local_3:TextureMaterial = dyb.getPaint(_arg_2,_arg_1.cyhajycip());
         var _local_4:TextureMaterial = dyb.getPaint(_arg_2,_arg_1.tytew());
         return new SkinMaterials(_local_3,_local_4);
      }
   }
}

