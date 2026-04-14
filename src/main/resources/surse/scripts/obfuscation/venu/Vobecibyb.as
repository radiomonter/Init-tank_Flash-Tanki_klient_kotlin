package obfuscation.venu
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vecuhamep.Jijapib;
   import obfuscation.zusiniha.Hidyz;
   import obfuscation.zusiniha.Wisyjelom;
   import obfuscation.zusiniha.Wopa;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Vobecibyb extends Wisyjelom implements Wopa, Virijih
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      public function Vobecibyb()
      {
         super();
      }
      
      private static function mavog(_arg_1:BitmapData, _arg_2:BitmapFilter) : TextureMaterial
      {
         var _local_3:BitmapData = GraphicsUtils.createFilteredImage(_arg_1,_arg_2);
         var _local_4:TextureMaterial = suner.getMaterial(_local_3);
         _local_4.resolution = Kurivyq.dif / _arg_1.height;
         return _local_4;
      }
      
      private static function gyq(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter) : TextureAnimation
      {
         return getTextureAnimation(_arg_1,_arg_2,Zepube.wogy);
      }
      
      private static function zenyw(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter) : TextureAnimation
      {
         return getTextureAnimation(_arg_1,_arg_2,Zepube.qetijil);
      }
      
      private static function getTextureAnimation(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter, _arg_3:Number) : TextureAnimation
      {
         var _local_4:TextureAnimation = GraphicsUtils.getFilteredTextureAnimationFromResource(suner,_arg_1,_arg_2);
         _local_4.material.resolution = _arg_3 / _arg_1.frameWidth;
         return _local_4;
      }
      
      private static function syji(_arg_1:String) : BitmapFilter
      {
         var _local_2:Jijapib = Jijapib(object.adapt(Jijapib));
         return _local_2.createFilter(_arg_1);
      }
      
      private static function liburipa(_arg_1:Kehyhyhy) : void
      {
         suner.releaseMaterial(_arg_1.jenugo);
         suner.releaseMaterial(_arg_1.rajujudaz.material);
         suner.releaseMaterial(_arg_1.hevi.material);
         suner.releaseMaterial(_arg_1.fyqydyd);
      }
      
      public function kiravuru(_arg_1:ClientObject) : Kurivyq
      {
         return Kurivyq(_arg_1.getParams(Kurivyq));
      }
      
      public function bicoqilyp(_arg_1:ClientObject) : Kehyhyhy
      {
         return Kehyhyhy(_arg_1.getParams(Kehyhyhy));
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:Hidyz = getInitParam();
         var _local_3:Kehyhyhy = new Kehyhyhy();
         _local_3.jenugo = mavog(_local_2.muzzleFlashTexture.data,syji("flash"));
         _local_3.rajujudaz = gyq(_local_2.shotTexture,syji("shot"));
         _local_3.hevi = zenyw(_local_2.explosionTexture,syji("expl"));
         _local_3.fyqydyd = suner.getMaterial(_local_2.hitMarkTexture.data);
         _local_3.shotSound = _local_2.shotSound.sound;
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.jeja = _local_4.jaqirynu("shot");
         _local_3.lamikuniv = _local_4.jaqirynu("bullet");
         _local_3.kahigi = _local_4.jaqirynu("hit");
         _arg_1.putParams(Kehyhyhy,_local_3);
         _arg_1.putParams(Kurivyq,new Kurivyq(battleService,_local_3));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         liburipa(this.bicoqilyp(_arg_1));
      }
   }
}

