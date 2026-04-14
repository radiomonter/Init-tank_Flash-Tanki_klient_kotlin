package alternativa.tanks.models.weapon.shaft
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import flash.media.Sound;
   import obfuscation.cujewipo.Punakade;
   import obfuscation.docecoqyb.Byjaheh;
   import obfuscation.docecoqyb.Jowizit;
   import obfuscation.docecoqyb.Wopujeh;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vecuhamep.Jijapib;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Myqawyni extends Jowizit implements Wopujeh, Mili
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Myqawyni()
      {
         super();
      }
      
      private static function nuvefimol(_arg_1:String) : BitmapFilter
      {
         var _local_2:Jijapib = Jijapib(object.adapt(Jijapib));
         return _local_2.createFilter(_arg_1);
      }
      
      private static function getTextureAnimation(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter, _arg_3:Number) : TextureAnimation
      {
         var _local_4:TextureAnimation = GraphicsUtils.getFilteredTextureAnimationFromResource(suner,_arg_1,_arg_2);
         _local_4.material.resolution = _arg_3 / _arg_1.frameWidth;
         return _local_4;
      }
      
      private static function bejobi(_arg_1:BitmapData, _arg_2:BitmapFilter) : TextureMaterial
      {
         var _local_3:BitmapData = GraphicsUtils.createFilteredImage(_arg_1,_arg_2);
         var _local_4:TextureMaterial = suner.getMaterial(_local_3);
         _local_4.resolution = Punakade.WIDTH / _local_3.width;
         return _local_4;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:Byjaheh = getInitParam();
         var _local_3:Sound = _local_2.targetingSound.sound;
         var _local_4:Sound = _local_2.zoomModeSound.sound;
         var _local_5:Sound = _local_2.shotSound.sound;
         var _local_6:Sound = _local_2.explosionSound.sound;
         var _local_7:BitmapFilter = nuvefimol("def");
         var _local_8:TextureAnimation = getTextureAnimation(_local_2.muzzleFlashTexture,_local_7,Roguqine.kihuwoha);
         var _local_9:TextureAnimation = getTextureAnimation(_local_2.explosionTexture,_local_7,Roguqine.fuvi);
         var _local_10:TextureMaterial = bejobi(_local_2.trailTexture.data,_local_7);
         var _local_11:TextureMaterial = suner.getMaterial(_local_2.hitMarkTexture.data);
         var _local_12:Number = 500;
         var _local_13:Qef = new Qef(_local_5,_local_6,_local_4,_local_3,_local_8,_local_10,_local_9,_local_11,_local_12);
         var _local_14:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_13.loh = _local_14.jaqirynu("shot");
         _local_13.jowe = _local_14.jaqirynu("hit");
         _arg_1.putParams(Qef,_local_13);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Qef = Qef(_arg_1.getParams(Qef));
         suner.releaseMaterial(_local_2.sarasave);
         suner.releaseMaterial(_local_2.wedeji.material);
         suner.releaseMaterial(_local_2.hevi.material);
         suner.releaseMaterial(_local_2.fyqydyd);
      }
      
      public function fireru(_arg_1:ClientObject) : Roguqine
      {
         var _local_2:Qef = Qef(_arg_1.getParams(Qef));
         return new Roguqine(_local_2,battleService);
      }
   }
}

