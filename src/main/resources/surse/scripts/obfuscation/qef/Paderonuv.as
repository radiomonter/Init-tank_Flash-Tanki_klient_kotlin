package obfuscation.qef
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import obfuscation.ceba.Kage;
   import obfuscation.ceba.Qatosemuf;
   import obfuscation.ceba.Qyfyma;
   import obfuscation.fudic.Hyfo;
   import obfuscation.jete.Hyte;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vynoq.Peg;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Paderonuv extends Qatosemuf implements Kage, Tycuva
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Paderonuv()
      {
         super();
      }
      
      private static function qovukozy(_arg_1:MultiframeImageResource) : TextureAnimation
      {
         var _local_2:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_2.material.resolution = Sol.tesiwyjuv / _arg_1.frameWidth;
         return _local_2;
      }
      
      private static function nyvifeweb(_arg_1:MultiframeImageResource) : TextureAnimation
      {
         var _local_2:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_2.material.resolution = Sol.duronirut / _arg_1.frameWidth;
         return _local_2;
      }
      
      public function initColorTransform(_arg_1:ClientObject, _arg_2:Vector.<Hyfo>) : void
      {
         var _local_3:Hyte = Hyte(_arg_1.getParams(Hyte));
         _local_3.vazygu = _arg_2;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Qyfyma = getInitParam();
         var _local_3:Hyte = new Hyte();
         _local_3.qyg = qovukozy(_local_2.fireTexture);
         _local_3.goqibubun = nyvifeweb(_local_2.muzzlePlaneTexture);
         _local_3.byl = _local_2.flameSound.sound;
         _local_3.particleSpeed = Sol.fezu;
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.ryzywopev = _local_4.jaqirynu("start");
         _local_3.robojy = _local_4.jaqirynu("loop");
         _local_3.hihok = _local_4.jaqirynu("startFire");
         _local_3.rydodo = _local_4.jaqirynu("loopFire");
         _arg_1.putParams(Hyte,_local_3);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Hyte = Hyte(_arg_1.getParams(Hyte));
         suner.releaseMaterial(_local_2.qyg.material);
         suner.releaseMaterial(_local_2.goqibubun.material);
      }
      
      public function towymory(_arg_1:Number, _arg_2:Number, _arg_3:ClientObject) : Peg
      {
         var _local_4:Hyte = Hyte(_arg_3.getParams(Hyte));
         return new Vogigy(battleService.getObjectPool(),_arg_1,_arg_2,_local_4);
      }
   }
}

