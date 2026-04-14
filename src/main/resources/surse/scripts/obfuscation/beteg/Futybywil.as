package obfuscation.beteg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Dimiqit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.BasicGlobalGunParams;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Sib;
   import alternativa.tanks.models.weapons.targeting.priority.Fylem;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   import obfuscation.garud.Rib;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.hasitaze.Rajyc;
   import obfuscation.kajiz.Dapynoc;
   import obfuscation.tyhyzah.Dyn;
   import obfuscation.tyhyzah.Ryryvigep;
   
   public class Futybywil extends BattleRunnerProvider implements Weapon, Dimiqit, Lalibyjib, LogicUnit
   {
      
      private static const laf:int = 250;
      
      private static const kylura:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const hasef:BasicGlobalGunParams = new BasicGlobalGunParams();
      
      private static const localHitPoint:Vector3 = new Vector3();
      
      private static const mefumy:Vector3 = new Vector3();
      
      private static const myzusedit:Matrix3 = new Matrix3();
      
      private var controller:Lerih;
      
      private var nywyv:WeaponPlatform;
      
      private var callback:Gicegepy;
      
      private var effects:Homas;
      
      private var faki:Fetajid;
      
      private var hoziboda:Rajyc;
      
      private var nijumepi:Boolean;
      
      private var piru:Boolean;
      
      private var enabled:Boolean;
      
      private var zusa:int;
      
      private var state:Gypuza;
      
      private var tuco:EncryptedInt = new EncryptedIntImpl();
      
      private var cysyge:EncryptedInt = new EncryptedIntImpl();
      
      private var currentTarget:Body;
      
      private var myhop:Rib;
      
      private var tatuqidec:RayHit;
      
      private var qywanazus:int;
      
      private var rub:Dyn;
      
      private var suvedovu:Ryryvigep;
      
      public function Futybywil(_arg_1:ClientObject, _arg_2:Rajyc, _arg_3:Lerih, _arg_4:Homas, _arg_5:Gicegepy)
      {
         super();
         this.rub = new Dyn(_arg_2);
         this.suvedovu = new Ryryvigep(_arg_2.coneAngle);
         this.faki = new Fetajid(this.suvedovu,new Dapynoc(_arg_1,_arg_2.radius),new Fylem(this.rub));
         this.controller = _arg_3;
         this.callback = _arg_5;
         this.effects = _arg_4;
         this.hoziboda = _arg_2;
         this.myhop = this.myhop;
      }
      
      private static function wacujamah(_arg_1:Tank, _arg_2:Tank) : Gypuza
      {
         return !_arg_1.fiveqejav(_arg_2.teamType) ? Gypuza.DAMAGING : Gypuza.HEALING;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.effects.init(_arg_1.qenokeru(),_arg_1.getynos());
         this.controller.init();
         this.controller.setWeapon(this);
      }
      
      public function destroy() : void
      {
         this.faki = null;
         this.effects = null;
         this.callback = null;
         this.deactivate();
         this.controller.destroy();
         this.myhop = null;
      }
      
      public function activate() : void
      {
         fahysemas().wop(this);
      }
      
      public function deactivate() : void
      {
         this.disable(false);
         fahysemas().bapucic(this);
      }
      
      public function enable() : void
      {
         if(!this.enabled)
         {
            this.enabled = true;
            this.piru = this.controller.sybefe();
         }
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.stop(fahysemas().hulivyjam(),_arg_1);
         }
      }
      
      public function reset() : void
      {
         this.rub.doverizu();
         this.currentTarget = null;
         this.nijumepi = false;
         this.piru = false;
         this.zusa = 0;
         this.cysyge.setInt(0);
         this.tuco.setInt(0);
         this.state = Gypuza.OFF;
      }
      
      public function getStatus() : Number
      {
         var _local_1:Number = NaN;
         if(this.nijumepi)
         {
            _local_1 = this.tudozu(getTimer(),this.state);
         }
         else
         {
            _local_1 = this.nypecu(getTimer());
         }
         return _local_1 / this.hoziboda.capacity;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(this.enabled)
         {
            if(this.nijumepi)
            {
               this.pywukewu(_arg_1);
            }
            else
            {
               this.bomekutub(_arg_1);
            }
         }
      }
      
      private function pywukewu(_arg_1:int) : void
      {
         var _local_2:Body = null;
         if(this.piru)
         {
            this.tatuqidec = this.target();
            _local_2 = Boolean(this.tatuqidec) ? this.tatuqidec.shape.body : null;
            if(_local_2 != this.currentTarget)
            {
               this.currentTarget = _local_2;
               this.loqu(_arg_1);
            }
            else if(this.currentTarget != null)
            {
               if(this.qywanazus + laf <= _arg_1)
               {
                  this.kaludapy(_arg_1);
               }
               this.ligipov();
            }
            this.raqafoj(_arg_1);
            this.gusuj(_arg_1);
         }
         else
         {
            this.stop(_arg_1,true);
         }
      }
      
      private function gusuj(_arg_1:int) : void
      {
         if(this.cysyge.getInt() == 0 && this.tudozu(_arg_1,this.state) <= 0)
         {
            this.stop(_arg_1,true);
         }
      }
      
      private function raqafoj(_arg_1:int) : void
      {
         if(this.cysyge.getInt() > 0)
         {
            if(_arg_1 >= this.tuco.getInt())
            {
               this.cysyge.setInt(this.cysyge.getInt() - 1);
               this.tick(_arg_1);
            }
         }
      }
      
      private function bomekutub(_arg_1:int) : void
      {
         if(this.piru)
         {
            this.start(_arg_1);
         }
      }
      
      public function suvu() : void
      {
         if(this.enabled)
         {
            this.piru = true;
         }
      }
      
      public function dygajocyc() : void
      {
         this.piru = false;
      }
      
      public function nurafiboh(_arg_1:Tank) : void
      {
         if(_arg_1 != null)
         {
            if(this.currentTarget == _arg_1.qiniwu())
            {
               this.currentTarget = null;
               this.qavare(fahysemas().hulivyjam());
            }
         }
      }
      
      private function loqu(_arg_1:int) : void
      {
         this.qavare(_arg_1);
         this.kaludapy(_arg_1);
      }
      
      private function kaludapy(_arg_1:int) : void
      {
         this.qywanazus = _arg_1;
         this.callback.kaludapy(_arg_1,this.tatuqidec);
      }
      
      private function qavare(_arg_1:int) : void
      {
         var _local_2:Tank = null;
         var _local_3:Gypuza = this.state;
         if(this.currentTarget == null)
         {
            this.state = Gypuza.IDLE;
         }
         else
         {
            _local_2 = this.nywyv.qiniwu().tank;
            if(wacujamah(_local_2,this.currentTarget.tank) == Gypuza.HEALING)
            {
               this.state = Gypuza.HEALING;
            }
            else
            {
               this.state = Gypuza.DAMAGING;
            }
         }
         this.zusa = this.nuryjuz(_arg_1,this.tudozu(_arg_1,_local_3),this.state);
         if(this.currentTarget == null)
         {
            this.hinyduby();
         }
         else
         {
            this.wuv(_arg_1);
         }
      }
      
      private function hinyduby() : void
      {
         this.effects.goqida(Gypuza.IDLE);
         this.rub.doverizu();
         this.cysyge.setInt(0);
      }
      
      private function wuv(_arg_1:int) : void
      {
         this.jelelo(_arg_1);
         this.zupovupe(_arg_1);
         this.ligipov();
      }
      
      private function ligipov() : void
      {
         var _local_1:Tank = this.currentTarget.tank;
         var _local_2:Tank = this.nywyv.qiniwu().tank;
         localHitPoint.copy(this.tatuqidec.position);
         BattleUtils.globalToLocal(this.currentTarget,localHitPoint);
         this.effects.goqida(wacujamah(_local_2,_local_1),_local_1,localHitPoint);
      }
      
      private function zupovupe(_arg_1:int) : void
      {
         this.tuco.setInt(_arg_1 + this.hoziboda.checkPeriodMsec);
      }
      
      private function jelelo(_arg_1:int) : void
      {
         var _local_2:Number = this.tudozu(_arg_1,this.state);
         this.cysyge.setInt(kylura.getInt() * _local_2 / (this.gil(this.state) * this.hoziboda.checkPeriodMsec));
      }
      
      private function gil(_arg_1:Gypuza) : int
      {
         switch(_arg_1)
         {
            case Gypuza.DAMAGING:
               return this.hoziboda.dischargeDamageRate;
            case Gypuza.HEALING:
               return this.hoziboda.dischargeHealingRate;
            case Gypuza.IDLE:
               return this.hoziboda.dischargeIdleRate;
            default:
               return 0;
         }
      }
      
      private function tick(_arg_1:int) : void
      {
         this.tuco.setInt(_arg_1 + this.hoziboda.checkPeriodMsec);
         this.nywyv.bume(hasef);
         this.callback.onTick(_arg_1,this.tatuqidec);
      }
      
      private function start(_arg_1:int) : void
      {
         if(!this.nijumepi)
         {
            this.nijumepi = true;
            this.tatuqidec = this.target();
            this.currentTarget = Boolean(this.tatuqidec) ? this.tatuqidec.shape.body : null;
            this.zusa = this.nuryjuz(_arg_1,this.nypecu(_arg_1),this.state);
            this.loqu(_arg_1);
         }
      }
      
      private function stop(_arg_1:int, _arg_2:Boolean) : void
      {
         if(this.nijumepi)
         {
            this.rub.doverizu();
            this.currentTarget = null;
            this.piru = false;
            this.nijumepi = false;
            this.zusa = this.cagobudu(_arg_1,this.tudozu(_arg_1,this.state));
            this.cysyge.setInt(0);
            this.effects.tesebelyd();
            if(_arg_2)
            {
               this.callback.stop(_arg_1);
            }
         }
      }
      
      private function nypecu(_arg_1:int) : Number
      {
         var _local_2:Number = this.hoziboda.capacity;
         var _local_3:Number = this.hoziboda.chargeRate * (_arg_1 - this.zusa) / kylura.getInt();
         return _local_3 > _local_2 ? Number(_local_2) : Number(_local_3);
      }
      
      private function tudozu(_arg_1:int, _arg_2:Gypuza) : Number
      {
         var _local_3:Number = this.hoziboda.capacity - this.gil(_arg_2) * (_arg_1 - this.zusa) / kylura.getInt();
         return _local_3 < 0 ? Number(0) : Number(_local_3);
      }
      
      private function cagobudu(_arg_1:int, _arg_2:Number) : int
      {
         return _arg_1 - _arg_2 / this.hoziboda.chargeRate * kylura.getInt();
      }
      
      private function nuryjuz(_arg_1:int, _arg_2:Number, _arg_3:Gypuza) : int
      {
         return _arg_1 - (this.hoziboda.capacity - _arg_2) / this.gil(_arg_3) * kylura.getInt();
      }
      
      private function target() : RayHit
      {
         var _local_1:RayHit = null;
         var _local_2:Tank = null;
         this.nywyv.gytamy(betyqiju);
         if(this.currentTarget != null)
         {
            this.hulaw();
            mefumy.transform3(myzusedit);
            this.suvedovu.ryzyvu(mefumy);
         }
         else
         {
            this.suvedovu.joqenet();
         }
         var _local_3:Sib = this.faki.target(betyqiju);
         this.fasime(_local_3);
         if(_local_3.zoma())
         {
            _local_1 = _local_3.dopuneq();
            _local_2 = _local_1.shape.body.tank;
            if(_local_2.tankData.health == 0)
            {
               return null;
            }
            this.rub.juvilyvyb(_local_2);
            return _local_3.dopuneq();
         }
         return null;
      }
      
      private function fasime(_arg_1:Sib) : void
      {
         mefumy.copy(_arg_1.jesenebo());
         this.hulaw();
         mefumy.transformTransposed3(myzusedit);
      }
      
      private function hulaw() : void
      {
         var _local_1:Object3D = this.nywyv.qenokeru();
         myzusedit.setRotationMatrix(_local_1.rotationX,_local_1.rotationY,_local_1.rotationZ);
      }
   }
}

