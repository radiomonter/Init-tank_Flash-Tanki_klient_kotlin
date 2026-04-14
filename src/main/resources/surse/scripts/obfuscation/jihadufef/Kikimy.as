package obfuscation.jihadufef
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import obfuscation.hicizuz.Hehiva;
   import obfuscation.hicizuz.Komuzisu;
   import obfuscation.hicizuz.Nusydopo;
   import obfuscation.rokal.Riwizy;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Kikimy extends Komuzisu implements Nusydopo, Cuzaqyv
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Kikimy()
      {
         super();
      }
      
      private static function mavog(_arg_1:ImageResource) : TextureMaterial
      {
         var _local_2:BitmapData = _arg_1.data;
         var _local_3:TextureMaterial = suner.getMaterial(_local_2);
         _local_3.resolution = Bicyjawyf.midabufa / _local_2.height;
         return _local_3;
      }
      
      private static function zenyw(_arg_1:MultiframeImageResource, _arg_2:Number) : TextureAnimation
      {
         var _local_3:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_3.material.resolution = _arg_2 / _arg_1.frameWidth;
         return _local_3;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Hehiva = getInitParam();
         var _local_3:Qikypu = new Qikypu();
         _local_3.jenugo = mavog(_local_2.shotTexture);
         _local_3.hevi = zenyw(_local_2.explosionTexture,_local_2.explosionSize);
         _local_3.explosionSize = _local_2.explosionSize;
         _local_3.shotSound = _local_2.shotSound.sound;
         _local_3.explosionSound = _local_2.explosionSound.sound;
         _local_3.ranorywag = suner.getMaterial(_local_2.explosionMarkTexture.data);
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.loh = _local_4.jaqirynu("shot");
         _local_3.jowe = _local_4.jaqirynu("hit");
         _arg_1.putParams(Qikypu,_local_3);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Qikypu = Qikypu(_arg_1.getParams(Qikypu));
         suner.releaseMaterial(_local_2.jenugo);
         suner.releaseMaterial(_local_2.hevi.material);
         suner.releaseMaterial(_local_2.ranorywag);
      }
      
      public function fireru(_arg_1:ClientObject) : Gerucykoq
      {
         return new Juk(battleService,Qikypu(_arg_1.getParams(Qikypu)));
      }
   }
}

