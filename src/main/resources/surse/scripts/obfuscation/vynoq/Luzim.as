package obfuscation.vynoq
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Dimiqit;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.shared.Hebesed;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import flash.utils.getTimer;
   
   public class Luzim extends BattleRunnerProvider implements Weapon, LogicUnit, Dimiqit
   {
      
      private static const fosyreteho:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const buk:Number = 0.3;
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const tenirib:Vector.<Body> = new Vector.<Body>();
      
      private static const fuvawob:Vector.<Number> = new Vector.<Number>();
      
      private static const nogyj:Vector.<Vector3> = new Vector.<Vector3>();
      
      private var energyCapacity:EncryptedNumber = new EncryptedNumberImpl();
      
      private var ridezuja:EncryptedNumber = new EncryptedNumberImpl();
      
      private var energyRechargeSpeed:EncryptedNumber = new EncryptedNumberImpl();
      
      private var tickInterval:EncryptedInt = new EncryptedIntImpl();
      
      private var faki:Hebesed;
      
      private var controller:Lerih;
      
      private var callback:Duhuj;
      
      private var effects:Peg;
      
      private var nywyv:WeaponPlatform;
      
      private var tuco:EncryptedInt = new EncryptedIntImpl();
      
      private var enabled:Boolean;
      
      private var piru:Boolean;
      
      private var nijumepi:Boolean;
      
      private var zusa:EncryptedInt = new EncryptedIntImpl();
      
      private var cysyge:EncryptedInt = new EncryptedIntImpl();
      
      public function Luzim(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:int, _arg_5:Hebesed, _arg_6:Lerih, _arg_7:Duhuj, _arg_8:Peg)
      {
         super();
         this.energyCapacity.setNumber(_arg_1);
         this.ridezuja.setNumber(_arg_2);
         this.energyRechargeSpeed.setNumber(_arg_3);
         this.tickInterval.setInt(_arg_4);
         this.faki = _arg_5;
         this.controller = _arg_6;
         this.callback = _arg_7;
         this.effects = _arg_8;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.controller.init();
         this.controller.setWeapon(this);
      }
      
      public function destroy() : void
      {
         this.faki = null;
         this.effects = null;
         this.callback = null;
         this.controller.destroy();
         this.controller = null;
         this.nywyv = null;
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
         this.nijumepi = false;
         this.piru = false;
         this.zusa.setInt(0);
         this.tuco.setInt(0);
         this.cysyge.setInt(0);
      }
      
      public function getStatus() : Number
      {
         var _local_1:Number = NaN;
         if(this.piru)
         {
            _local_1 = this.tudozu(getTimer());
         }
         else
         {
            _local_1 = this.nypecu(getTimer());
         }
         return _local_1 / this.energyCapacity.getNumber();
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
         if(this.piru)
         {
            this.raqafoj(_arg_1);
            this.vaseputab(_arg_1);
         }
         else
         {
            this.stop(_arg_1,true);
         }
      }
      
      private function raqafoj(_arg_1:int) : void
      {
         if(this.cysyge.getInt() > 0)
         {
            if(this.tuco.getInt() <= _arg_1)
            {
               this.tick(_arg_1);
               this.cysyge.setInt(this.cysyge.getInt() - 1);
            }
         }
      }
      
      private function vaseputab(_arg_1:int) : void
      {
         if(this.cysyge.getInt() == 0)
         {
            if(this.tudozu(_arg_1) <= 0)
            {
               this.stop(_arg_1,true);
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
      
      private function start(_arg_1:int) : void
      {
         var _local_2:Number = NaN;
         if(!this.nijumepi)
         {
            this.nijumepi = true;
            _local_2 = this.nypecu(_arg_1);
            this.zusa.setInt(this.rajyba(_arg_1,_local_2));
            this.jovuwa(_local_2);
            this.tuco.setInt(_arg_1 + this.tickInterval.getInt());
            this.effects.bihev(this.nywyv.qiniwu(),this.nywyv.getynos(),this.nywyv.qenokeru());
            this.callback.start(_arg_1);
         }
      }
      
      private function jovuwa(_arg_1:Number) : void
      {
         this.cysyge.setInt(fosyreteho.getInt() * _arg_1 / (this.ridezuja.getNumber() * this.tickInterval.getInt()));
      }
      
      private function stop(_arg_1:int, _arg_2:Boolean) : void
      {
         if(this.nijumepi)
         {
            this.piru = false;
            this.nijumepi = false;
            this.zusa.setInt(_arg_1 - this.tudozu(_arg_1) / this.energyRechargeSpeed.getNumber() * fosyreteho.getInt());
            this.cysyge.setInt(0);
            this.effects.tesebelyd();
            if(_arg_2)
            {
               this.callback.stop(_arg_1);
            }
         }
      }
      
      private function tick(_arg_1:int) : void
      {
         var _local_2:Body = null;
         var _local_6:int = 0;
         this.tuco.setInt(_arg_1 + this.tickInterval.getInt());
         var _local_3:Vector3 = this.nywyv.getynos();
         this.nywyv.gytamy(betyqiju);
         var _local_4:Number = _local_3.y;
         tenirib.length = 0;
         fuvawob.length = 0;
         nogyj.length = 0;
         this.faki.zimibyq(this.nywyv.qiniwu(),_local_4,buk,betyqiju.hiwanu,betyqiju.direction,betyqiju.navi,tenirib,fuvawob,nogyj);
         var _local_5:int = int(tenirib.length);
         if(_local_5 > 0)
         {
            this.callback.onTick(this,tenirib,fuvawob,nogyj,_arg_1);
         }
         while(_local_6 < tenirib.length)
         {
            _local_2 = tenirib[_local_6];
            _local_2.tank.fif(nogyj[_local_6]);
            _local_6++;
         }
         tenirib.length = 0;
         fuvawob.length = 0;
         nogyj.length = 0;
      }
      
      private function nypecu(_arg_1:int) : Number
      {
         var _local_2:Number = this.energyCapacity.getNumber();
         var _local_3:Number = this.energyRechargeSpeed.getNumber() * (_arg_1 - this.zusa.getInt()) / fosyreteho.getInt();
         return _local_3 > _local_2 ? Number(_local_2) : Number(_local_3);
      }
      
      private function tudozu(_arg_1:int) : Number
      {
         var _local_2:Number = this.energyCapacity.getNumber() - this.ridezuja.getNumber() * (_arg_1 - this.zusa.getInt()) / fosyreteho.getInt();
         return _local_2 < 0 ? Number(0) : Number(_local_2);
      }
      
      private function rajyba(_arg_1:int, _arg_2:Number) : int
      {
         return _arg_1 - (this.energyCapacity.getNumber() - _arg_2) / this.ridezuja.getNumber() * fosyreteho.getInt();
      }
   }
}

