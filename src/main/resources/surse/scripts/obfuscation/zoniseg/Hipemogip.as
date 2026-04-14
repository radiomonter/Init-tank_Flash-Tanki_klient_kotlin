package obfuscation.zoniseg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.sfx.GraphicEffect;
   import flash.geom.Vector3D;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.Dujezomi;
   import obfuscation.rofa.Hekid;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.ISoundEffectDestructionListener;
   import obfuscation.rofa.Jiby;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.Nyr;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   
   public class Hipemogip implements Benywani, Nyr, ISoundEffectDestructionListener
   {
      
      public static const peto:int = 300;
      
      public static const zod:Number = 300;
      
      public static const nuzane:Number = 200;
      
      public static const jonowi:Number = 30;
      
      private static const sikam:Number = 50;
      
      private static const honihy:Number = 25;
      
      private static const fupybocib:Number = 0.5;
      
      private static const demobi:Number = 1.5;
      
      private static const qivesimiz:Number = 20;
      
      private static const fisoq:int = 500;
      
      private static const zuracog:Number = 80;
      
      private static const mon:Number = 0.5;
      
      private static const winuwo:Number = 2;
      
      private static const cemybeb:Number = 100;
      
      private static const byb:int = 2200;
      
      private static const qojer:Number = 1;
      
      private static const pygab:Vector3D = new Vector3D();
      
      private static const fadijaje:Vector3D = new Vector3D();
      
      private static const rosuja:Vector3 = new Vector3();
      
      private static const saqula:Vector3 = new Vector3();
      
      private static const fylafivu:Vector3 = new Vector3();
      
      private static const dygese:Vector3 = new Vector3();
      
      private static const v:Vector3 = new Vector3();
      
      private var sfxData:Geb;
      
      private var battleService:BattleService;
      
      private var hycaculyv:Hidi;
      
      private var fuconoq:AnimatedLightEffect;
      
      private var hyq:Sound3DEffect;
      
      public function Hipemogip(_arg_1:Geb, _arg_2:BattleService)
      {
         super();
         this.sfxData = _arg_1;
         this.battleService = _arg_2;
      }
      
      private static function huqa(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         _arg_4.copy(_arg_1).subtract(_arg_2);
         var _local_5:Number = _arg_4.dot(_arg_3);
         _arg_4.copy(_arg_2).addScaled(_local_5,_arg_3);
      }
      
      private static function jusabyzi(_arg_1:Vector3D, _arg_2:Vector3D, _arg_3:TankSkin) : RayIntersectionData
      {
         var _local_4:RayIntersectionData = raycast(_arg_3.repijumu(),_arg_1,_arg_2);
         var _local_5:RayIntersectionData = raycast(_arg_3.rocipaga(),_arg_1,_arg_2);
         if(_local_4 == null)
         {
            return _local_5;
         }
         if(_local_5 == null)
         {
            return _local_4;
         }
         if(_local_5.time < _local_4.time)
         {
            return _local_5;
         }
         return _local_4;
      }
      
      private static function raycast(_arg_1:Object3D, _arg_2:Vector3D, _arg_3:Vector3D) : RayIntersectionData
      {
         var _local_4:Vector3D = _arg_1.globalToLocal(_arg_2);
         var _local_5:Vector3D = _arg_3.clone();
         _local_5.x += _arg_1.x;
         _local_5.y += _arg_1.y;
         _local_5.z += _arg_1.z;
         var _local_6:Vector3D = _arg_1.globalToLocal(_local_5);
         return _arg_1.intersectRay(_local_4,_local_6);
      }
      
      private static function jijema(_arg_1:Vector3) : Vector3
      {
         dygese.x = Math.atan2(_arg_1.z,Math.sqrt(_arg_1.x * _arg_1.x + _arg_1.y * _arg_1.y)) - Math.PI / 2;
         dygese.y = 0;
         dygese.z = -Math.atan2(_arg_1.x,_arg_1.y);
         return dygese;
      }
      
      public function qis(_arg_1:Vector3, _arg_2:Object3D, _arg_3:int) : void
      {
         if(this.hycaculyv != null)
         {
            this.hycaculyv.kill();
         }
         this.hycaculyv = Hidi(this.battleService.getObjectPool().getObject(Hidi));
         this.hycaculyv.init(peto,peto,this.sfxData.fofu,_arg_1,_arg_2,0,this.motoqif(_arg_3),this);
         this.battleService.addGraphicEffect(this.hycaculyv);
         this.binifej(_arg_1,_arg_2,_arg_3);
      }
      
      public function binifej(_arg_1:Vector3, _arg_2:Object3D, _arg_3:int) : void
      {
         if(this.fuconoq != null)
         {
            this.fuconoq.kill();
         }
         this.fuconoq = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(_arg_2,_arg_1);
         this.fuconoq.rugil(_local_4,_arg_3,this.sfxData.goqiqah);
         this.battleService.addGraphicEffect(this.fuconoq);
      }
      
      private function motoqif(_arg_1:int) : Number
      {
         return 1000 * this.sfxData.fofu.sakito.length / _arg_1;
      }
      
      public function vos(_arg_1:Vector3) : void
      {
         if(this.hyq != null)
         {
            this.hyq.kill();
         }
         var _local_2:Sound3D = Sound3D.create(this.sfxData.sound,qojer);
         this.hyq = Sound3DEffect.create(_arg_1,_local_2,0,0,this);
         this.battleService.wikyhih(this.hyq);
      }
      
      public function lys(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_4:Kik = null;
         var _local_5:Vynacoki = null;
         if(_arg_2 == null)
         {
            _arg_2 = Sod.teluwelyp(_arg_1,_arg_3);
         }
         v.diff(_arg_2,_arg_1);
         if(v.dot(_arg_3) > 0)
         {
            _local_4 = Kik(this.battleService.getObjectPool().getObject(Kik));
            _local_4.init(_arg_1,_arg_2,this.sfxData.sarasave,honihy,fupybocib,demobi,qivesimiz,fisoq);
            this.battleService.addGraphicEffect(_local_4);
            _local_5 = Vynacoki(this.battleService.getObjectPool().getObject(Vynacoki));
            _local_5.init(_arg_1,_arg_2,this.sfxData.mita,zuracog,mon,winuwo,cemybeb,byb);
            this.battleService.addGraphicEffect(_local_5);
         }
         this.muroj(_arg_1);
         this.gucop(_arg_1,_arg_2);
      }
      
      private function gucop(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         var _local_4:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,0);
         _local_4.init(_arg_2,0);
         var _local_5:Dujezomi = Dujezomi(this.battleService.getObjectPool().getObject(Dujezomi));
         _local_5.init(_local_3,_local_4,this.sfxData.padymysep);
         this.battleService.addGraphicEffect(_local_5);
      }
      
      public function muroj(_arg_1:Vector3) : void
      {
         var _local_2:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_3.init(_arg_1,0);
         _local_2.init(_local_3,this.sfxData.loh);
         this.battleService.addGraphicEffect(_local_2);
      }
      
      public function rehunizu(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         if(_arg_2 != null)
         {
            this.battleService.getBattleScene3D().addDecal(_arg_2,_arg_1,sikam,this.sfxData.fyqydyd);
         }
      }
      
      public function tesebelyd() : void
      {
         if(this.hycaculyv != null)
         {
            this.hycaculyv.kill();
            this.hycaculyv = null;
         }
         if(this.fuconoq != null)
         {
            this.fuconoq.kill();
            this.fuconoq = null;
         }
         if(this.hyq != null)
         {
            this.hyq.kill();
            this.hyq = null;
         }
      }
      
      public function sabeva(_arg_1:GraphicEffect) : void
      {
         if(this.hycaculyv == _arg_1)
         {
            this.hycaculyv = null;
         }
      }
      
      public function tuci(_arg_1:ISound3DEffect) : void
      {
         if(this.hyq == _arg_1)
         {
            this.hyq = null;
         }
      }
      
      public function howupipo(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector.<Vector3>, _arg_4:Vector.<Body>) : void
      {
         var _local_5:Body = null;
         var _local_6:Tank = null;
         var _local_7:RayIntersectionData = null;
         var _local_8:Object3D = null;
         var _local_9:Vector3D = null;
         var _local_10:int = 0;
         pygab.x = _arg_1.x;
         pygab.y = _arg_1.y;
         pygab.z = _arg_1.z;
         fadijaje.x = _arg_2.x - _arg_1.x;
         fadijaje.y = _arg_2.y - _arg_1.y;
         fadijaje.z = _arg_2.z - _arg_1.z;
         fylafivu.copy(_arg_2).subtract(_arg_1).normalize();
         while(_local_10 < _arg_4.length)
         {
            _local_5 = _arg_4[_local_10];
            if(_local_5 != null && _local_5.tank != null)
            {
               _local_6 = _local_5.tank;
               _local_7 = jusabyzi(pygab,fadijaje,_local_6.bij());
               if(_local_7 == null)
               {
                  huqa(_arg_3[_local_10],_arg_1,fylafivu,rosuja);
                  saqula.copy(fylafivu);
               }
               else
               {
                  _local_8 = _local_7.object;
                  rosuja.copyFromVector3D(_local_8.localToGlobal(_local_7.point));
                  _local_9 = _local_8.localToGlobal(_local_7.face.normal);
                  saqula.x = _local_9.x - _local_8.x;
                  saqula.y = _local_9.y - _local_8.y;
                  saqula.z = _local_9.z - _local_8.z;
               }
               this.dipydezor(rosuja,saqula,fylafivu);
               this.fugyw(rosuja,saqula);
            }
            _local_10++;
         }
      }
      
      private function fugyw(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:AnimatedLightEffect = AnimatedLightEffect(this.battleService.getObjectPool().getObject(AnimatedLightEffect));
         var _local_4:Jiby = Jiby(this.battleService.getObjectPool().getObject(Jiby));
         _local_4.init(_arg_1,_arg_2,50);
         _local_3.init(_local_4,this.sfxData.jowe);
         this.battleService.addGraphicEffect(_local_3);
      }
      
      private function dipydezor(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_4:Hekid = Hekid(this.battleService.getObjectPool().getObject(Hekid));
         _local_4.init(zod,_arg_1,jijema(_arg_2),this.sfxData.hudawo,1);
         this.battleService.getBattleScene3D().addGraphicEffect(_local_4);
         var _local_5:Bikuqy = Bikuqy(this.battleService.getObjectPool().getObject(Bikuqy));
         var _local_6:StaticObject3DPositionProvider = StaticObject3DPositionProvider(this.battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         _local_6.init(_arg_1,30);
         _local_5.init(nuzane,nuzane,this.sfxData.fozypyry,0,_local_6,0.5,0.5,null,0);
         this.battleService.getBattleScene3D().addGraphicEffect(_local_5);
         var _local_7:Maweci = Maweci(this.battleService.getObjectPool().getObject(Maweci));
         _local_7.init(_arg_1,_arg_3,this.sfxData.tomari);
         this.battleService.getBattleScene3D().addGraphicEffect(_local_7);
      }
      
      public function mowyb(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         fylafivu.copy(_arg_2).subtract(_arg_1).normalize();
         this.dipydezor(_arg_2,_arg_3,fylafivu);
         this.fugyw(_arg_2,_arg_3);
      }
   }
}

