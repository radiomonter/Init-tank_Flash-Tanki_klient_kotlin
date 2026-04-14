package obfuscation.dozas
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import obfuscation.bidop.Dowefu;
   import obfuscation.bidop.Jijemawo;
   import obfuscation.bidop.Vuqahonut;
   import obfuscation.jete.Hyte;
   import obfuscation.rokal.Riwizy;
   import obfuscation.vynoq.Peg;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Gek extends Vuqahonut implements Jijemawo, Hah
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      public function Gek()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Dowefu = getInitParam();
         var _local_3:Hyte = new Hyte();
         _local_3.qyg = this.qovukozy(_local_2.particleTextureResource);
         _local_3.goqibubun = this.nyvifeweb(_local_2.planeTextureResource);
         _local_3.particleSpeed = BattleUtils.pamo(_local_2.particleSpeed);
         _local_3.byl = _local_2.shotSoundResource.sound;
         var _local_4:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_3.ryzywopev = _local_4.jaqirynu("start");
         _local_3.robojy = _local_4.jaqirynu("loop");
         _local_3.hihok = _local_4.jaqirynu("startFire");
         _local_3.rydodo = _local_4.jaqirynu("loopFire");
         _arg_1.putParams(Hyte,_local_3);
      }
      
      private function qovukozy(_arg_1:MultiframeImageResource) : TextureAnimation
      {
         var _local_2:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_2.material.resolution = Gozipijoh.tesiwyjuv / _arg_1.frameWidth;
         return _local_2;
      }
      
      private function nyvifeweb(_arg_1:MultiframeImageResource) : TextureAnimation
      {
         var _local_2:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(suner,_arg_1);
         _local_2.material.resolution = Gozipijoh.duronirut / _arg_1.frameWidth;
         return _local_2;
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Hyte = Hyte(_arg_1.getParams(Hyte));
         suner.releaseMaterial(_local_2.qyg.material);
         suner.releaseMaterial(_local_2.goqibubun.material);
      }
      
      public function jyvemoz(_arg_1:Number, _arg_2:Number, _arg_3:ClientObject) : Peg
      {
         var _local_4:Hyte = Hyte(_arg_3.getParams(Hyte));
         return new Foc(battleService.getObjectPool(),_arg_1,_arg_2,_local_4);
      }
   }
}

