package obfuscation.fatik
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import obfuscation.joh.Myje;
   import obfuscation.joh.Zuqelu;
   import obfuscation.joh.Zysaf;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vecuhamep.Jijapib;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Ryfafapuk extends Myje implements Zysaf, Vevizajis
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Ryfafapuk()
      {
         super();
      }
      
      private static function hydobo(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter) : TextureAnimation
      {
         return getTextureAnimation(_arg_1,Pizafi.wogy,_arg_2);
      }
      
      private static function getTextureAnimation(_arg_1:MultiframeImageResource, _arg_2:Number, _arg_3:BitmapFilter) : TextureAnimation
      {
         var _local_4:TextureAnimation = GraphicsUtils.getFilteredTextureAnimationFromResource(suner,_arg_1,_arg_3);
         _local_4.material.resolution = _arg_2 / _arg_1.frameWidth;
         return _local_4;
      }
      
      private static function syji(_arg_1:String) : BitmapFilter
      {
         var _local_2:Jijapib = Jijapib(object.adapt(Jijapib));
         return _local_2.createFilter(_arg_1);
      }
      
      private static function zenyw(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter) : TextureAnimation
      {
         return getTextureAnimation(_arg_1,Pizafi.qetijil,_arg_2);
      }
      
      private static function cyvyf(_arg_1:MultiframeImageResource, _arg_2:BitmapFilter) : TextureAnimation
      {
         return getTextureAnimation(_arg_1,Pizafi.qetijil,_arg_2);
      }
      
      private static function mavog(_arg_1:ImageResource) : TextureMaterial
      {
         var _local_2:BitmapData = _arg_1.data;
         var _local_3:TextureMaterial = suner.getMaterial(_local_2);
         _local_3.resolution = Futywyq.kihuwoha / _local_2.height;
         return _local_3;
      }
      
      private static function bejobi(_arg_1:BitmapData, _arg_2:BitmapFilter) : TextureMaterial
      {
         var _local_3:TextureMaterial = suner.getMaterial(_arg_1);
         _local_3.resolution = Pizafi.honihy / _arg_1.height;
         return _local_3;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:Zuqelu = getInitParam();
         var _local_3:Lujimarem = new Lujimarem();
         _local_3.rajujudaz = hydobo(_local_2.shotTexture,syji("shot"));
         _local_3.hevi = zenyw(_local_2.explosionTexture,syji("expl"));
         _local_3.vefir = cyvyf(_local_2.bumpFlashTexture,syji("expl"));
         _local_3.jenugo = mavog(_local_2.shotFlashTexture);
         _local_3.fyjuvypal = bejobi(_local_2.tailTrailTexutre.data,syji("trail"));
         _local_3.shotSound = _local_2.shotSound.sound;
         _local_3.ricochetSound = _local_2.ricochetSound.sound;
         _local_3.explosionSound = _local_2.kywibe.sound;
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.loh = _local_4.jaqirynu("shot");
         _local_3.faqe = _local_4.jaqirynu("ricochet");
         _local_3.jowe = _local_4.jaqirynu("hit");
         _local_3.roficujiz = _local_4.jaqirynu("bullet");
         _arg_1.putParams(Lujimarem,_local_3);
         _arg_1.putParams(Futywyq,new Futywyq(battleService,_local_3));
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Lujimarem = this.wycako(_arg_1);
         suner.releaseMaterial(_local_2.hevi.material);
         suner.releaseMaterial(_local_2.vefir.material);
         suner.releaseMaterial(_local_2.rajujudaz.material);
         suner.releaseMaterial(_local_2.jenugo);
         suner.releaseMaterial(_local_2.fyjuvypal);
      }
      
      public function wycako(_arg_1:ClientObject) : Lujimarem
      {
         return Lujimarem(_arg_1.getParams(Lujimarem));
      }
      
      public function fucine(_arg_1:ClientObject) : Futywyq
      {
         return Futywyq(_arg_1.getParams(Futywyq));
      }
   }
}

