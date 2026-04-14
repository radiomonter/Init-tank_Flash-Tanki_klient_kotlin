package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.BasicGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponForces;
   import obfuscation.kyre.Myw;
   
   public class Fupufigu implements Weapon
   {
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const hasef:BasicGlobalGunParams = new BasicGlobalGunParams();
      
      private var effects:Benywani;
      
      private var nywyv:WeaponPlatform;
      
      private var bolyj:Gobu;
      
      private var taziwyn:WeaponForces;
      
      public function Fupufigu(_arg_1:WeaponForces, _arg_2:Gobu, _arg_3:Benywani)
      {
         super();
         this.taziwyn = _arg_1;
         this.bolyj = _arg_2;
         this.effects = _arg_3;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
      }
      
      public function destroy() : void
      {
         this.effects.tesebelyd();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.effects.tesebelyd();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         this.effects.tesebelyd();
      }
      
      public function reset() : void
      {
         this.effects.tesebelyd();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function sygydyjo() : void
      {
         this.effects.qis(this.nywyv.getynos(),this.nywyv.qenokeru(),this.bolyj.fojym());
         this.nywyv.bume(hasef);
         this.effects.vos(hasef.vegenel);
      }
      
      public function cijafe(_arg_1:Vector3, _arg_2:Vector.<Body>, _arg_3:Vector.<Vector3>) : void
      {
         var _local_4:Vector3 = null;
         var _local_6:int = 0;
         var _local_7:Body = null;
         var _local_8:Vector3 = null;
         var _local_9:Tank = null;
         var _local_5:Number = NaN;
         this.nywyv.gytamy(betyqiju);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
         var _local_10:Vector3 = _arg_1;
         if(_arg_2 != null && _arg_2.length > 0)
         {
            _local_4 = new Vector3();
            _local_4.diff(_arg_3[_arg_3.length - 1],betyqiju.hiwanu).normalize();
            if(Vector3.isFiniteVector(_local_4))
            {
               if(_local_10 == null)
               {
                  _local_10 = Sod.teluwelyp(betyqiju.hiwanu,_local_4);
               }
               _local_5 = 1;
               _local_6 = 0;
               while(_local_6 < _arg_2.length)
               {
                  _local_7 = _arg_2[_local_6];
                  if(_local_7 != null && _local_7.tank != null)
                  {
                     _local_8 = _arg_3[_local_6];
                     if(Vector3.isFiniteVector(_local_8))
                     {
                        _local_9 = _local_7.tank;
                        _local_9.tyvedyz(_local_8,_local_4,this.taziwyn.rokakop() * _local_5);
                     }
                  }
                  _local_5 *= this.bolyj.levicedu();
                  _local_6++;
               }
            }
            this.effects.howupipo(betyqiju.vegenel,_arg_3[_arg_3.length - 1],_arg_3,_arg_2);
         }
         this.effects.lys(betyqiju.vegenel,_local_10,betyqiju.direction);
         if(_arg_1 != null)
         {
            this.effects.rehunizu(betyqiju.hiwanu,_arg_1);
            this.effects.mowyb(betyqiju.vegenel,_arg_1,this.fodigyt(betyqiju.vegenel,_arg_1));
         }
      }
      
      private function fodigyt(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         var _local_3:Vector3 = _arg_2.clone();
         _local_3.subtract(_arg_1).normalize();
         var _local_4:Vector3 = _arg_2.clone();
         _local_4.subtract(_local_3);
         var _local_5:RayHit = new RayHit();
         if(this.nywyv.qiniwu().scene.collisionDetector.raycastStatic(_local_4,_local_3,Myw.dyhan,100,null,_local_5))
         {
            return _local_5.normal;
         }
         _local_3.reverse();
         return _local_3;
      }
      
      public function nakole() : void
      {
         this.nywyv.gytamy(betyqiju);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.taziwyn.razo());
         this.nywyv.fufyvi();
      }
   }
}

