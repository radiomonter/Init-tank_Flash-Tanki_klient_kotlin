package alternativa.tanks.battle.objects.tank
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Matrix3;
   import alternativa.math.Matrix4;
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.PhysicsScene;
   import alternativa.physics.PhysicsUtils;
   import alternativa.physics.collision.BodyCollisionFilter;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.Dust;
   import alternativa.tanks.battle.PhysicsController;
   import alternativa.tanks.battle.PhysicsInterpolator;
   import alternativa.tanks.battle.PostPhysicsController;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.objects.tank.tankskin.Lehumoryg;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.battle.objects.tank.tankskin.TracksAnimator;
   import alternativa.tanks.battle.scene3d.BattleScene3D;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.battle.scene3d.scene3dcontainer.Scene3DContainer;
   import alternativa.tanks.camera.Nig;
   import alternativa.tanks.display.usertitle.UserTitle;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.BasicGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponUtils;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.DataUnitValidator;
   import alternativa.tanks.utils.DataValidationErrorEvent;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.BitmapData;
   import flash.geom.Vector3D;
   import flash.utils.Dictionary;
   import obfuscation.bude.BattleTeam;
   import obfuscation.garud.Fyryq;
   import obfuscation.garud.Hoqeg;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Sudyhuma;
   import obfuscation.jebucahu.Dego;
   import obfuscation.jebucahu.Jybupow;
   import obfuscation.kofen.Vector3d;
   import obfuscation.kyre.Gemehyfe;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.Vuwuci;
   import obfuscation.rofa.Maga;
   import obfuscation.zuhelo.Halibukyd;
   import obfuscation.zuhelo.Havyra;
   import obfuscation.zuhelo.Karysud;
   
   public class Tank implements PhysicsController, PostPhysicsController, PhysicsInterpolator, Renderer, BodyCollisionFilter, Nig, WeaponPlatform
   {
      
      public static var pulat:TargetingModeService;
      
      private static const bik:int = 1;
      
      private static const BACK:int = 2;
      
      private static const LEFT:int = 4;
      
      private static const RIGHT:int = 8;
      
      private static const jydy:int = 16;
      
      private static const licesaqiz:int = 32;
      
      private static const CENTER_TURRET:int = 64;
      
      private static const zud:int = 128;
      
      private static const paj:Matrix4 = new Matrix4();
      
      private static const duqenef:Matrix4 = new Matrix4();
      
      private static const myc:Vector3 = new Vector3();
      
      private static const vylut:Vector3 = new Vector3();
      
      private static const qotyrury:Vector3 = new Vector3();
      
      private static const sur:Vector3 = new Vector3();
      
      private static const lycuwe:Vector3 = new Vector3();
      
      private static const kumolut:Vector3 = new Vector3();
      
      private static const verumonuv:RayHit = new RayHit();
      
      private static const pygab:Vector3 = new Vector3();
      
      private static const bojuzo:Vector3 = new Vector3();
      
      private static const PI:Number = Math.PI;
      
      private static const PI2:Number = 2 * Math.PI;
      
      private static var _m:Matrix3 = new Matrix3();
      
      private static var bimywan:Quaternion = new Quaternion();
      
      private static var hosije:Vector3 = new Vector3();
      
      private static var japyne:Vector3 = new Vector3();
      
      private static var fiwum:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private static var tesyh:Vector.<Number> = Vector.<Number>([0,0,0]);
      
      private const nicukuro:Number = 5;
      
      private const habaja:Number = 0;
      
      public var tankData:Num;
      
      private var cev:Cokunuf;
      
      private var battleEventDispatcher:BattleEventDispatcher;
      
      public var wines:Boolean;
      
      public var dafiqof:CollisionBox;
      
      public var zewecicod:Vector.<Vector3>;
      
      private var skin:TankSkin;
      
      public var title:UserTitle;
      
      public var nyleqez:Halibukyd;
      
      public var wezyqiji:Halibukyd;
      
      public var prevState:ClientTankState;
      
      private var baneh:BattleTeam;
      
      public var giqudu:Number = 0;
      
      public var zidyfa:Number = 0;
      
      private var wyqynugip:Boolean;
      
      private var wivegoc:Boolean;
      
      private var container:Scene3DContainer;
      
      private var battleService:BattlefieldModel;
      
      public var local:Boolean;
      
      private var hoqabe:Boolean;
      
      private var qavol:Number;
      
      private var noqumugu:int;
      
      private var fym:BodyPhysicsStateValidator;
      
      private var refib:Number;
      
      public var state:ClientTankState;
      
      private var fykylyn:Qory;
      
      private var kilygafa:Qory;
      
      private var nak:Budukaby;
      
      public var roca:Vector3;
      
      public var lygulo:Quaternion;
      
      private var rycufy:Number = 0;
      
      private var rero:Maga;
      
      private var dusiw:Boolean;
      
      public var witily:int = 0;
      
      public var syfa:int = 0;
      
      private var fatofuh:TankDataValidator;
      
      public var guritow:Havyra;
      
      private var lilykyq:TracksAnimator;
      
      private var dofepun:Vuwuci;
      
      private var keqadu:Karysud;
      
      private var ledahicy:BodyState;
      
      public var wuq:Vector.<CollisionBox>;
      
      private var videdohy:Cokunuf;
      
      private var jezosut:Cokunuf;
      
      public var zaki:int;
      
      private var deheni:Number;
      
      private var weapon:Weapon;
      
      private var myhop:Rib;
      
      private var qarywi:Hoqeg;
      
      private var nynu:Number = 0;
      
      private var inBattle:Boolean;
      
      private var maxHealth:int;
      
      private var zasaj:Vector3 = new Vector3();
      
      private var nacaw:Dictionary = new Dictionary();
      
      public var bilofydur:Vector3 = new Vector3();
      
      public var sokitaqe:Vector3 = new Vector3();
      
      public function Tank(_arg_1:TankSkin, _arg_2:Rib, _arg_3:Maga, _arg_4:Hoqeg, _arg_5:Weapon, _arg_6:UserTitle, _arg_7:Number, _arg_8:Boolean, _arg_9:BattleEventDispatcher, _arg_10:int, _arg_11:Number = 50, _arg_12:Number = 25, _arg_13:Number = 1250)
      {
         super();
         this.myhop = _arg_2;
         this.qarywi = _arg_4;
         this.videdohy = new Myba(100,1000,0,0);
         this.jezosut = new Myba(0.3,10,0,0);
         this.skin = _arg_1;
         this.battleEventDispatcher = _arg_9;
         this.rero = _arg_3;
         this.local = _arg_8;
         this.maxHealth = _arg_10;
         this.wuq = new Vector.<CollisionBox>();
         this.roca = new Vector3();
         this.lygulo = new Quaternion();
         this.ledahicy = new BodyState();
         this.keqadu = new Karysud();
         this.keqadu.dampingCoeff = _arg_13;
         _arg_3.nevenugu(this);
         this.title = _arg_6;
         var _local_14:Vector3 = this.toha(_arg_1.cyhajycip().mesh);
         var _local_15:Vector3 = new Vector3(_local_14.x / 2,_local_14.y / 2,_local_14.z / 2);
         this.deheni = _local_15.y;
         this.puboh(_local_14);
         this.dywygycez(_arg_7,_local_15);
         this.gopo(_local_15);
         this.muh(_local_15);
         this.fobydyniv(_arg_1);
         this.guritow = new Havyra(this.dofepun.body,this.keqadu,this.videdohy,_local_14);
         this.lilykyq = new TracksAnimator(this.guritow,_arg_1,this.videdohy);
         this.fym = new BodyPhysicsStateValidator(this.dofepun.body,_arg_9);
         this.weapon = _arg_5;
         _arg_5.init(this);
         pulat = TargetingModeService(OSGi.getInstance().getService(TargetingModeService));
         this.dofepun.bolifi();
      }
      
      private static function senanyboq(_arg_1:BodyState, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:Vector3d, _arg_5:Vector3d) : void
      {
         BattleUtils.colufugi(_arg_1.position,_arg_2);
         var _local_6:Quaternion = _arg_1.orientation;
         _local_6.getEulerAngles(japyne);
         _arg_3.x = japyne.x;
         _arg_3.y = japyne.y;
         _arg_3.z = japyne.z;
         BattleUtils.colufugi(_arg_1.velocity,_arg_4);
         BattleUtils.colufugi(_arg_1.angularVelocity,_arg_5);
      }
      
      public function konusah(_arg_1:Vector3) : Boolean
      {
         var _local_3:int = 0;
         var _local_2:int = int(this.zewecicod.length);
         while(_local_3 < _local_2)
         {
            kumolut.copy(this.zewecicod[_local_3]);
            if(this.sufy(kumolut,_arg_1))
            {
               return false;
            }
            _local_3++;
         }
         return true;
      }
      
      private function sufy(_arg_1:Vector3, _arg_2:Vector3) : Boolean
      {
         var _local_3:Body = this.dofepun.body;
         _arg_1.transform3(_local_3.baseMatrix);
         var _local_4:BodyState = _local_3.state;
         _arg_1.add(_local_4.position);
         pygab.copy(_arg_2);
         bojuzo.diff(_arg_1,pygab);
         var _local_5:PhysicsScene = _local_3.scene;
         if(_local_5 == null)
         {
            return false;
         }
         var _local_6:CollisionDetector = _local_5.collisionDetector;
         return !_local_6.raycastStatic(pygab,bojuzo,Myw.dyhan,1,null,verumonuv);
      }
      
      public function kanybeq() : Vector3
      {
         return this.bilofydur;
      }
      
      public function tosakena() : Boolean
      {
         return this.dofepun.coruziva;
      }
      
      public function bozydene() : Boolean
      {
         return this.dofepun.qiw();
      }
      
      public function bic() : Vector.<Body>
      {
         return this.dofepun.vopuruce;
      }
      
      public function zoju() : Number
      {
         return this.myhop.jesenebo();
      }
      
      public function bivuz(_arg_1:Vector3D) : void
      {
         this.title.readPosition(_arg_1);
      }
      
      public function ruh() : Number
      {
         return this.deheni;
      }
      
      public function cimyg() : int
      {
         return this.maxHealth;
      }
      
      public function fiveqejav(_arg_1:BattleTeam) : Boolean
      {
         return this.teamType == _arg_1 && _arg_1 != BattleTeam.NONE;
      }
      
      public function bebosaca() : ClientObject
      {
         return this.tankData.user;
      }
      
      public function fesucoqaj(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         var _local_3:int = -11;
         var _local_4:int = this.modipiwah();
         var _local_5:Object3D = this.skin.qenokeru();
         if(_local_4 == Fyryq.TURRET)
         {
            duqenef.setMatrix(_local_5.x,_local_5.y,_local_5.z,_local_5.rotationX,_local_5.rotationY,_local_5.rotationZ);
         }
         else if(_local_4 == Fyryq.lobirafo)
         {
            duqenef.setMatrix(_local_5.x,_local_5.y,_local_5.z,_local_5.rotationX,_local_5.rotationY,this.myhop.fewisip());
         }
         else
         {
            duqenef.setMatrix(_local_5.x,_local_5.y,_local_5.z,0,0,0);
         }
         var _local_6:Mesh = this.skin.repijumu();
         paj.setRotationMatrix(_local_6.rotationX,_local_6.rotationY,_local_6.rotationZ);
         var _local_7:Vector3 = BattleUtils.vemoleg;
         paj.getUp(_local_7);
         duqenef.getPosition(_arg_1);
         _arg_1.addScaled(_local_3,_local_7);
         _arg_2.reset(duqenef.m01,duqenef.m11,duqenef.m21);
         this.prevState = this.state;
      }
      
      private function modipiwah() : int
      {
         switch(pulat.visefi())
         {
            case Sudyhuma.pobyhevam:
               return Fyryq.TURRET;
            case Sudyhuma.cuwycagin:
               return this.myhop.fujico() && this.prevState != ClientTankState.DEAD ? int(Fyryq.lobirafo) : int(Fyryq.TURRET);
            default:
               return Fyryq.TURRET;
         }
      }
      
      public function heboqiq() : Number
      {
         return this.qavol;
      }
      
      public function disable() : void
      {
         this.title.hideIndicators();
      }
      
      public function tyvedyz(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number) : void
      {
         if(this.tankData.health > 0)
         {
            this.dofepun.body.addWorldForceScaled(_arg_1,_arg_2,_arg_3);
            this.dofepun.gib.addScaled(_arg_3,_arg_2);
            this.fif(_arg_1);
         }
      }
      
      public function fif(_arg_1:Vector3) : void
      {
         this.sokitaqe.copy(_arg_1);
         BattleUtils.globalToLocal(this.qiniwu(),this.sokitaqe);
         this.wines = true;
      }
      
      public function fufyvi(_arg_1:int = 7) : void
      {
         var _local_3:int = 0;
         var _local_2:Dust = this.battleService.getBattleScene3D().tyq();
         while(_local_3 < _arg_1)
         {
            _local_2.cinizyz(this,0,0.9);
            _local_3++;
         }
      }
      
      public function wumuwis(_arg_1:int, _arg_2:int, _arg_3:Boolean) : void
      {
         this.guritow.kivawuk = _arg_1;
         this.guritow.zymunufyr = _arg_2;
         this.guritow.gazop = _arg_3;
         if(!this.guritow.pojiv)
         {
            if(_arg_1 != 0)
            {
               this.rero.qucez();
            }
            else if(_arg_2 != 0)
            {
               this.rero.vafavokan();
            }
            else
            {
               this.rero.rezotun();
            }
         }
      }
      
      public function sipobujif() : CollisionBox
      {
         return this.dofepun.paqu;
      }
      
      private function fobydyniv(_arg_1:TankSkin) : void
      {
         var _local_2:Jybupow = null;
         var _local_3:CollisionBox = null;
         var _local_4:Vector.<Jybupow> = _arg_1.wecycymo();
         for each(_local_2 in _local_4)
         {
            _local_3 = this.saqyjym(_local_2.gewi());
            this.wuq.push(_local_3);
            this.dofepun.body.addCollisionShape(_local_3,new Matrix4());
         }
         this.syhys(0);
      }
      
      private function saqyjym(_arg_1:Vector3) : CollisionBox
      {
         return new CollisionBox(_arg_1,0,PhysicsMaterial.DEFAULT_MATERIAL);
      }
      
      private function muh(_arg_1:Vector3) : void
      {
         var _local_2:Number = _arg_1.x;
         var _local_3:Number = _arg_1.y;
         this.zewecicod = Vector.<Vector3>([new Vector3(-_local_2,_local_3,0),new Vector3(_local_2,_local_3,0),new Vector3(-_local_2,0,0),new Vector3(_local_2,0,0),new Vector3(-_local_2,-_local_3,0),new Vector3(_local_2,-_local_3,0)]);
      }
      
      private function gopo(_arg_1:Vector3) : void
      {
         var _local_2:Number = 2 * _arg_1.z - (this.keqadu.hopatyf - Nun.nicukuro);
         Cuqubyci.byhory(_arg_1,_local_2,this.dofepun);
         Cuqubyci.tonecudu(_arg_1,_local_2,this.dofepun);
         this.tef(_arg_1,_local_2);
      }
      
      public function gytamy(_arg_1:AllGlobalGunParams, _arg_2:int = 0) : void
      {
         WeaponUtils.balagur(this.skin.worydadep(),this.skin.tytew().jaruzar[_arg_2],_arg_1);
      }
      
      public function bume(_arg_1:BasicGlobalGunParams, _arg_2:int = 0) : void
      {
         WeaponUtils.qecygi(this.skin.worydadep(),this.skin.tytew().jaruzar[_arg_2],_arg_1);
      }
      
      public function zacecec(_arg_1:Rib) : void
      {
         this.myhop = _arg_1;
      }
      
      public function sowiq() : Rib
      {
         return this.myhop;
      }
      
      private function dywygycez(_arg_1:Number, _arg_2:Vector3) : void
      {
         var _local_3:Body = new Body(_arg_1,Matrix3.IDENTITY,0);
         PhysicsUtils.setBoxInvInertia(_arg_1,_arg_2,_local_3.invInertia);
         _local_3.tank = this;
         this.dofepun = new Vuwuci(_local_3);
      }
      
      private function puboh(_arg_1:Vector3) : void
      {
         var _local_2:Mesh = this.skin.repijumu();
         _local_2.calculateBounds();
         this.bilofydur.x = -0.5 * (_local_2.boundMinX + _local_2.boundMaxX);
         this.bilofydur.y = -0.5 * (_local_2.boundMinY + _local_2.boundMaxY);
         this.bilofydur.z = -0.5 * _arg_1.z - this.keqadu.hopatyf + 10;
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = _arg_2 * 0.001;
         this.fykylyn.update(_local_3);
         this.skin.pypof(this.rycufy);
         this.skin.tuzidy(this.nynu);
         this.lilykyq.wos(_local_3);
         var _local_4:Object3D = this.skin.qenokeru();
         japyne.x = _local_4.x;
         japyne.y = _local_4.y;
         japyne.z = _local_4.z;
         this.title.setWeaponStatus(100 * this.weapon.getStatus());
         this.title.update(japyne);
         var _local_5:Lehumoryg = this.skin.cyhajycip();
         if(_local_5.hasIncorrectData())
         {
            this.battleEventDispatcher.nigohif(new DataValidationErrorEvent(_local_5.getType()));
         }
         var _local_6:Dego = this.skin.tytew();
         if(_local_6.hasIncorrectData())
         {
            this.battleEventDispatcher.nigohif(new DataValidationErrorEvent(_local_6.getType()));
         }
         if(this.qarywi != null && this.state != ClientTankState.DEAD)
         {
            this.qavol = this.raqalamef();
         }
      }
      
      public function sodupocac() : DataUnitValidator
      {
         if(this.fatofuh == null)
         {
            this.fatofuh = new TankDataValidator(this.dofepun.body.collisionShapes);
         }
         return this.fatofuh;
      }
      
      public function wilurip() : Number
      {
         return this.refib;
      }
      
      public function hucagy() : void
      {
         var _local_1:BattleRunner = null;
         var _local_2:BattleScene3D = null;
         if(this.battleService != null)
         {
            this.inBattle = false;
            this.weapon.deactivate();
            this.battleService.getBattleScene3D().tyq().hebymos(this);
            _local_1 = this.battleService.getBattleRunner();
            _local_2 = this.battleService.getBattleScene3D();
            _local_1.zuz(this.dofepun);
            _local_1.kigunig(this);
            _local_1.wapiti(this);
            _local_1.kufoq(this);
            Gemehyfe.saqoqigo(this.dofepun.id);
            this.skin.removeFromScene();
            this.title.removeFromContainer();
            _local_2.hebymos(this);
            _local_1.lokezi().zolycoz(this.rero);
            this.battleService = null;
         }
      }
      
      private function raqalamef() : Number
      {
         this.lygulo.toMatrix3(_m);
         _m.transformVector(Vector3.Z_AXIS,qotyrury);
         qotyrury.normalize();
         japyne.copy(this.bilofydur);
         japyne.transform3(_m);
         japyne.add(this.roca);
         paj.setFromMatrix3(_m,japyne);
         myc.reset(paj.m03,paj.m13,paj.m23);
         vylut.reset(paj.m01,paj.m11,paj.m21);
         vylut.normalize();
         lycuwe.copy(Vector3.X_AXIS);
         sur.copy(Vector3.Y_AXIS);
         lycuwe.projectOnPlane(qotyrury);
         sur.projectOnPlane(qotyrury);
         lycuwe.normalize();
         sur.normalize();
         var _local_1:Number = MathUtils.clamp(sur.dot(vylut),-1,1);
         var _local_2:Number = lycuwe.dot(vylut);
         return Math.acos(_local_1) * (_local_2 > 0 ? -1 : 1);
      }
      
      public function getynos(_arg_1:int = 0) : Vector3
      {
         return this.skin.tytew().jaruzar[_arg_1];
      }
      
      public function falevetos() : Vector3
      {
         return this.skin.tytew().sod;
      }
      
      public function holuzorow(_arg_1:int = 0) : Number
      {
         return Vector3(this.skin.tytew().jaruzar[_arg_1]).y;
      }
      
      public function qenokeru() : Object3D
      {
         return this.skin.qenokeru();
      }
      
      public function repijumu() : Mesh
      {
         return this.skin.repijumu();
      }
      
      public function bij() : TankSkin
      {
         return this.skin;
      }
      
      public function weka() : void
      {
         this.title.show();
      }
      
      public function wep() : void
      {
         this.title.hide();
      }
      
      public function stopMovement() : void
      {
         this.rero.rezotun();
      }
      
      public function finypa(_arg_1:Boolean) : void
      {
         this.guritow.pojiv = _arg_1;
      }
      
      public function qigaqesa(_arg_1:Boolean) : void
      {
         this.rero.bowohig = _arg_1;
      }
      
      public function spawn(_arg_1:BattleTeam, _arg_2:int) : void
      {
         this.baneh = _arg_1;
         this.noqumugu = _arg_2;
         this.nynu = 0;
         this.videdohy.reset(this.videdohy.vur());
         this.jezosut.reset(this.jezosut.vur());
         this.dofepun.body.clearAccumulators();
         this.skin.womevuni();
         this.skin.nyb();
         this.weapon.reset();
         this.rero.rezotun();
         this.rero.bowohig = true;
         this.guritow.reset();
         this.myhop.reset();
         this.myhop.viwyd();
         if(this.qarywi != null)
         {
            this.qarywi.reset();
         }
         this.title.setTeamType(_arg_1);
      }
      
      public function kill() : void
      {
         this.state = ClientTankState.DEAD;
         this.rero.enabled = false;
         this.battleService.getBattleRunner().lokezi().zolycoz(this.rero);
         this.title.hideIndicators();
         this.title.hide();
         if(this.qarywi != null)
         {
            this.qarywi.reset();
         }
      }
      
      public function hak() : Hoqeg
      {
         return this.qarywi;
      }
      
      public function nimafake(_arg_1:Hoqeg) : void
      {
         this.qarywi = _arg_1;
      }
      
      public function destroy() : void
      {
         this.state = ClientTankState.DEAD;
         this.skin.dispose();
         this.skin = null;
         this.weapon.destroy();
         this.dofepun.destroy();
         if(this.fatofuh != null)
         {
            this.fatofuh.destroy();
         }
      }
      
      private function tef(_arg_1:Vector3, _arg_2:Number) : void
      {
         var _local_3:Vector3 = new Vector3(_arg_1.x,_arg_1.y,_arg_2 / 2);
         var _local_4:Matrix4 = this.dofepun.paqu.transform;
         this.refib = _local_3.length() + Math.abs(_local_4.m23);
      }
      
      public function ripud() : Vuwuci
      {
         return this.dofepun;
      }
      
      private function toha(_arg_1:Mesh) : Vector3
      {
         return new Vector3(_arg_1.boundMaxX - _arg_1.boundMinX,_arg_1.boundMaxY - _arg_1.boundMinY,_arg_1.boundMaxZ - _arg_1.boundMinZ);
      }
      
      public function setMaxTurnSpeed(_arg_1:Number, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.jezosut.reset(_arg_1);
         }
         else
         {
            this.jezosut.ravik(_arg_1);
         }
      }
      
      public function setTemperature(_arg_1:Number) : void
      {
         this.nynu = _arg_1;
      }
      
      public function batubazy() : Number
      {
         return this.nynu;
      }
      
      public function sabinijy(_arg_1:Number, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.videdohy.reset(_arg_1);
         }
         else
         {
            this.videdohy.ravik(_arg_1);
         }
      }
      
      public function wupylapen() : int
      {
         return CollisionShape(this.dofepun.paqu).collisionGroup;
      }
      
      public function padabanu(_arg_1:int) : void
      {
         var _local_2:CollisionBox = null;
         this.dofepun.paqu.collisionGroup = _arg_1;
         for each(_local_2 in this.wuq)
         {
            _local_2.collisionGroup = _arg_1 & Myw.WEAPON;
         }
      }
      
      public function zyhyg() : BitmapData
      {
         return this.title.getTexture();
      }
      
      public function rotateTurret(_arg_1:Number) : void
      {
         this.myhop.rotate(_arg_1);
         this.syhys(this.myhop.jesenebo());
         this.rero.kuvavo(this.myhop.isRotating());
      }
      
      private function syhys(_arg_1:Number) : void
      {
         var _local_2:CollisionBox = null;
         var _local_3:Matrix4 = null;
         var _local_4:Jybupow = null;
         var _local_9:int = 0;
         var _local_5:Lehumoryg = this.skin.cyhajycip();
         var _local_6:CollisionBox = this.dofepun.paqu;
         var _local_7:Matrix4 = _local_6.localTransform;
         var _local_8:Vector.<Jybupow> = this.skin.wecycymo();
         while(_local_9 < this.wuq.length)
         {
            _local_2 = this.wuq[_local_9];
            _local_3 = _local_2.localTransform;
            _local_3.setMatrix(_local_5.how() - _local_7.m03 + this.bilofydur.x,_local_5.fydypopic() - _local_7.m13 + this.bilofydur.y,_local_5.latah() - _local_7.m23 + this.bilofydur.z,0,0,_arg_1);
            _local_4 = _local_8[_local_9];
            _local_3.prepend(_local_4.cubysys());
            _local_9++;
         }
      }
      
      public function kociryji() : void
      {
         this.interpolatePhysicsState(1);
         this.fykylyn.update(0);
         this.skin.pypof(this.rycufy);
      }
      
      public function interpolatePhysicsState(_arg_1:Number) : void
      {
         this.dofepun.body.interpolate(_arg_1,this.roca,this.lygulo);
         this.lygulo.normalize();
         this.rycufy = this.myhop.lijag(_arg_1);
      }
      
      public function camite(_arg_1:Vector3, _arg_2:int = 0) : void
      {
         _arg_1.copy(this.skin.tytew().jaruzar[_arg_2]);
         _arg_1.y = 0;
      }
      
      public function sypibi() : int
      {
         return this.skin.tytew().jaruzar.length;
      }
      
      public function pefo() : void
      {
         this.hoqabe = true;
      }
      
      public function hot() : Halibukyd
      {
         return this.guritow.nyleqez;
      }
      
      public function tanazisom() : Halibukyd
      {
         return this.guritow.wezyqiji;
      }
      
      public function zafet() : Boolean
      {
         return this.hot().coruziva() || this.tanazisom().coruziva();
      }
      
      public function dinu() : Number
      {
         return this.qiniwu().state.velocity.length();
      }
      
      public function lymyfedyh(_arg_1:Vector3d, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         var _local_5:Body = this.dofepun.body;
         var _local_6:BodyState = _local_5.state;
         BattleUtils.pavuze(_arg_1,_local_6.position);
         _local_6.orientation.setFromEulerAnglesXYZ(_arg_2.x,_arg_2.y,_arg_2.z);
         BattleUtils.pavuze(_arg_3,_local_6.velocity);
         BattleUtils.pavuze(_arg_4,_local_6.angularVelocity);
         _local_5.saveState();
         _local_5.calcDerivedData();
         this.fym.refresh();
      }
      
      public function seduq(_arg_1:Number) : void
      {
         this.guritow.seduq(_arg_1);
      }
      
      public function nerawub(_arg_1:Number) : void
      {
         this.guritow.nerawub(_arg_1);
      }
      
      public function tuqetok(_arg_1:Number) : void
      {
         this.guritow.tuqetok(_arg_1);
      }
      
      public function setTurnAcceleration(_arg_1:Number) : void
      {
         this.guritow.setTurnAcceleration(_arg_1);
      }
      
      public function gimefapew(_arg_1:Number) : void
      {
         this.guritow.gimefapew(_arg_1);
      }
      
      public function jug(_arg_1:Vector3d, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         senanyboq(this.dofepun.body.state,_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function cuwyd(_arg_1:Vector3d, _arg_2:Vector3d, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         senanyboq(this.dofepun.body.prevState,_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function jafipefy() : void
      {
         this.state = ClientTankState.deqalo;
         this.tankData.spawnState = ClientTankState.deqalo;
         this.padabanu(Myw.TANK);
         this.rugikev(Myw.bewo);
         this.skin.setAlpha(0.5);
         this.dofepun.body.postCollisionFilter = this;
      }
      
      public function bagubado() : void
      {
         this.state = ClientTankState.neqahi;
         this.tankData.spawnState = ClientTankState.neqahi;
         this.padabanu(Myw.TANK | Myw.pezeze | Myw.WEAPON);
         this.rugikev(Myw.pezeze);
         this.skin.setAlpha(1);
         this.dofepun.body.postCollisionFilter = null;
      }
      
      public function considerBodies(_arg_1:Body, _arg_2:Body) : Boolean
      {
         if(_arg_1.postCollisionFilter != null && _arg_2.postCollisionFilter == null)
         {
            ++_arg_1.tank.zaki;
         }
         else if(_arg_1.postCollisionFilter == null && _arg_2.postCollisionFilter != null)
         {
            ++_arg_2.tank.zaki;
         }
         return false;
      }
      
      public function bydehim(_arg_1:BattlefieldModel) : void
      {
         var _local_2:BattleRunner = _arg_1.getBattleRunner();
         var _local_3:BattleScene3D = _arg_1.getBattleScene3D();
         if(this.battleService == null)
         {
            this.inBattle = true;
            this.battleService = _arg_1;
            this.dofepun.id = Gemehyfe.zoty();
            _local_2 = _arg_1.getBattleRunner();
            _local_2.bati(this.dofepun);
            _local_2.wefoderu(this);
            _local_2.wyqem(this);
            _local_2.fugimok(this);
            this.skin.addToScene();
            this.title.addToContainer();
            _local_3 = _arg_1.getBattleScene3D();
            _local_3.gema(this);
            _local_2.lokezi().vakydiqip(this.rero);
            this.fykylyn.reset();
            _local_3.tyq().gema(this);
         }
      }
      
      public function jatil(_arg_1:Number) : void
      {
         this.nimyhury();
         this.fym.refresh();
         this.myhop.rafyqako(this.qiniwu());
      }
      
      private function nimyhury() : void
      {
         var _local_1:Body = this.dofepun.body;
         var _local_2:BodyState = _local_1.state;
         if(!_local_2.isValid())
         {
            _local_2.copy(this.ledahicy);
            _local_1.saveState();
         }
      }
      
      public function rugikev(_arg_1:int) : void
      {
         this.guritow.rugikev(_arg_1);
      }
      
      public function runBeforePhysicsUpdate(_arg_1:Number) : void
      {
         this.zaki = 0;
         var _local_2:Number = this.videdohy.update(_arg_1);
         var _local_3:Number = this.jezosut.update(_arg_1);
         this.dofepun.body.setMaxSpeedXY(_local_2);
         this.guritow.applyForces(_local_2,_local_3,_arg_1);
         this.dofepun.body.slipperyMode = !this.zafet() && this.dofepun.gikemad();
         this.rotateTurret(_arg_1);
         this.lytyfo();
      }
      
      private function lytyfo() : void
      {
         this.ledahicy.copy(this.dofepun.body.state);
         this.fym.validate();
      }
      
      public function hehunawud(_arg_1:Qory) : void
      {
         this.fykylyn = _arg_1;
      }
      
      public function get teamType() : BattleTeam
      {
         return this.baneh;
      }
      
      public function get incarnation() : int
      {
         return this.noqumugu;
      }
      
      public function qiniwu() : Body
      {
         return this.dofepun.body;
      }
      
      public function isInBattle() : Boolean
      {
         return this.inBattle;
      }
      
      public function qycehy() : Boolean
      {
         return this.dofepun.qycehy();
      }
      
      public function lidelej() : Boolean
      {
         return this.dofepun.lidelej();
      }
      
      public function ruf() : Boolean
      {
         return this.dofepun.ruf();
      }
   }
}

