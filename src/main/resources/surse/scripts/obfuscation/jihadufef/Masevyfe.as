package obfuscation.jihadufef
{
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
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.mobakobup.Nypufejo;
   
   public class Masevyfe extends BattleRunnerProvider implements Weapon, LogicUnit
   {
      
      private static const gela:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const nikava:Nypufejo = new Nypufejo();
      
      private var enabled:Boolean;
      
      private var tukub:EncryptedInt = new EncryptedIntImpl();
      
      private var rosizeny:EncryptedInt = new EncryptedIntImpl();
      
      private var taziwyn:WeaponForces;
      
      private var controller:Lerih;
      
      private var faki:Fetajid;
      
      private var nywyv:WeaponPlatform;
      
      private var weakening:DistanceWeakening;
      
      private var fomyw:Vokewi;
      
      private var callback:Suzanufiv;
      
      private var effects:Gerucykoq;
      
      public function Masevyfe(_arg_1:int, _arg_2:WeaponForces, _arg_3:DistanceWeakening, _arg_4:Fetajid, _arg_5:Vokewi, _arg_6:Gerucykoq, _arg_7:Suzanufiv)
      {
         super();
         this.tukub.setInt(_arg_1);
         this.taziwyn = _arg_2;
         this.controller = new Lerih();
         this.faki = _arg_4;
         this.weakening = _arg_3;
         this.fomyw = _arg_5;
         this.callback = _arg_7;
         this.effects = _arg_6;
      }
      
      private static function lywo(_arg_1:Nypufejo) : void
      {
         _arg_1.position.add(_arg_1.normal);
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
         this.fomyw = null;
         this.callback = null;
         this.effects = null;
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
         var _local_3:Tank = null;
         var _local_2:Number = NaN;
         var _local_4:Vector.<String> = new Vector.<String>();
         var _local_5:Vector.<Number> = new Vector.<Number>();
         this.rosizeny.setInt(_arg_1 + this.tukub.getInt());
         this.nywyv.gytamy(gela);
         this.nywyv.qiniwu().addWorldForceScaled(gela.hiwanu,gela.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         this.effects.dimiled(this.nywyv.getynos(),this.nywyv.qenokeru());
         if(BattleUtils.cetyryju(this.nywyv.qiniwu(),gela) && this.jyhyjip(gela,nikava))
         {
            lywo(nikava);
            this.effects.zazyra(nikava.position);
            _local_2 = this.weakening.sygyta(nikava.distance);
            this.fomyw.byf(Tank(this.nywyv).tankData.turret,nikava.position,_local_2,nikava.body,_local_4,_local_5);
            if(BattleUtils.pote(nikava.body))
            {
               _local_3 = nikava.body.tank;
               _local_3.tyvedyz(nikava.position,nikava.direction,this.taziwyn.rokakop() * _local_2);
               this.callback.zevidu(_arg_1,nikava.position,nikava.body,_local_4,_local_5);
            }
            else
            {
               this.effects.diqic(gela.hiwanu,nikava.position);
               this.callback.dyp(_arg_1,nikava.position,_local_4,_local_5);
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
   }
}

