package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.BasicGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import alternativa.tanks.models.weapons.targeting.Fetajid;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.getTimer;
   
   public class Gyly extends BattleRunnerProvider implements Weapon, LogicUnit
   {
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const hasef:BasicGlobalGunParams = new BasicGlobalGunParams();
      
      private var controller:Lerih;
      
      private var faki:Fetajid;
      
      private var tukub:EncryptedInt = new EncryptedIntImpl();
      
      private var taziwyn:WeaponForces;
      
      private var weakeningCoeff:Number;
      
      private var telaruzek:EncryptedInt = new EncryptedIntImpl();
      
      private var effects:Benywani;
      
      private var callback:Pyp;
      
      private var nywyv:WeaponPlatform;
      
      private var enabled:Boolean;
      
      private var rosizeny:EncryptedInt = new EncryptedIntImpl();
      
      private var hafireco:Boolean;
      
      public function Gyly(_arg_1:Fetajid, _arg_2:Lerih, _arg_3:int, _arg_4:WeaponForces, _arg_5:Number, _arg_6:int, _arg_7:Benywani, _arg_8:Pyp)
      {
         super();
         this.faki = _arg_1;
         this.controller = _arg_2;
         this.tukub.setInt(_arg_3);
         this.taziwyn = _arg_4;
         this.weakeningCoeff = _arg_5;
         this.telaruzek.setInt(_arg_6);
         this.effects = _arg_7;
         this.callback = _arg_8;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
         this.controller.init();
      }
      
      public function destroy() : void
      {
         this.deactivate();
         this.effects.tesebelyd();
         this.controller.destroy();
         this.controller = null;
         this.effects = null;
         this.taziwyn = null;
         this.faki = null;
         this.callback = null;
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
         if(!this.enabled)
         {
            this.enabled = true;
            this.controller.hilaq();
         }
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         if(this.enabled)
         {
            this.enabled = false;
            this.effects.tesebelyd();
         }
      }
      
      public function reset() : void
      {
         this.enabled = false;
         this.effects.tesebelyd();
         this.rosizeny.setInt(0);
         this.hafireco = false;
      }
      
      public function getStatus() : Number
      {
         if(this.hafireco)
         {
            return MathUtils.clamp((this.rosizeny.getInt() - getTimer()) / this.telaruzek.getInt(),0,1);
         }
         return MathUtils.clamp(1 - (this.rosizeny.getInt() - getTimer()) / this.tukub.getInt(),0,1);
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(this.hafireco)
         {
            if(_arg_1 >= this.rosizeny.getInt())
            {
               this.pekuna(_arg_1);
            }
         }
         else if(this.enabled)
         {
            if(_arg_1 >= this.rosizeny.getInt() && this.controller.selipil())
            {
               this.sygydyjo(_arg_1);
            }
         }
         this.controller.hilaq();
      }
      
      private function sygydyjo(_arg_1:int) : void
      {
         this.hafireco = true;
         this.rosizeny.setInt(_arg_1 + this.telaruzek.getInt());
         this.effects.qis(this.nywyv.getynos(),this.nywyv.qenokeru(),this.telaruzek.getInt());
         this.nywyv.bume(hasef);
         this.effects.vos(hasef.vegenel);
         this.callback.nafyd(_arg_1);
      }
      
      private function pekuna(_arg_1:int) : void
      {
         var _local_2:Gezoriz = null;
         this.hafireco = false;
         this.rosizeny.setInt(_arg_1 + this.tukub.getInt());
         this.nywyv.gytamy(betyqiju);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         if(BattleUtils.cetyryju(this.nywyv.qiniwu(),betyqiju))
         {
            _local_2 = new Gezoriz();
            _local_2.dyri(this.faki.target(betyqiju));
            if(_local_2.zedusyqaf.length > 0)
            {
               this.gos(_local_2);
            }
            this.syh(_local_2,betyqiju);
            this.callback.lydyn(_arg_1,_local_2.revehaw(),_local_2.targets,_local_2.zedusyqaf);
         }
         else
         {
            this.callback.lipapyqyw(_arg_1);
         }
      }
      
      private function gos(_arg_1:Gezoriz) : void
      {
         var _local_2:Body = null;
         var _local_3:Tank = null;
         var _local_5:int = 0;
         var _local_4:Number = 1;
         while(_local_5 < _arg_1.targets.length)
         {
            _local_2 = _arg_1.targets[_local_5];
            _local_3 = _local_2.tank;
            _local_3.tyvedyz(_arg_1.zedusyqaf[_local_5],_arg_1.shotDirection,this.taziwyn.rokakop() * _local_4);
            _local_4 *= this.weakeningCoeff;
            _local_5++;
         }
      }
      
      private function syh(_arg_1:Gezoriz, _arg_2:AllGlobalGunParams) : void
      {
         var _local_3:Vector3 = _arg_1.revehaw();
         if(_local_3 == null && _arg_1.targets.length > 0)
         {
            _local_3 = Sod.teluwelyp(_arg_2.hiwanu,_arg_1.shotDirection);
         }
         this.effects.lys(_arg_2.vegenel,_local_3,_arg_2.direction);
         this.effects.rehunizu(_arg_2.hiwanu,_arg_1.revehaw());
         if(_local_3 != null)
         {
            if(_arg_1.hasStaticHit)
            {
               this.effects.mowyb(_arg_2.vegenel,_arg_1.lozybom,_arg_1.jej);
            }
            if(_arg_1.targets.length > 0)
            {
               this.effects.howupipo(_arg_2.vegenel,_local_3,_arg_1.zedusyqaf,_arg_1.targets);
            }
         }
      }
   }
}

