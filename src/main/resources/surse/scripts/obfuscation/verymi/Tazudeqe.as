package obfuscation.verymi
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Tujat;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.models.weapon.WeaponConst;
   import alternativa.tanks.utils.GraphicsUtils;
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.media.Sound;
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.Myw;
   import obfuscation.lyguh.Codyw;
   import obfuscation.lyguh.Dedadeseq;
   import obfuscation.lyguh.Fywysehe;
   import obfuscation.rofa.AnimatedLightEffect;
   import obfuscation.rofa.Bikuqy;
   import obfuscation.rofa.LightAnimation;
   import obfuscation.rofa.Puqo;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import obfuscation.rofa.StaticObject3DPositionProvider;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Tazudeqe extends Dedadeseq implements Fywysehe, ObjectLoadListener, ObjectUnloadListener, IDumper, BattleEventListener, Baryly, Pypi
   {
      
      [Inject]
      public static var dyb:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var zipemah:IDumpService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const morilunec:Number = 0.5;
      
      private static const hytapy:Number = 0.772;
      
      private static const latofaf:Number = 0.5;
      
      private static const rymiky:Number = 0.9;
      
      private static const beguv:Number = 3;
      
      private static const vubuhivi:Number = 3;
      
      private static const buduzi:Number = 0.3;
      
      private static const sikam:Number = 200;
      
      private static const muzicaju:Vector3 = new Vector3();
      
      private var gopa:Quh = new Quh();
      
      private var hepot:Dictionary = new Dictionary();
      
      private var kebewevu:Dictionary = new Dictionary();
      
      private var culafur:Number;
      
      private var wisoq:Vector.<Codyw>;
      
      private var dipopetyd:TextureMaterial;
      
      private var qubukanac:TextureMaterial;
      
      private var hapib:TextureMaterial;
      
      private var jutyranak:TextureMaterial;
      
      private var suta:Mesh;
      
      private var pegonad:TextureAnimation;
      
      private var vibopokif:Naryqiwy = new Naryqiwy();
      
      private var gudapifa:TextureAnimation;
      
      private var nutazy:Naryqiwy = new Naryqiwy();
      
      private var ranorywag:TextureMaterial;
      
      private var wel:Sound;
      
      private var explosionSound:Sound;
      
      private var faguzev:Sound;
      
      private var impactForce:Number;
      
      private var jij:IGameObject;
      
      private var dejysa:Baba;
      
      private var sagal:Dictionary = new Dictionary();
      
      private var gaz:Tank;
      
      private var minDistanceFromBase:Number;
      
      private var jidej:LightAnimation;
      
      public function Tazudeqe()
      {
         super();
         Vihep.murybyliw();
         this.pec();
      }
      
      private static function bymakurag(_arg_1:Vector3, _arg_2:TextureAnimation, _arg_3:Naryqiwy, _arg_4:Number, _arg_5:Number) : void
      {
         var _local_6:int = 50;
         var _local_7:ObjectPool = battleService.getObjectPool();
         var _local_8:StaticObject3DPositionProvider = StaticObject3DPositionProvider(_local_7.getObject(StaticObject3DPositionProvider));
         _local_8.init(_arg_1,_local_6);
         var _local_9:Bikuqy = Bikuqy(_local_7.getObject(Bikuqy));
         _local_9.init(_arg_3.width,_arg_3.height,_arg_2,0,_local_8,_arg_4,_arg_5);
         battleService.getBattleScene3D().addGraphicEffect(_local_9);
      }
      
      private static function wikyhih(_arg_1:Sound, _arg_2:Vector3, _arg_3:Number) : void
      {
         var _local_4:Sound3D = null;
         if(_arg_1 != null)
         {
            _local_4 = Sound3D.create(_arg_1,_arg_3);
            battleService.getBattleRunner().lokezi().vakydiqip(Sound3DEffect.create(_arg_2,_local_4,0));
         }
      }
      
      private static function zenyw(_arg_1:MultiframeImageResource, _arg_2:int, _arg_3:Naryqiwy) : TextureAnimation
      {
         var _local_4:TextureAnimation = GraphicsUtils.getTextureAnimationFromResource(dyb,_arg_1);
         _local_4.material.resolution = _arg_2;
         _arg_3.height = _arg_1.frameHeight * _arg_2;
         _arg_3.width = _arg_1.frameWidth * _arg_2;
         return _local_4;
      }
      
      private static function qovary(_arg_1:ImageResource) : TextureMaterial
      {
         return dyb.getMaterial(_arg_1.data);
      }
      
      private function pec() : void
      {
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Vovakopy,this.byzac);
         this.dejysa.jikina(Rujina,this.qoc);
         this.dejysa.jikina(Tujat,this.vavydisy);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.bijoja();
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function jicudi() : Number
      {
         return this.minDistanceFromBase;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.jij = object;
         zipemah.registerDumper(this);
         this.gopa.lurekoqy = 100;
         this.gopa.qabo = 300;
         this.gopa.vagyriqu = 204;
         this.gopa.hivedejy = BattleUtils.pamo(getInitParam().farVisibilityRadius);
         this.gopa.jugylapy = BattleUtils.pamo(getInitParam().nearVisibilityRadius);
         this.culafur = BattleUtils.pamo(getInitParam().radius);
         this.impactForce = getInitParam().impactForce;
         this.wel = getInitParam().activateSound.sound;
         this.explosionSound = getInitParam().explosionSound.sound;
         this.faguzev = getInitParam().deactivateSound.sound;
         this.minDistanceFromBase = BattleUtils.pamo(getInitParam().minDistanceFromBase);
         this.tyh(Tanks3DSResource(getInitParam().model3ds));
         this.pegonad = zenyw(getInitParam().mainExplosionTexture,beguv,this.vibopokif);
         this.gudapifa = zenyw(getInitParam().idleExplosionTexture,vubuhivi,this.nutazy);
         this.ranorywag = qovary(getInitParam().explosionMarkTexture);
         this.dipopetyd = qovary(getInitParam().redMineTexture);
         this.qubukanac = qovary(getInitParam().blueMineTexture);
         this.hapib = qovary(getInitParam().friendlyMineTexture);
         this.jutyranak = qovary(getInitParam().enemyMineTexture);
         this.jidej = Puqo.jaw;
         this.qakohad(getInitParam().jupola);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         zipemah.unregisterDumper(this.dumperName);
         this.tiniril();
         this.wel = null;
         this.pegonad = null;
         this.gudapifa = null;
         this.dipopetyd = null;
         this.qubukanac = null;
         this.hapib = null;
         this.jutyranak = null;
         this.jij = null;
         this.gaz = null;
         this.ranorywag = null;
         this.sagal = new Dictionary();
      }
      
      private function qakohad(_arg_1:Vector.<Codyw>) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(_arg_1.length != 0)
         {
            if(this.wisoq == null)
            {
               this.wisoq = new Vector.<Codyw>();
            }
            _local_2 = int(_arg_1.length);
            _local_3 = 0;
            while(_local_3 < _local_2)
            {
               this.wisoq.push(_arg_1[_local_3]);
               _local_3++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function kajafe(_arg_1:String, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:String) : void
      {
         var _local_6:Tank = this.sagal[_arg_5];
         if(_local_6 == null)
         {
            if(this.wisoq == null)
            {
               this.wisoq = new Vector.<Codyw>();
            }
            this.wisoq.push(new Codyw(false,_arg_1,_arg_5,new Vector3d(_arg_2,_arg_3,_arg_4)));
         }
         else
         {
            this.nyzyq(_arg_1,this.culafur,new Vector3(_arg_2,_arg_3,_arg_4),_arg_5,_local_6.teamType,this.nic(_local_6),false);
         }
      }
      
      [Obfuscation(rename="false")]
      public function mis(_arg_1:String) : void
      {
         var _local_2:Codyw = null;
         var _local_3:Mit = this.kebewevu[_arg_1];
         if(_local_3 != null)
         {
            _local_3.kivohag();
            wikyhih(this.wel,_local_3.position,buduzi);
         }
         else
         {
            for each(_local_2 in this.wisoq)
            {
               if(_local_2.mineId == _arg_1)
               {
                  _local_2.activated = true;
                  return;
               }
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function geku(_arg_1:String) : void
      {
         var _local_2:Mit = null;
         var _local_3:Mit = null;
         var _local_4:Tawud = this.hepot[_arg_1];
         if(_local_4 != null)
         {
            _local_2 = _local_4.head;
            while(_local_2 != null)
            {
               _local_3 = _local_2;
               _local_2 = _local_2.next;
               bymakurag(_local_3.position,this.gudapifa,this.nutazy,latofaf,rymiky);
               wikyhih(this.faguzev,_local_3.position,0.1);
               this.vyhabapa(_local_3,_local_4);
            }
         }
      }
      
      [Obfuscation(rename="false")]
      public function tegapij(_arg_1:String, _arg_2:String) : void
      {
         var _local_3:Tawud = null;
         var _local_4:Tank = null;
         var _local_5:Mit = this.kebewevu[_arg_1];
         if(_local_5 != null)
         {
            _local_3 = this.hepot[_local_5.ownerId];
            if(_local_3 != null)
            {
               bymakurag(_local_5.position,this.pegonad,this.vibopokif,morilunec,hytapy);
               this.tutipus(_local_5.position,this.jidej);
               this.wede(_local_5);
               wikyhih(this.explosionSound,_local_5.position,0.5);
               _local_4 = this.sagal[_arg_2];
               if(_local_4 != null)
               {
                  _local_4.tyvedyz(_local_5.position,_local_5.vidasajuk,WeaponConst.hetohiky.getNumber() * this.impactForce);
               }
               this.vyhabapa(_local_5,_local_3);
            }
         }
      }
      
      private function tutipus(_arg_1:Vector3, _arg_2:LightAnimation) : void
      {
         var _local_3:StaticObject3DPositionProvider = StaticObject3DPositionProvider(battleService.getObjectPool().getObject(StaticObject3DPositionProvider));
         var _local_4:AnimatedLightEffect = AnimatedLightEffect(battleService.getObjectPool().getObject(AnimatedLightEffect));
         _local_3.init(_arg_1,50);
         _local_4.init(_local_3,_arg_2);
         battleService.addGraphicEffect(_local_4);
      }
      
      private function wede(_arg_1:Mit) : void
      {
         muzicaju.copy(_arg_1.position);
         muzicaju.addScaled(100,_arg_1.vidasajuk);
         battleService.getBattleScene3D().addDecal(_arg_1.position,muzicaju,sikam,this.ranorywag);
      }
      
      [Obfuscation(rename="false")]
      public function dump(_arg_1:Array) : String
      {
         var _local_2:Mit = null;
         var _local_3:* = "=== Mines ===\n";
         if(this.wisoq != null)
         {
            _local_3 += "Deferred:\n" + this.wisoq.join("\n") + "\n";
         }
         _local_3 += "On field:\n";
         for each(_local_2 in this.kebewevu)
         {
            _local_3 += _local_2 + "\n";
         }
         return _local_3;
      }
      
      [Obfuscation(rename="false")]
      public function get dumperName() : String
      {
         return "mines";
      }
      
      public function jyf(_arg_1:Mit) : void
      {
         battleEventDispatcher.dispatchEvent(Vegepos.figahe);
         server.jyf(_arg_1.id);
      }
      
      private function nyzyq(_arg_1:String, _arg_2:Number, _arg_3:Vector3, _arg_4:String, _arg_5:BattleTeam, _arg_6:Material, _arg_7:Boolean) : void
      {
         var _local_8:Tawud = null;
         var _local_9:Mit = null;
         var _local_10:RayHit = new RayHit();
         if(battleService.getBattleRunner().soc().raycastStatic(_arg_3,Vector3.DOWN,Myw.dyhan,10000000000,null,_local_10))
         {
            _local_8 = this.hepot[_arg_4];
            if(_local_8 == null)
            {
               _local_8 = new Tawud();
               this.hepot[_arg_4] = _local_8;
            }
            _local_9 = Mit.create(_arg_1,_arg_4,_arg_2,this.suta,_arg_6,_arg_5,this.gopa,this);
            _local_9.setPosition(_local_10.position,_local_10.normal);
            if(_arg_7)
            {
               _local_9.kivohag();
            }
            _local_8.nyzyq(_local_9);
            this.kebewevu[_arg_1] = _local_9;
            _local_9.rykysap();
         }
      }
      
      private function tiniril() : void
      {
         var _local_2:Mit = null;
         var _local_3:Tawud = null;
         var _local_1:* = undefined;
         for(_local_1 in this.kebewevu)
         {
            _local_2 = this.kebewevu[_local_1];
            _local_2.coraw();
            delete this.kebewevu[_local_1];
         }
         for(_local_1 in this.hepot)
         {
            _local_3 = this.hepot[_local_1];
            _local_3.hamato();
            delete this.hepot[_local_1];
         }
         this.wisoq = null;
      }
      
      private function tyh(_arg_1:Tanks3DSResource) : void
      {
         this.suta = Mesh(_arg_1.objects[0]);
         if(this.suta.sorting != Sorting.AVERAGE_Z)
         {
            this.suta.sorting = Sorting.AVERAGE_Z;
            this.suta.calculateFacesNormals(true);
         }
      }
      
      private function vyhabapa(_arg_1:Mit, _arg_2:Tawud) : void
      {
         delete this.kebewevu[_arg_1.id];
         _arg_1.coraw();
         _arg_2.vyhabapa(_arg_1);
      }
      
      private function nic(_arg_1:Tank) : Material
      {
         switch(_arg_1.teamType)
         {
            case BattleTeam.NONE:
               return _arg_1 == this.gaz ? this.hapib : this.jutyranak;
            case BattleTeam.BLUE:
               return this.qubukanac;
            case BattleTeam.RED:
               return this.dipopetyd;
            default:
               return this.jutyranak;
         }
      }
      
      private function qoc(_arg_1:Rujina) : void
      {
         this.sagal[_arg_1.tank.tankData.userName] = _arg_1.tank;
         if(_arg_1.isLocal)
         {
            this.gaz = _arg_1.tank;
         }
      }
      
      private function vavydisy(_arg_1:Tujat) : void
      {
         delete this.sagal[_arg_1.tank.tankData.userName];
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         if(_arg_1.tank == this.gaz)
         {
            this.cun();
         }
         else
         {
            this.niqusotyz(_arg_1.tank);
         }
      }
      
      private function cun() : void
      {
         var _local_1:int = 0;
         var _local_2:Codyw = null;
         var _local_3:Tank = null;
         var _local_4:Vector3 = null;
         if(this.wisoq != null)
         {
            _local_1 = 0;
            while(_local_1 < this.wisoq.length)
            {
               _local_2 = this.wisoq[_local_1];
               _local_3 = this.sagal[_local_2.ownerId];
               if(_local_3 != null)
               {
                  this.wisoq.splice(_local_1,1);
                  _local_1--;
                  _local_4 = BattleUtils.haq(_local_2.position);
                  this.nyzyq(_local_2.mineId,this.culafur,_local_4,_local_2.ownerId,_local_3.teamType,this.nic(_local_3),_local_2.activated);
               }
               _local_1++;
            }
         }
      }
      
      private function niqusotyz(_arg_1:Tank) : void
      {
         var _local_2:int = 0;
         var _local_3:Codyw = null;
         var _local_4:Vector3 = null;
         if(this.wisoq != null)
         {
            _local_2 = 0;
            while(_local_2 < this.wisoq.length)
            {
               _local_3 = this.wisoq[_local_2];
               if(_local_3.ownerId == _arg_1.tankData.userName)
               {
                  this.wisoq.splice(_local_2,1);
                  _local_2--;
                  _local_4 = BattleUtils.haq(_local_3.position);
                  this.nyzyq(_local_3.mineId,this.culafur,_local_4,_local_3.ownerId,_arg_1.teamType,this.nic(_arg_1),_local_3.activated);
               }
               _local_2++;
            }
         }
      }
      
      [Obfuscation(rename="false")]
      private function byzac(_arg_1:Vovakopy) : void
      {
         this.tiniril();
      }
   }
}

