package alternativa.tanks.sfx
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import obfuscation.kofen.Vector3d;
   
   public class BonusCrystalsEffectUtils
   {
      
      [Inject]
      public static var battleService:BattleService = BattleService(OSGi.getInstance().getService(BattleService));
      
      [Inject]
      public static var materialRegistry:TextureMaterialRegistry = TextureMaterialRegistry(OSGi.getInstance().getService(TextureMaterialRegistry));
      
      private static const cry1000Texture:Class = BonusCrystalsEffectUtils_cry1000Texture;
      
      private static const cry1000BitmapData:BitmapData = new cry1000Texture().bitmapData;
      
      public function BonusCrystalsEffectUtils()
      {
         super();
      }
      
      public static function drawEffectForCatcherPosition(_arg_1:Vector3d, _arg_2:int) : void
      {
         var _local_3:TextureMaterial = materialRegistry.getMaterial(cry1000BitmapData);
         var _local_4:CrystalBonusEffect = CrystalBonusEffect(battleService.getObjectPool().getObject(CrystalBonusEffect));
         _local_4.init(_arg_2,_local_3.texture.width * 2,_local_3.texture.height * 2,0,750,200,0.55,0,0,50,_arg_1,_local_3,BlendMode.NORMAL);
         battleService.getBattleScene3D().addGraphicEffect(_local_4);
      }
      
      public static function getTargetPosition(_arg_1:ClientObject) : Vector3d
      {
         var _local_2:ITankModel = ITankModel(OSGi.getInstance().getService(ITankModel));
         var _local_3:Tank = _local_2.getTankData(_arg_1).tank;
         var _local_4:Object3D = _local_3.bij().qenokeru();
         return new Vector3d(_local_4.x,_local_4.y,_local_4.z);
      }
   }
}

