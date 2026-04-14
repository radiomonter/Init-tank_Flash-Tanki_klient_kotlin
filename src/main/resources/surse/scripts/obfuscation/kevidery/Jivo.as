package obfuscation.kevidery
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.models.weapon.smoky.Rubelyvo;
   import alternativa.tanks.models.weapon.smoky.Vitovyhad;
   import alternativa.tanks.utils.GraphicsUtils;
   import obfuscation.dob.Gakemyna;
   import obfuscation.dob.Pefy;
   import obfuscation.dob.Qihynehy;
   import obfuscation.rokal.Riwizy;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Jivo extends Qihynehy implements Pefy, Cyzak
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Jivo()
      {
         super();
      }
      
      private static function mavog(_arg_1:ImageResource) : TextureMaterial
      {
         var _local_2:TextureMaterial = suner.getMaterial(_arg_1.data);
         _local_2.resolution = Vitovyhad.lagycewun / _arg_1.data.height;
         return _local_2;
      }
      
      private static function wok(_arg_1:MultiframeImageResource, _arg_2:int) : TextureAnimation
      {
         var _local_3:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_3.material.resolution = _arg_2 / _arg_1.frameWidth;
         return _local_3;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Gakemyna = getInitParam();
         var _local_3:Duk = new Duk();
         _local_3.jenugo = mavog(_local_2.shotTexture);
         _local_3.hevi = wok(_local_2.explosionTexture,_local_2.explosionSize);
         _local_3.ranorywag = suner.getMaterial(_local_2.explosionMarkTexture.data);
         _local_3.qobupar = wok(_local_2.criticalHitTexture,_local_2.criticalHitSize);
         _local_3.criticalHitSize = _local_2.criticalHitSize;
         _local_3.shotSound = _local_2.shotSound.sound;
         _local_3.explosionSound = _local_2.explosionSound.sound;
         _local_3.explosionSize = _local_2.explosionSize;
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.loh = _local_4.jaqirynu("shot");
         _local_3.jowe = _local_4.jaqirynu("hit");
         _arg_1.putParams(Duk,_local_3);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Duk = Duk(_arg_1.getParams(Duk));
         suner.releaseMaterial(_local_2.jenugo);
         suner.releaseMaterial(_local_2.hevi.material);
         suner.releaseMaterial(_local_2.ranorywag);
         suner.releaseMaterial(_local_2.qobupar.material);
      }
      
      public function fireru(_arg_1:ClientObject) : Rubelyvo
      {
         var _local_2:Duk = Duk(_arg_1.getParams(Duk));
         return new Luga(battleService.getBattleRunner().lokezi(),battleService.getObjectPool(),_local_2);
      }
   }
}

