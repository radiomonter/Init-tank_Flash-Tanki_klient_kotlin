package alternativa.tanks.camera
{
   import alternativa.engine3d.core.EllipsoidCollider;
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Kitut;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.settings.SettingEnum;
   import alternativa.tanks.service.settings.SettingsServiceEvent;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Qizytyv;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.display.Stage;
   import flash.geom.Point;
   import flash.geom.Vector3D;
   import obfuscation.garud.Sudyhuma;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class FollowCameraController extends Dyqiw implements Qizytyv, BattleEventListener
   {
      
      [Inject]
      public static var settings:ISettingsService;
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      private static const bukuhe:ConsoleVarFloat = new ConsoleVarFloat("cam_vspeed",0.7,0,10);
      
      private static const tocim:Number = 0.001;
      
      private static const vyjyrugy:Number = 5 * Math.PI / 180;
      
      private static const ryvukuguf:Number = 50;
      
      private static const jeryv:Number = 5;
      
      private static const jiqotebe:Number = 3;
      
      private static const sudyn:Number = 9;
      
      private static const collisionPoint:Vector3 = new Vector3();
      
      private static const japyne:Vector3 = new Vector3();
      
      private static const zasel:Vector3D = new Vector3D();
      
      private static const husiqaze:Vector3D = new Vector3D();
      
      private static const behimum:Vector3D = new Vector3D();
      
      private static const miqub:Vector3D = new Vector3D();
      
      private static const myzusedit:Matrix3 = new Matrix3();
      
      private static const axis:Vector3 = new Vector3();
      
      private static const vukyke:Vector3 = new Vector3();
      
      private static var kebipat:ConsoleVarFloat = new ConsoleVarFloat("cam_maxmove",jeryv,0,jeryv);
      
      public static var hyzo:Number = 10;
      
      public static var cala:Number = Math.PI / 180;
      
      public static var hakut:Number = 10;
      
      private static const pakaq:Number = 10 * Math.PI / 180;
      
      private static const pigiqufez:Number = 1;
      
      private static const sodasyjek:Number = 300;
      
      private static const hacoleh:Vector3 = new Vector3();
      
      private static const namib:Vector3 = new Vector3();
      
      private static const susenisac:Vector3 = new Vector3();
      
      private static const ziwad:Vector3 = new Vector3();
      
      private static const biholeci:Vector3 = new Vector3();
      
      private var pary:Boolean;
      
      public var bel:Boolean;
      
      private var stage:Stage;
      
      private var malo:Number = 0;
      
      private var locked:Boolean;
      
      private var gipuru:Boolean;
      
      private var vejyvoc:Boolean;
      
      private var active:Boolean;
      
      private var target:Nig;
      
      private var position:Vector3 = new Vector3();
      
      private var rotation:Vector3 = new Vector3();
      
      private var targetPosition:Vector3 = new Vector3();
      
      private var boje:Vector3 = new Vector3();
      
      private var rupaluv:Number = 0;
      
      private var vevyrod:Number = 0;
      
      private var pihiqy:Number = 0;
      
      private var kaq:int;
      
      private var qeqofu:Juh = new Juh();
      
      private var gakyvu:Number;
      
      private var cojywunyd:Number = 0;
      
      private var sinesi:Point = new Point();
      
      private var hekoceqec:Point;
      
      private var butef:Point;
      
      private var pezom:Point;
      
      private var lozik:Point;
      
      private var bosoga:EllipsoidCollider;
      
      private var kelofuqe:Object3D;
      
      private var nyjar:int;
      
      private var caf:Number = 0;
      
      private var lamyb:Number = 0;
      
      private var targetingMode:int;
      
      public function FollowCameraController()
      {
         super();
         this.stage = display.stage;
         this.hekoceqec = new Point(145,545);
         this.butef = new Point(930,1395);
         this.pezom = new Point(2245,1565);
         this.lozik = new Point(3105,760);
         this.bosoga = new EllipsoidCollider(ryvukuguf,ryvukuguf,ryvukuguf);
         settings.addEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.bogusefep);
         this.bogusefep();
         var _local_1:Number = Number(storageService.getStorage().data["cameraT"]);
         if(isNaN(_local_1))
         {
            _local_1 = 0.2;
         }
         this.fyhyles(_local_1);
      }
      
      private static function wiqet(_arg_1:Vector3, _arg_2:Vector3D) : void
      {
         _arg_2.x = _arg_1.x;
         _arg_2.y = _arg_1.y;
         _arg_2.z = _arg_1.z;
      }
      
      private static function nidep(_arg_1:Number) : Number
      {
         return kebipat.value * _arg_1;
      }
      
      private static function jyle(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : Number
      {
         var _local_6:Number = 3 * (_arg_3 - _arg_2);
         var _local_7:Number = 3 * _arg_2 - 6 * _arg_3 + 3 * _arg_4;
         var _local_8:Number = -_arg_2 + 3 * _arg_3 - 3 * _arg_4 + _arg_5;
         return _arg_2 + _arg_1 * _local_6 + _arg_1 * _arg_1 * _local_7 + _arg_1 * _arg_1 * _arg_1 * _local_8;
      }
      
      private function bogusefep(_arg_1:SettingsServiceEvent = null) : void
      {
         if(_arg_1 == null || _arg_1.pegutu() != SettingEnum.cyj)
         {
            return;
         }
         if(settings.alternateCamera)
         {
            this.cygosehe();
         }
         else
         {
            this.dota();
         }
      }
      
      public function pimana(_arg_1:Object3D) : void
      {
         this.kelofuqe = _arg_1;
      }
      
      public function dota() : void
      {
         this.pary = true;
      }
      
      public function cygosehe() : void
      {
         this.pary = false;
      }
      
      public function juvilyvyb(_arg_1:Nig) : void
      {
         this.target = _arg_1;
      }
      
      public function rozyqagyr(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.targetPosition.copy(_arg_1);
         this.boje.copy(_arg_2);
         this.kaq = 0;
         this.nyfozy(_arg_1,_arg_2,this.qeqofu);
         this.position.copy(this.qeqofu.position);
         this.rotation.x = this.pofis(this.qeqofu) - 0.5 * Math.PI;
         this.rotation.y = 0;
         this.rotation.z = Math.atan2(-_arg_2.x,_arg_2.y);
         setPosition(this.position);
         setOrientation(this.rotation);
      }
      
      public function lurel() : void
      {
         this.position.copy(turono());
         this.rotation.reset(pemyw(),topihog(),fofiza());
      }
      
      override public function activate() : void
      {
         super.activate();
         this.lurel();
         if(!this.active)
         {
            this.active = true;
            vekol.addListener(this);
            battleEventDispatcher.pugu(Kitut,this);
         }
      }
      
      override public function deactivate() : void
      {
         if(this.active)
         {
            this.active = false;
            vekol.removeListener(this);
            battleEventDispatcher.kujo(Kitut,this);
            this.gipuru = false;
            this.vejyvoc = false;
         }
      }
      
      override public function update(_arg_1:int, _arg_2:int) : void
      {
         if(this.target == null)
         {
            return;
         }
         var _local_3:Number = _arg_2 * 0.001;
         if(_local_3 > 0.1)
         {
            _local_3 = 0.1;
         }
         this.mijewef(_local_3);
         if(!this.locked)
         {
            this.nozejoke();
         }
         this.nyfozy(this.targetPosition,this.boje,this.qeqofu);
         biholeci.diff(this.qeqofu.position,this.position);
         var _local_4:Number = biholeci.length();
         if(_local_4 > hyzo)
         {
            this.rupaluv = nidep(_local_4 - hyzo);
         }
         var _local_5:Number = this.rupaluv * _local_3;
         if(_local_5 > _local_4)
         {
            _local_5 = _local_4;
         }
         biholeci.normalize().scale(_local_5);
         var _local_6:Number = this.pofis(this.qeqofu);
         var _local_7:Number = Math.atan2(-this.boje.x,this.boje.y);
         var _local_8:Number = MathUtils.clampAngle(this.rotation.x + 0.5 * Math.PI);
         var _local_9:Number = MathUtils.clampAngle(this.rotation.z);
         var _local_10:Number = MathUtils.clampAngleFast(_local_6 - _local_8);
         this.vevyrod = this.qemytysyg(_local_10,this.vevyrod);
         var _local_11:Number = this.vevyrod * _local_3;
         if(_local_10 > 0 && _local_11 > _local_10 || _local_10 < 0 && _local_11 < _local_10)
         {
            _local_11 = _local_10;
         }
         var _local_12:Number = MathUtils.clampAngleFast(_local_7 - _local_9);
         this.pihiqy = this.qemytysyg(_local_12,this.pihiqy);
         var _local_13:Number = this.pihiqy * _local_3;
         if(_local_12 > 0 && _local_13 > _local_12 || _local_12 < 0 && _local_13 < _local_12)
         {
            _local_13 = _local_12;
         }
         this.rupaluv = MathUtils.snap(this.rupaluv,0,hakut);
         this.vevyrod = MathUtils.snap(this.vevyrod,0,hakut);
         this.pihiqy = MathUtils.snap(this.pihiqy,0,hakut);
         this.position.add(biholeci);
         this.rotation.x += _local_11;
         this.rotation.z += _local_13;
         hacoleh.copy(this.position);
         namib.copy(this.rotation);
         setPosition(hacoleh);
         setOrientation(namib);
      }
      
      public function muduqi(_arg_1:Boolean) : void
      {
         this.locked = _arg_1;
         if(_arg_1)
         {
            this.nyjar = 0;
         }
      }
      
      public function bohopopok() : Number
      {
         return this.cojywunyd;
      }
      
      public function fyhyles(_arg_1:Number) : void
      {
         this.cojywunyd = MathUtils.clamp(_arg_1,0,1);
         var _local_2:Number = MathUtils.clamp(this.cojywunyd + this.caf * 0.1,0,1);
         this.sinesi.x = jyle(_local_2,this.hekoceqec.x,this.butef.x,this.pezom.x,this.lozik.x);
         this.sinesi.y = jyle(_local_2,this.hekoceqec.y,this.butef.y,this.pezom.y,this.lozik.y);
         this.gakyvu = Math.atan2(this.sinesi.x,this.sinesi.y);
         this.malo = this.sinesi.length;
         this.kaq = 0;
      }
      
      public function ruvuruc(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Vector3) : void
      {
         this.nyfozy(_arg_1,_arg_2,this.qeqofu);
         _arg_4.x = this.pofis(this.qeqofu) - 0.5 * Math.PI;
         _arg_4.z = Math.atan2(-_arg_2.x,_arg_2.y);
         _arg_3.copy(this.qeqofu.position);
      }
      
      public function nozejoke() : void
      {
         this.target.fesucoqaj(this.targetPosition,this.boje);
      }
      
      private function nyfozy(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Juh) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = this.gakyvu;
         var _local_6:Number = Math.sqrt(_arg_2.x * _arg_2.x + _arg_2.y * _arg_2.y);
         if(_local_6 < 0.00001)
         {
            ziwad.x = 1;
            ziwad.y = 0;
         }
         else
         {
            ziwad.x = _arg_2.x / _local_6;
            ziwad.y = _arg_2.y / _local_6;
         }
         _arg_3.denyzi = 0;
         _arg_3.t = 1;
         susenisac.copy(_arg_1);
         axis.x = ziwad.y;
         axis.y = -ziwad.x;
         ziwad.reverse();
         myzusedit.fromAxisAngle(axis,-_local_5);
         myzusedit.transformVector(ziwad,vukyke);
         this.dekuwujabu(susenisac,vukyke,this.malo,collisionPoint);
         var _local_7:Number = japyne.copy(susenisac).subtract(collisionPoint).length();
         _arg_3.t = _local_7 / this.malo;
         if(_local_7 < sodasyjek)
         {
            susenisac.copy(collisionPoint);
            _local_4 = sodasyjek - _local_7;
            this.dekuwujabu(susenisac,Vector3.Z_AXIS,_local_4,collisionPoint);
         }
         _arg_3.position.copy(collisionPoint);
      }
      
      private function dekuwujabu(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : void
      {
         var _local_5:Number = NaN;
         wiqet(_arg_1,zasel);
         husiqaze.x = _arg_3 * _arg_2.x;
         husiqaze.y = _arg_3 * _arg_2.y;
         husiqaze.z = _arg_3 * _arg_2.z;
         if(this.bosoga.getCollision(zasel,husiqaze,behimum,miqub,this.kelofuqe))
         {
            _local_5 = ryvukuguf + 0.1;
            _arg_4.x = behimum.x + _local_5 * miqub.x;
            _arg_4.y = behimum.y + _local_5 * miqub.y;
            _arg_4.z = behimum.z + _local_5 * miqub.z;
         }
         else
         {
            _arg_4.copy(_arg_1).addScaled(_arg_3,_arg_2);
         }
      }
      
      private function mijewef(_arg_1:Number) : void
      {
         var _local_2:int = 0;
         if(this.nyjar < 0)
         {
            this.gipuru = true;
            this.vejyvoc = false;
            ++this.nyjar;
            if(this.nyjar == 0)
            {
               this.gipuru = false;
            }
         }
         else if(this.nyjar > 0)
         {
            this.gipuru = false;
            this.vejyvoc = true;
            --this.nyjar;
            if(this.nyjar == 0)
            {
               this.vejyvoc = false;
            }
         }
         if(!this.bel && this.gipuru != this.vejyvoc)
         {
            _local_2 = !this.gipuru ? int(-1) : int(1);
            this.lamyb = this.bohopopok() + _local_2 * bukuhe.value * _arg_1;
            this.fyhyles(this.lamyb);
         }
         else
         {
            this.fyhyles(this.cojywunyd);
         }
      }
      
      private function qemytysyg(_arg_1:Number, _arg_2:Number) : Number
      {
         var _local_3:Number = this.vype();
         if(_arg_1 < -cala)
         {
            return _local_3 * (_arg_1 + cala);
         }
         if(_arg_1 > cala)
         {
            return _local_3 * (_arg_1 - cala);
         }
         return _arg_2;
      }
      
      private function pofis(_arg_1:Juh) : Number
      {
         var _local_2:Number = this.gakyvu - pakaq;
         if(_local_2 < 0)
         {
            _local_2 = 0;
         }
         var _local_3:Number = _arg_1.t;
         if(_local_3 >= 1 || _local_2 < vyjyrugy || !this.pary)
         {
            return _arg_1.denyzi - _local_2;
         }
         var _local_4:Number = this.sinesi.x;
         return _arg_1.denyzi - Math.atan2(_local_3 * _local_4,pigiqufez * _local_4 * (1 / Math.tan(_local_2) - (1 - _local_3) / Math.tan(this.gakyvu)));
      }
      
      [Obfuscation(rename="false")]
      override public function close() : void
      {
         storageService.getStorage().data["cameraT"] = this.bohopopok();
         settings.removeEventListener(SettingsServiceEvent.SETTINGS_CHANGED,this.bogusefep);
      }
      
      private function vype() : Number
      {
         return this.targetingMode == Sudyhuma.cuwycagin ? Number(sudyn) : Number(jiqotebe);
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
      {
         if(!this.locked)
         {
            this.caf += _arg_2 * tocim * this.siho();
            this.caf = MathUtils.clamp(this.caf,-1,1);
         }
      }
      
      public function mouseLeftButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(_arg_1:int) : void
      {
         var _local_2:Boolean = false;
         _arg_1 *= this.siho();
         if(!this.locked)
         {
            _local_2 = false;
            if(_arg_1 > 1)
            {
               if(this.nyjar < 0)
               {
                  this.nyjar = 0;
               }
               _local_2 = true;
            }
            if(_arg_1 < 1)
            {
               if(this.nyjar > 0)
               {
                  this.nyjar = 0;
               }
               _local_2 = true;
            }
            if(_local_2)
            {
               this.nyjar = _arg_1 * 2;
            }
         }
      }
      
      public function mouseRightButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function keyboardButton(_arg_1:uint, _arg_2:Boolean) : Boolean
      {
         var _local_3:GameActionEnum = tytol.jikamybu(_arg_1);
         switch(_local_3)
         {
            case GameActionEnum.FOLLOW_CAMERA_UP:
               this.gipuru = _arg_2;
               break;
            case GameActionEnum.FOLLOW_CAMERA_DOWN:
               this.vejyvoc = _arg_2;
         }
         return true;
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Kitut = _arg_1 as Kitut;
         if(_local_2 != null)
         {
            this.targetingMode = _local_2.targetingMode;
         }
      }
      
      private function siho() : int
      {
         return !settings.mouseYInverse ? int(1) : int(-1);
      }
   }
}

