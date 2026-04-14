package obfuscation.venu
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.utils.MathUtils;
   import alternativa.tanks.utils.objectpool.Pool;
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.facod.Fiwugowyr;
   import obfuscation.lyjufaq.Lodywy;
   import obfuscation.lyjufaq.Zokisase;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.Gojaca;
   import obfuscation.rofa.Qadiwiz;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   import obfuscation.samona.Diqije;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   
   public class Qeg extends Fiwugowyr
   {
      
      private var weakening:DistanceWeakening;
      
      private var sfxData:Kehyhyhy;
      
      private var callback:Jihidy;
      
      private var kugesofoq:Diqije;
      
      private var impactForce:Number;
      
      private var sprite:AnimatedSprite3D;
      
      private var gojerilek:AnimatedLightEffect;
      
      private var lonyq:Qadiwiz;
      
      private var fomyw:Vokewi;
      
      public function Qeg(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new AnimatedSprite3D(Zepube.wogy,Zepube.wogy);
         this.sprite.qawokyb = true;
      }
      
      override protected function mosy() : Zokisase
      {
         return Lodywy.INSTANCE;
      }
      
      public function init(_arg_1:Number, _arg_2:Diqije, _arg_3:Kehyhyhy, _arg_4:DistanceWeakening, _arg_5:Jihidy, _arg_6:Vokewi) : void
      {
         this.impactForce = _arg_1;
         this.kugesofoq = _arg_2;
         this.weakening = _arg_4;
         this.sfxData = _arg_3;
         this.callback = _arg_5;
         this.fomyw = _arg_6;
         this.sprite.vuhi(_arg_3.rajujudaz);
         this.sprite.kiba(this.sprite.getNumFrames() * Math.random());
         this.sprite.alpha = 1;
         this.sprite.rotation = MathUtils.PI2 * Math.random();
         this.gojerilek = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         this.lonyq = Qadiwiz(battleService.getObjectPool().getObject(Qadiwiz));
         this.gojerilek.init(this.lonyq,_arg_3.lamikuniv,AnimatedLightEffect.govav,true);
      }
      
      override public function rykysap(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:Body, _arg_4:int = -1) : void
      {
         super.rykysap(_arg_1,_arg_2,_arg_3,_arg_4);
         battleService.getBattleScene3D().addObject(this.sprite);
         battleService.addGraphicEffect(this.gojerilek);
      }
      
      override protected function vuq() : Number
      {
         return this.kugesofoq.speed;
      }
      
      override protected function rywycahe() : Number
      {
         return this.weakening.wyky();
      }
      
      override protected function zasesono(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:int) : void
      {
         var _local_6:Tank = null;
         super.zasesono(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         var _local_7:Number = this.weakening.sygyta(_arg_4);
         this.goz(_arg_2,_local_7);
         var _local_8:Boolean = true;
         if(BattleUtils.pote(_arg_1))
         {
            _local_6 = _arg_1.tank;
            _local_6.tyvedyz(_arg_2,_arg_3,this.impactForce * _local_7);
            if(Boolean(this.callback))
            {
               this.callback.fanucaqy(jobopa(),_arg_1,_arg_2);
            }
         }
         else
         {
            if(Boolean(this.callback) && _local_8)
            {
               this.callback.dyfac(jobopa(),_arg_2);
            }
            this.laqevoj(_arg_2);
         }
         this.destroy();
      }
      
      override public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = _arg_2 / thousandth.getInt();
         this.sprite.update(_local_3);
         this.sprite.x = roca.x;
         this.sprite.y = roca.y;
         this.sprite.z = roca.z;
         this.sprite.rotation -= 3 * _local_3;
         var _local_4:Number = this.kugesofoq.distance - segelehe;
         if(_local_4 < Zepube.cuba)
         {
            this.sprite.alpha = _local_4 / Zepube.cuba;
         }
         this.lonyq.setPosition(roca);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         battleService.getBattleScene3D().removeObject(this.sprite);
         this.kugesofoq = null;
         this.callback = null;
         cupy = null;
         this.weakening = null;
         this.sfxData = null;
         this.sprite.material = null;
         this.sprite.colorTransform = null;
         this.gojerilek.kill();
         this.gojerilek = null;
         this.lonyq = null;
      }
      
      override protected function gow() : Number
      {
         return this.kugesofoq.shellRadius;
      }
      
      private function goz(_arg_1:Vector3, _arg_2:Number) : void
      {
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,Zepube.pale);
         var _local_4:Number = Zepube.qetijil * (1 + _arg_2) / 2;
         var _local_5:Bikuqy = Bikuqy(battleService.getObjectPool().getObject(Bikuqy));
         _local_5.init(_local_4,_local_4,this.sfxData.hevi,MathUtils.PI2 * Math.random(),_local_3,0.5,0.5);
         battleService.addGraphicEffect(_local_5);
         this.wiryhuk(_arg_1);
      }
      
      private function wiryhuk(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,Zepube.pale);
         _local_2.init(_local_3,this.sfxData.kahigi);
         battleService.addGraphicEffect(_local_2);
      }
      
      private function laqevoj(_arg_1:Vector3) : void
      {
         var _local_2:Gojaca = null;
         if(GPUCapabilities.gpuEnabled)
         {
            _local_2 = Gojaca(battleService.getObjectPool().getObject(Gojaca));
            _local_2.init(_arg_1,this.sfxData.fyqydyd,hiwanu,Zepube.giwufy,Zepube.vapud,Zepube.detab);
            battleService.addGraphicEffect(_local_2);
         }
      }
   }
}

