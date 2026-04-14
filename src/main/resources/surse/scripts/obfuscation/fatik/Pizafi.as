package obfuscation.fatik
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.engine3d.AnimatedSprite3D;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.tanks.utils.objectpool.Pool;
   import flash.media.Sound;
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.facod.Jybawabaz;
   import obfuscation.kewic.Pafijoban;
   import obfuscation.kyre.Myw;
   import obfuscation.lyjufaq.Lodywy;
   import obfuscation.lyjufaq.Zokisase;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.Jyj;
   import obfuscation.rofa.Qadiwiz;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   
   public class Pizafi extends Jybawabaz
   {
      
      public static const wogy:Number = 300;
      
      public static const qetijil:Number = 266;
      
      public static const honihy:Number = 100;
      
      private static const jonakyj:Number = 80;
      
      private static const julygyhe:Number = 300;
      
      private static const bigob:int = 6;
      
      private static const jej:Vector3 = new Vector3();
      
      private static const wij:Vector3 = new Vector3();
      
      private static const lozybom:Vector3 = new Vector3();
      
      private var sfxData:Lujimarem;
      
      private var callback:Vanebegum;
      
      private var impactPoints:Vector.<Vector3>;
      
      private var huzes:Pafijoban;
      
      private var sprite:AnimatedSprite3D;
      
      private var weakening:DistanceWeakening;
      
      private var lywufa:int;
      
      private var sehokos:Lulezo;
      
      private var impactForce:Number;
      
      private var muwoneqiv:AnimatedLightEffect;
      
      private var lonyq:Qadiwiz;
      
      private var fomyw:Vokewi;
      
      public function Pizafi(_arg_1:Pool)
      {
         super(_arg_1);
         this.sprite = new AnimatedSprite3D(wogy,wogy);
         this.sprite.qawokyb = true;
         this.sehokos = new Lulezo(honihy,julygyhe);
         this.impactPoints = new Vector.<Vector3>();
      }
      
      override protected function mosy() : Zokisase
      {
         return Lodywy.INSTANCE;
      }
      
      public function init(_arg_1:Number, _arg_2:Pafijoban, _arg_3:Lujimarem, _arg_4:DistanceWeakening, _arg_5:Vanebegum, _arg_6:Vokewi) : void
      {
         this.impactForce = _arg_1;
         this.huzes = _arg_2;
         this.sfxData = _arg_3;
         this.weakening = _arg_4;
         this.callback = _arg_5;
         this.fomyw = _arg_6;
         this.sprite.rotation = 2 * Math.PI * Math.random();
         this.sprite.vuhi(_arg_3.rajujudaz);
         this.sprite.kiba(this.sprite.getNumFrames() * Math.random());
         this.sehokos.setMaterialToAllFaces(_arg_3.fyjuvypal);
         this.lywufa = 0;
         this.impactPoints.length = 0;
         this.muwoneqiv = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         this.lonyq = Qadiwiz(battleService.getObjectPool().getObject(Qadiwiz));
         this.muwoneqiv.init(this.lonyq,_arg_3.roficujiz,AnimatedLightEffect.govav,true);
      }
      
      override public function rykysap(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:Body, _arg_4:int = -1) : void
      {
         super.rykysap(_arg_1,_arg_2,_arg_3,_arg_4);
         var _local_5:BattleScene3D = battleService.getBattleScene3D();
         _local_5.addObject(this.sprite);
         _local_5.addObject(this.sehokos);
         _local_5.kyj(this.sehokos);
         _local_5.addGraphicEffect(this.muwoneqiv);
      }
      
      override protected function update(_arg_1:Number) : void
      {
         var _local_2:Body = null;
         var _local_5:int = 0;
         var _local_6:Vector3 = null;
         var _local_7:Boolean = false;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_8:Number = NaN;
         if(segelehe >= this.huzes.shotDistance)
         {
            this.destroy();
            return;
         }
         var _local_9:CollisionDetector = battleService.getBattleRunner().soc();
         var _local_10:Number = this.huzes.shellSpeed * _arg_1;
         loned.copy(lunyde);
         while(_local_10 > 0)
         {
            _local_3 = -1;
            _local_4 = _local_10;
            if(_local_9.raycast(lunyde,gowoziru,Myw.WEAPON,_local_10,this,verumonuv))
            {
               _local_2 = verumonuv.shape.body;
               _local_3 = verumonuv.t;
               if(BattleUtils.pote(_local_2))
               {
                  this.impactPoints.push(verumonuv.position.clone().add(verumonuv.normal));
                  this.zuhanizu(_local_2,verumonuv.position,gowoziru,segelehe + _local_3,this.impactPoints);
                  return;
               }
               _local_4 = _local_3;
               lozybom.copy(verumonuv.position);
               jej.copy(verumonuv.normal);
            }
            _local_5 = 0;
            while(_local_5 < bigob)
            {
               _local_6 = nisebi[_local_5];
               if(_local_9.raycast(_local_6,gowoziru,Myw.WEAPON,_local_4,this,verumonuv))
               {
                  _local_2 = verumonuv.shape.body;
                  cotosane.copy(lunyde).addScaled(verumonuv.t,gowoziru);
                  _local_7 = BattleUtils.pote(_local_2) && !this.jeso(lunyde,cotosane);
                  if(_local_7)
                  {
                     this.impactPoints.push(cotosane.clone());
                     this.zuhanizu(_local_2,cotosane,gowoziru,segelehe + verumonuv.t,this.impactPoints);
                     return;
                  }
               }
               _local_6.addScaled(_local_4,gowoziru);
               _local_5++;
            }
            if(_local_3 > -1)
            {
               segelehe += _local_3;
               _local_10 -= _local_3;
               if(this.lywufa >= this.huzes.maxRicochetCount)
               {
                  _local_8 = this.weakening.sygyta(segelehe);
                  this.impactPoints.push(lozybom.clone());
                  this.kotaliqi(jej,_local_8,_local_2);
                  return;
               }
               ++this.lywufa;
               lunyde.addScaled(_local_3,gowoziru);
               this.sige(jej);
               this.vepa(lunyde);
               this.impactPoints.push(lunyde.clone());
            }
            else
            {
               segelehe += _local_10;
               lunyde.addScaled(_local_10,gowoziru);
               _local_10 = 0;
            }
         }
      }
      
      private function kotaliqi(_arg_1:Vector3, _arg_2:Number = 1, _arg_3:Body = null) : void
      {
         var _local_4:Vector3 = this.impactPoints[this.impactPoints.length - 1];
         _local_4.addScaled(0.1,_arg_1);
         var _local_5:Boolean = true;
         this.goz(_local_4);
         if(Boolean(this.callback) && _local_5)
         {
            this.callback.dyfac(jobopa(),this.impactPoints);
         }
         this.destroy();
      }
      
      private function jeso(_arg_1:Vector3, _arg_2:Vector3) : Boolean
      {
         return Zicoha.fyfujuwub(_arg_1,_arg_2);
      }
      
      private function sige(_arg_1:Vector3) : void
      {
         lunyde.addScaled(0.1,_arg_1);
         gowoziru.addScaled(-2 * gowoziru.dot(_arg_1),_arg_1);
         mikizimez(lunyde,gowoziru);
      }
      
      override public function render(_arg_1:int, _arg_2:int) : void
      {
         this.sprite.x = roca.x;
         this.sprite.y = roca.y;
         this.sprite.z = roca.z;
         this.sprite.update(_arg_2 / 1000);
         var _local_3:Number = this.weakening.sygyta(segelehe);
         var _local_4:Number = wogy * _local_3;
         this.sprite.width = _local_4;
         this.sprite.height = _local_4;
         this.sprite.rotation -= 0.003 * _arg_2;
         var _local_5:Vector3 = battleService.getBattleScene3D().cewubu().position;
         Jyj.moruqogi(this.sehokos,roca,gowoziru,_local_5);
         var _local_6:Number = lunyde.x - _local_5.x;
         var _local_7:Number = lunyde.y - _local_5.y;
         var _local_8:Number = lunyde.z - _local_5.z;
         var _local_9:Number = _local_6 * _local_6 + _local_7 * _local_7 + _local_8 * _local_8;
         if(_local_9 > 0.00001)
         {
            _local_9 = 1 / Math.sqrt(_local_9);
            _local_6 *= _local_9;
            _local_7 *= _local_9;
            _local_8 *= _local_9;
         }
         var _local_10:Number = _local_6 * gowoziru.x + _local_7 * gowoziru.y + _local_8 * gowoziru.z;
         if(_local_10 < 0)
         {
            _local_10 = -_local_10;
         }
         if(_local_10 > 0.5)
         {
            this.sehokos.alpha = 2 * (1 - _local_10) * _local_3;
         }
         else
         {
            this.sehokos.alpha = _local_3;
         }
         this.lonyq.setPosition(roca);
      }
      
      override protected function destroy() : void
      {
         super.destroy();
         var _local_1:BattleScene3D = battleService.getBattleScene3D();
         _local_1.removeObject(this.sprite);
         this.sprite.material = null;
         _local_1.removeObject(this.sehokos);
         this.sehokos.setMaterialToAllFaces(null);
         _local_1.vup(this.sehokos);
         cupy = null;
         this.huzes = null;
         this.sfxData = null;
         this.weakening = null;
         this.callback = null;
         this.muwoneqiv.kill();
         this.muwoneqiv = null;
         this.lonyq = null;
      }
      
      override public function considerBody(_arg_1:Body) : Boolean
      {
         return Boolean(super.considerBody(_arg_1)) || this.lywufa > 0;
      }
      
      private function goz(_arg_1:Vector3) : void
      {
         var _local_7:int = 0;
         var _local_2:ObjectPool = battleService.getObjectPool();
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_local_2.getObject(StaticObject3DPositionProvider));
         var _local_4:int = 50;
         _local_3.init(_arg_1,_local_4);
         var _local_5:Bikuqy = Bikuqy(_local_2.getObject(Bikuqy));
         var _local_6:Number = Math.random() * Math.PI * 2;
         _local_5.init(qetijil,qetijil,this.sfxData.hevi,_local_6,_local_3,0.5,0.5,null,_local_7);
         battleService.addGraphicEffect(_local_5);
         this.mized(this.sfxData.explosionSound,_arg_1);
         this.wiryhuk(_arg_1);
      }
      
      private function wiryhuk(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,50);
         _local_2.init(_local_3,this.sfxData.jowe);
         battleService.addGraphicEffect(_local_2);
      }
      
      private function raz(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,50);
         _local_2.init(_local_3,this.sfxData.faqe);
         battleService.addGraphicEffect(_local_2);
      }
      
      private function mized(_arg_1:Sound, _arg_2:Vector3) : void
      {
         var _local_4:Sound3D = null;
         var _local_5:Sound3DEffect = null;
         var _local_3:Number = NaN;
         if(_arg_1 != null)
         {
            _local_3 = 0.8;
            _local_4 = Sound3D.create(_arg_1,_local_3);
            _local_5 = Sound3DEffect.create(_arg_2,_local_4);
            battleService.wikyhih(_local_5);
         }
      }
      
      private function zuhanizu(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:Vector.<Vector3>) : void
      {
         this.goz(_arg_2);
         var _local_6:Number = this.weakening.sygyta(_arg_4);
         var _local_7:Tank = _arg_1.tank;
         _local_7.tyvedyz(_arg_2,_arg_3,_local_6 * this.impactForce);
         this.fanucaqy(_arg_1,_arg_5);
         this.destroy();
      }
      
      private function fanucaqy(_arg_1:Body, _arg_2:Vector.<Vector3>) : void
      {
         if(Boolean(this.callback))
         {
            this.callback.fanucaqy(jobopa(),_arg_1,_arg_2);
         }
      }
      
      private function vepa(_arg_1:Vector3) : void
      {
         var _local_2:ObjectPool = battleService.getObjectPool();
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_local_2.getObject(StaticObject3DPositionProvider));
         var _local_4:int = 50;
         _local_3.init(_arg_1,_local_4);
         var _local_5:Bikuqy = Bikuqy(_local_2.getObject(Bikuqy));
         _local_5.init(jonakyj,jonakyj,this.sfxData.vefir,Math.random() * Math.PI * 2,_local_3,0.5,0.5);
         battleService.addGraphicEffect(_local_5);
         this.mized(this.sfxData.ricochetSound,_arg_1);
         this.raz(_arg_1);
      }
      
      override protected function tagadymav() : Boolean
      {
         var _local_1:CollisionDetector = battleService.getBattleRunner().soc();
         wij.diff(lunyde,hiwanu);
         var _local_2:Number = wij.length();
         wij.normalize();
         return this.koqotec(wij,_local_2,_local_1);
      }
      
      private function koqotec(_arg_1:Vector3, _arg_2:Number, _arg_3:CollisionDetector) : Boolean
      {
         if(_arg_3.raycast(hiwanu,_arg_1,Myw.WEAPON,_arg_2,this,verumonuv))
         {
            this.impactPoints.push(verumonuv.position.clone());
            if(BattleUtils.pote(verumonuv.shape.body))
            {
               this.zuhanizu(verumonuv.shape.body,verumonuv.position,_arg_1,0,this.impactPoints);
               return true;
            }
            if(this.lywufa >= this.huzes.maxRicochetCount)
            {
               this.kotaliqi(verumonuv.normal);
               return true;
            }
            ++this.lywufa;
            lunyde.copy(verumonuv.position);
            this.sige(verumonuv.normal);
            this.vepa(verumonuv.position);
            return false;
         }
         return this.rewi(_arg_1,_arg_2,_arg_3);
      }
      
      private function rewi(_arg_1:Vector3, _arg_2:Number, _arg_3:CollisionDetector) : Boolean
      {
         var _local_4:Vector3 = null;
         var _local_5:Body = null;
         var _local_6:int = 0;
         mikizimez(hiwanu,_arg_1);
         while(_local_6 < bigob)
         {
            _local_4 = nisebi[_local_6];
            if(_arg_3.raycast(_local_4,gowoziru,Myw.WEAPON,_arg_2,this,verumonuv))
            {
               _local_5 = verumonuv.shape.body;
               if(BattleUtils.pote(_local_5))
               {
                  cotosane.copy(hiwanu).addScaled(verumonuv.t,_arg_1);
                  this.impactPoints.push(cotosane.clone());
                  this.zuhanizu(_local_5,cotosane,_arg_1,0,this.impactPoints);
                  return true;
               }
            }
            _local_6++;
         }
         return false;
      }
      
      override protected function gow() : Number
      {
         return this.huzes.shellRadius;
      }
      
      override protected function mujid() : int
      {
         return bigob;
      }
   }
}

