package obfuscation.jihadufef
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   
   public class Ciwenukic implements Weapon
   {
      
      private static const focavijic:Vector3 = new Vector3();
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private var taziwyn:WeaponForces;
      
      private var effects:Gerucykoq;
      
      private var nywyv:WeaponPlatform;
      
      private var weakening:DistanceWeakening;
      
      private var fomyw:Vokewi;
      
      public function Ciwenukic(_arg_1:WeaponForces, _arg_2:DistanceWeakening, _arg_3:Vokewi, _arg_4:Gerucykoq)
      {
         super();
         this.taziwyn = _arg_1;
         this.effects = _arg_4;
         this.fomyw = _arg_3;
         this.weakening = _arg_2;
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
      
      public function pekuna() : void
      {
         this.nywyv.gytamy(betyqiju);
         this.qac(betyqiju);
      }
      
      private function qac(_arg_1:AllGlobalGunParams) : void
      {
         this.nywyv.qiniwu().addWorldForceScaled(_arg_1.vegenel,_arg_1.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         this.effects.dimiled(this.nywyv.getynos(),this.nywyv.qenokeru());
      }
      
      public function lepyfipyg(_arg_1:Vector3) : void
      {
         this.nywyv.gytamy(betyqiju);
         this.qac(betyqiju);
         this.effects.zazyra(_arg_1);
         this.effects.diqic(betyqiju.hiwanu,_arg_1);
         this.sowoge(_arg_1,null);
      }
      
      public function gulib(_arg_1:Tank, _arg_2:Vector3) : void
      {
         this.nywyv.gytamy(betyqiju);
         this.qac(betyqiju);
         this.effects.zazyra(_arg_2);
         this.hiniguv(_arg_1,_arg_2,betyqiju.vegenel);
         this.sowoge(_arg_2,_arg_1.qiniwu());
      }
      
      private function hiniguv(_arg_1:Tank, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_4:Number = NaN;
         focavijic.diff(_arg_2,_arg_3).normalize();
         if(Vector3.isFiniteVector(focavijic))
         {
            _local_4 = this.rihicef(_arg_2);
            _arg_1.tyvedyz(_arg_2,focavijic,this.taziwyn.rokakop() * _local_4);
         }
      }
      
      private function rihicef(_arg_1:Vector3) : Number
      {
         return this.weakening.sygyta(_arg_1.distanceTo(betyqiju.vegenel));
      }
      
      private function sowoge(_arg_1:Vector3, _arg_2:Body) : void
      {
         var _local_3:Number = this.rihicef(_arg_1);
         this.fomyw.byf(Tank(this.nywyv).tankData.turret,_arg_1,_local_3,_arg_2);
      }
   }
}

