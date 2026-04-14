package obfuscation.dozas
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import obfuscation.jete.Bawaz;
   import obfuscation.jete.Hyte;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.ISoundEffectDestructionListener;
   import obfuscation.rofa.Jacit;
   import obfuscation.rofa.MobileSound3DEffect;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.OmniStreamLightEffect;
   import obfuscation.rofa.Sound3D;
   import obfuscation.vynoq.Peg;
   
   public class Foc extends BattleRunnerProvider implements Peg, ISoundEffectDestructionListener
   {
      
      private var vopa:ObjectPool;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:Hyte;
      
      private var ceb:Bawaz;
      
      private var hyq:MobileSound3DEffect;
      
      private var byroqagy:OmniStreamLightEffect;
      
      private var gojerilek:OmniStreamLightEffect;
      
      public function Foc(_arg_1:ObjectPool, _arg_2:Number, _arg_3:Number, _arg_4:Hyte)
      {
         super();
         this.vopa = _arg_1;
         this.range = _arg_2;
         this.coneAngle = _arg_3;
         this.sfxData = _arg_4;
      }
      
      public function bihev(_arg_1:Body, _arg_2:Vector3, _arg_3:Object3D) : void
      {
         if(this.ceb == null)
         {
            this.wezaraquz(_arg_1,_arg_2,_arg_3);
            this.vos(_arg_3);
            this.hez(_arg_2,_arg_3);
         }
      }
      
      public function hez(_arg_1:Vector3, _arg_2:Object3D) : void
      {
         var _local_3:MuzzlePositionProvider = null;
         var _local_4:Jacit = null;
         if(this.byroqagy == null)
         {
            this.byroqagy = OmniStreamLightEffect(this.vopa.getObject(OmniStreamLightEffect));
            _local_3 = MuzzlePositionProvider(this.vopa.getObject(MuzzlePositionProvider));
            _local_3.init(_arg_2,_arg_1);
            this.byroqagy.init(_local_3,this.sfxData.ryzywopev,this.sfxData.robojy);
            battleService.getBattleScene3D().addGraphicEffect(this.byroqagy);
         }
         if(this.gojerilek == null)
         {
            this.gojerilek = OmniStreamLightEffect(this.vopa.getObject(OmniStreamLightEffect));
            _local_4 = Jacit(this.vopa.getObject(Jacit));
            _local_4.init(_arg_2,_arg_1,fahysemas().soc(),Gozipijoh.jusyqejyb);
            this.gojerilek.init(_local_4,this.sfxData.hihok,this.sfxData.rydodo);
            battleService.getBattleScene3D().addGraphicEffect(this.gojerilek);
         }
      }
      
      private function wezaraquz(_arg_1:Body, _arg_2:Vector3, _arg_3:Object3D) : void
      {
         this.ceb = Bawaz(this.vopa.getObject(Bawaz));
         this.ceb.init(_arg_1,this.range,this.coneAngle,Gozipijoh.fezu,_arg_2,_arg_3,this.sfxData,fahysemas().soc(),Gozipijoh.lagycewun,Gozipijoh.duronirut,Gozipijoh.cukefep,Gozipijoh.tesiwyjuv,Gozipijoh.zihyhi,Gozipijoh.darigotuk);
         battleService.getBattleScene3D().addGraphicEffect(this.ceb);
      }
      
      private function vos(_arg_1:Object3D) : void
      {
         var _local_2:Sound3D = Sound3D.create(this.sfxData.byl,Gozipijoh.qojer);
         this.hyq = MobileSound3DEffect(this.vopa.getObject(MobileSound3DEffect));
         this.hyq.jop(_local_2,_arg_1,this);
         fahysemas().lokezi().vakydiqip(this.hyq);
      }
      
      public function tesebelyd() : void
      {
         if(this.ceb != null)
         {
            this.ceb.kill();
            this.ceb = null;
            this.tyzej();
            this.byroqagy.stop();
            this.byroqagy = null;
            this.gojerilek.stop();
            this.gojerilek = null;
         }
      }
      
      private function tyzej() : void
      {
         if(this.hyq != null)
         {
            this.hyq.kill();
            this.hyq = null;
         }
      }
      
      public function tuci(_arg_1:ISound3DEffect) : void
      {
         if(this.hyq == _arg_1)
         {
            this.hyq = null;
         }
      }
   }
}

