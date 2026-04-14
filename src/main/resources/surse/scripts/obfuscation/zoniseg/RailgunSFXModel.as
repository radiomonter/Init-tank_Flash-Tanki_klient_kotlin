package obfuscation.zoniseg
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import obfuscation.hahyluzut.Maryve;
   import obfuscation.hahyluzut.Powecu;
   import obfuscation.hahyluzut.Weluk;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vecuhamep.Jijapib;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class RailgunSFXModel extends Maryve implements Weluk, Lofur
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private const hatynej:Vuj = new Vuj();
      
      public function RailgunSFXModel()
      {
         super();
      }
      
      private static function getTextureAnimation(_arg_1:MultiframeImageResource, _arg_2:Number, _arg_3:BitmapFilter) : TextureAnimation
      {
         var _local_4:TextureAnimation = GraphicsUtils.getFilteredTextureAnimationFromResource(suner,_arg_1,_arg_3);
         _local_4.material.resolution = _arg_2 / _arg_1.frameWidth;
         return _local_4;
      }
      
      private static function bejobi(_arg_1:BitmapData, _arg_2:BitmapFilter) : TextureMaterial
      {
         var _local_3:BitmapData = GraphicsUtils.createFilteredImage(_arg_1,_arg_2);
         var _local_4:TextureMaterial = suner.getMaterial(_local_3);
         _local_4.repeat = true;
         return _local_4;
      }
      
      private static function syji(_arg_1:String) : BitmapFilter
      {
         var _local_2:Jijapib = Jijapib(object.adapt(Jijapib));
         return _local_2.createFilter(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:Powecu = getInitParam();
         var _local_3:Geb = new Geb();
         var _local_4:BitmapFilter = syji("trail");
         _local_3.sarasave = bejobi(_local_2.trailImage.data,_local_4);
         _local_3.mita = bejobi(_local_2.smokeImage.data,_local_4);
         _local_3.fyqydyd = suner.getMaterial(_local_2.hitMarkTexture.data);
         _local_3.fofu = this.gyzug(_local_2.chargingPart1,_local_2.chargingPart2,_local_2.chargingPart3,syji("charge"));
         _local_3.hudawo = getTextureAnimation(_local_2.ringsTexture,Hipemogip.zod,_local_4);
         _local_3.fozypyry = getTextureAnimation(_local_2.sphereTexture,Hipemogip.nuzane,_local_4);
         _local_3.tomari = getTextureAnimation(_local_2.powTexture,Hipemogip.jonowi,_local_4);
         _local_3.sound = _local_2.shotSound.sound;
         var _local_5:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.goqiqah = _local_5.jaqirynu("charge");
         _local_3.loh = _local_5.jaqirynu("shot");
         _local_3.jowe = _local_5.jaqirynu("hit");
         _local_3.padymysep = _local_5.jaqirynu("rail");
         _arg_1.putParams(Geb,_local_3);
      }
      
      private function gyzug(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource, _arg_4:BitmapFilter) : TextureAnimation
      {
         var _local_5:BitmapData = GraphicsUtils.createFilteredImage(this.hatynej.getTexture(_arg_1,_arg_2,_arg_3),_arg_4);
         var _local_6:int = _local_5.height;
         var _local_7:TextureAnimation = GraphicsUtils.getTextureAnimation(suner,_local_5,_local_6,_local_6);
         _local_7.material.resolution = Hipemogip.peto / _local_6;
         return _local_7;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Geb = Geb(_arg_1.getParams(Geb));
         suner.releaseMaterial(_local_2.sarasave);
         suner.releaseMaterial(_local_2.mita);
         suner.releaseMaterial(_local_2.fofu.material);
         suner.releaseMaterial(_local_2.fyqydyd);
         suner.releaseMaterial(_local_2.hudawo.material);
         suner.releaseMaterial(_local_2.fozypyry.material);
         suner.releaseMaterial(_local_2.tomari.material);
      }
      
      public function fireru(_arg_1:ClientObject) : Benywani
      {
         return new Hipemogip(Geb(_arg_1.getParams(Geb)),battleService);
      }
   }
}

