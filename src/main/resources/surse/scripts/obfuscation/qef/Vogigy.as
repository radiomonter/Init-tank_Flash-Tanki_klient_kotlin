package obfuscation.qef
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import obfuscation.jete.Bawaz;
   import obfuscation.jete.Hyte;
   import obfuscation.rofa.Gesyqa;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.ISoundEffectDestructionListener;
   import obfuscation.rofa.Jacit;
   import obfuscation.rofa.MobileSound3DEffect;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.OmniStreamLightEffect;
   import obfuscation.rofa.Sound3D;
   import obfuscation.vynoq.Peg;
   
   public class Vogigy extends BattleRunnerProvider implements Peg, ISoundEffectDestructionListener
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const qapo:Number = 100;
      
      private var vopa:ObjectPool;
      
      private var range:Number;
      
      private var coneAngle:Number;
      
      private var sfxData:Hyte;
      
      private var ceb:Bawaz;
      
      private var hyq:MobileSound3DEffect;
      
      private var byroqagy:OmniStreamLightEffect;
      
      private var gojerilek:OmniStreamLightEffect;
      
      public function Vogigy(_arg_1:ObjectPool, _arg_2:Number, _arg_3:Number, _arg_4:Hyte)
      {
         super();
         this.vopa = _arg_1;
         this.range = _arg_2;
         this.coneAngle = _arg_3;
         this.sfxData = _arg_4;
      }
      
      public function bihev(_arg_1:Body, _arg_2:Vector3, _arg_3:Object3D) : void
      {
         var _local_4:Sound3D = null;
         var _local_5:MuzzlePositionProvider = null;
         var _local_6:Vector3 = null;
         var _local_7:MuzzlePositionProvider = null;
         var _local_8:Jacit = null;
         var _local_9:Gesyqa = null;
         if(this.ceb == null)
         {
            this.ceb = Bawaz(this.vopa.getObject(Bawaz));
            this.ceb.init(_arg_1,this.range,this.coneAngle,Sol.fezu,_arg_2,_arg_3,this.sfxData,fahysemas().soc(),Sol.lagycewun,Sol.duronirut,Sol.cukefep,Sol.tesiwyjuv,Sol.fubyredak,Sol.cigefi);
            battleService.getBattleScene3D().addGraphicEffect(this.ceb);
            _local_4 = Sound3D.create(this.sfxData.byl,Sol.qojer);
            this.hyq = MobileSound3DEffect(this.vopa.getObject(MobileSound3DEffect));
            this.hyq.jop(_local_4,_arg_3,this);
            fahysemas().lokezi().vakydiqip(this.hyq);
            this.byroqagy = OmniStreamLightEffect(this.vopa.getObject(OmniStreamLightEffect));
            _local_5 = MuzzlePositionProvider(this.vopa.getObject(MuzzlePositionProvider));
            _local_6 = new Vector3();
            _local_6.copy(_arg_2);
            _local_6.z += this.qapo;
            _local_5.init(_arg_3,_arg_2);
            _local_5.init(_arg_3,_arg_2,0);
            _local_7 = MuzzlePositionProvider(this.vopa.getObject(MuzzlePositionProvider));
            _local_7.init(_arg_3,_local_6);
            _local_7.init(_arg_3,_local_6,0);
            this.byroqagy.init(_local_7,this.sfxData.ryzywopev,this.sfxData.robojy);
            battleService.getBattleScene3D().addGraphicEffect(this.byroqagy);
            this.gojerilek = OmniStreamLightEffect(this.vopa.getObject(OmniStreamLightEffect));
            _local_8 = Jacit(this.vopa.getObject(Jacit));
            _local_8.init(_arg_3,_arg_2,fahysemas().soc(),Sol.jusyqejyb);
            _local_9 = Gesyqa(this.vopa.getObject(Gesyqa));
            _local_9.init(this.ceb,_local_8);
            this.gojerilek.init(_local_9,this.sfxData.hihok,this.sfxData.rydodo);
            battleService.getBattleScene3D().addGraphicEffect(this.gojerilek);
         }
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

