package alternativa.tanks.models.weapon.smoky
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.models.weapons.targeting.Sib;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.getTimer;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.mobakobup.Nypufejo;
   
   public class Fiwyge extends BattleRunnerProvider implements Weapon, LogicUnit
   {
      
      private static const gela:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var enabled:Boolean;
      
      private var tukub:EncryptedInt = new EncryptedIntImpl();
      
      private var rosizeny:EncryptedInt = new EncryptedIntImpl();
      
      private var taziwyn:WeaponForces;
      
      private var controller:Lerih;
      
      private var faki:Fetajid;
      
      private var nywyv:WeaponPlatform;
      
      private var weakening:DistanceWeakening;
      
      private var callback:Pohe;
      
      private var effects:Rubelyvo;
      
      public function Fiwyge(_arg_1:int, _arg_2:WeaponForces, _arg_3:Fetajid, _arg_4:DistanceWeakening, _arg_5:Rubelyvo, _arg_6:Pohe, _arg_7:Lerih)
      {
         super();
         this.tukub.setInt(_arg_1);
         this.taziwyn = _arg_2;
         this.faki = _arg_3;
         this.weakening = _arg_4;
         this.effects = _arg_5;
         this.callback = _arg_6;
         this.controller = _arg_7;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.controller.init();
         this.reset();
      }
      
      public function destroy() : void
      {
         this.taziwyn = null;
         this.faki = null;
         this.weakening = null;
         this.effects = null;
         this.callback = null;
         this.controller.destroy();
         this.controller = null;
      }
      
      public function activate() : void
      {
         fahysemas().wop(this);
      }
      
      public function deactivate() : void
      {
         fahysemas().bapucic(this);
      }
      
      public function enable() : void
      {
         this.enabled = true;
         this.controller.hilaq();
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         this.enabled = false;
      }
      
      public function reset() : void
      {
         this.rosizeny.setInt(getTimer());
      }
      
      public function getStatus() : Number
      {
         var _local_1:Number = 1 - (this.rosizeny.getInt() - getTimer()) / this.tukub.getInt();
         return _local_1 > 1 ? Number(1) : Number(_local_1);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(this.controller.selipil())
         {
            if(this.enabled && _arg_1 >= this.rosizeny.getInt())
            {
               this.pekuna(_arg_1);
            }
            this.controller.hilaq();
         }
      }
      
      private function pekuna(_arg_1:int) : void
      {
         var _local_2:Tank = null;
         var _local_3:Number = NaN;
         this.rosizeny.setInt(_arg_1 + this.tukub.getInt());
         this.nywyv.gytamy(gela);
         this.nywyv.qiniwu().addWorldForceScaled(gela.hiwanu,gela.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         this.effects.dimiled(this.nywyv.getynos(),this.nywyv.qenokeru());
         var _local_4:Nypufejo = new Nypufejo();
         if(BattleUtils.cetyryju(this.nywyv.qiniwu(),gela) && this.jyhyjip(gela,_local_4))
         {
            this.effects.zazyra(_local_4.position);
            if(BattleUtils.pote(_local_4.body))
            {
               _local_2 = _local_4.body.tank;
               _local_3 = this.weakening.sygyta(_local_4.distance);
               _local_2.tyvedyz(_local_4.position,_local_4.direction,this.taziwyn.rokakop() * _local_3);
               this.callback.zevidu(_arg_1,_local_4.position,_local_4.body);
            }
            else
            {
               this.effects.diqic(gela.hiwanu,_local_4.position);
               this.callback.dyp(_arg_1,_local_4.position);
            }
         }
         else
         {
            this.callback.lydyn(_arg_1);
         }
      }
      
      private function jyhyjip(_arg_1:AllGlobalGunParams, _arg_2:Nypufejo) : Boolean
      {
         var _local_3:Sib = this.faki.target(_arg_1);
         _arg_2.setResult(_arg_1,_local_3);
         return _local_3.mosylejib();
      }
      
      public function lurekuly(_arg_1:Vector3) : void
      {
         this.effects.woqap(_arg_1);
      }
   }
}

