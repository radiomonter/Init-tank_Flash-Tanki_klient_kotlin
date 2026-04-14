package alternativa.tanks.models.weapon.smoky
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   
   public class Tujepeku implements Weapon
   {
      
      private static const gela:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var taziwyn:WeaponForces;
      
      private var effects:Rubelyvo;
      
      private var nywyv:WeaponPlatform;
      
      public function Tujepeku(_arg_1:WeaponForces, _arg_2:Rubelyvo)
      {
         super();
         this.taziwyn = _arg_1;
         this.effects = _arg_2;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
      }
      
      public function destroy() : void
      {
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
      }
      
      public function enable() : void
      {
      }
      
      public function disable(_arg_1:Boolean) : void
      {
      }
      
      public function reset() : void
      {
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function rulok() : void
      {
         this.nywyv.gytamy(gela);
         this.dimiled(gela);
      }
      
      public function bizy(_arg_1:Vector3) : void
      {
         this.nywyv.gytamy(gela);
         this.dimiled(gela);
         this.effects.diqic(gela.hiwanu,_arg_1);
         this.effects.zazyra(_arg_1);
      }
      
      public function vacapyno(_arg_1:Tank, _arg_2:Vector3, _arg_3:Number, _arg_4:Boolean) : void
      {
         this.nywyv.gytamy(gela);
         this.dimiled(gela);
         var _local_5:Vector3 = _arg_2.clone().subtract(gela.vegenel).normalize();
         _arg_1.tyvedyz(_arg_2,_local_5,_arg_3 * this.taziwyn.rokakop());
         this.effects.zazyra(_arg_2);
         if(_arg_4)
         {
            this.effects.woqap(_arg_1.qiniwu().state.position);
         }
      }
      
      private function dimiled(_arg_1:AllGlobalGunParams) : void
      {
         this.nywyv.qiniwu().addWorldForceScaled(_arg_1.vegenel,_arg_1.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         this.effects.dimiled(this.nywyv.getynos(),this.nywyv.qenokeru());
      }
   }
}

