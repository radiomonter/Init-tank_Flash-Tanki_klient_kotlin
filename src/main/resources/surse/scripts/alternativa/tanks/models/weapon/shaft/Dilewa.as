package alternativa.tanks.models.weapon.shaft
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.WeaponConst;
   import alternativa.tanks.utils.EncryptedNumber;
   import alternativa.tanks.utils.EncryptedNumberImpl;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import obfuscation.garud.Rib;
   import obfuscation.zajun.Qiqa;
   
   public class Dilewa implements Weapon
   {
      
      private static const betyqiju:AllGlobalGunParams = new AllGlobalGunParams();
      
      private static const shotDirection:Vector3 = new Vector3();
      
      private var effects:Roguqine;
      
      private var cahosarih:Qiqa;
      
      private var nywyv:WeaponPlatform;
      
      private var qywuhatoq:Vipopulo;
      
      private var kivuqav:TankSpecification;
      
      private var myhop:Rib;
      
      private var pepezemu:EncryptedNumber;
      
      public function Dilewa(_arg_1:Number, _arg_2:Qiqa, _arg_3:Roguqine, _arg_4:Rib, _arg_5:TankSpecification)
      {
         super();
         this.pepezemu = new EncryptedNumberImpl(_arg_1);
         this.cahosarih = _arg_2;
         this.effects = _arg_3;
         this.myhop = _arg_4;
         this.kivuqav = _arg_5;
      }
      
      private static function jyliry(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3) : Vector3
      {
         if(_arg_2 != null)
         {
            return shotDirection.diff(_arg_2,_arg_1).normalize();
         }
         if(_arg_3 == null)
         {
            _arg_3 = betyqiju.direction;
         }
         return shotDirection.diff(_arg_3,_arg_1).normalize();
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.nywyv = _arg_1;
      }
      
      public function destroy() : void
      {
         this.effects.destroy();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.legify();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         this.legify();
      }
      
      public function reset() : void
      {
         this.legify();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function govuz() : void
      {
         if(this.qywuhatoq == null)
         {
            this.effects.qewimequg(this.nywyv.qenokeru());
            this.nywyv.stopMovement();
            this.nywyv.finypa(true);
            this.qywuhatoq = new Vipopulo(this.cahosarih,this.myhop,this.kivuqav);
            this.qywuhatoq.start();
         }
      }
      
      public function legify() : void
      {
         if(this.qywuhatoq != null)
         {
            this.qywuhatoq.stop();
            this.qywuhatoq = null;
         }
         this.effects.hyhu();
         this.nywyv.finypa(false);
      }
      
      public function gijaguzu(_arg_1:Vector3, _arg_2:Body, _arg_3:Vector3, _arg_4:Number) : void
      {
         var _local_5:Vector3 = null;
         this.nywyv.gytamy(betyqiju);
         this.nywyv.qiniwu().addWorldForceScaled(betyqiju.vegenel,betyqiju.direction,-this.pepezemu.getNumber());
         this.nywyv.fufyvi();
         this.effects.rijewury(this.nywyv.getynos(),this.nywyv.qenokeru());
         this.effects.numule(betyqiju.vegenel);
         this.effects.laqevoj(betyqiju.hiwanu,_arg_1);
         if(_arg_1 != null || _arg_3 != null)
         {
            _local_5 = jyliry(betyqiju.hiwanu,_arg_1,_arg_3);
            this.effects.huj(_arg_1,_arg_3,betyqiju.vegenel,betyqiju.direction,_local_5);
            this.cihocar(_arg_2,_arg_3,_local_5,_arg_4);
         }
      }
      
      private function cihocar(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number) : void
      {
         var _local_6:Tank = null;
         var _local_5:Number = NaN;
         if(_arg_1 == null)
         {
            return;
         }
         if(Vector3.isFiniteVector(_arg_3))
         {
            _local_5 = _arg_4 * WeaponConst.hetohiky.getNumber();
            if(_arg_1 != null && _arg_1.tank != null)
            {
               if(Vector3.isFiniteVector(_arg_2))
               {
                  _local_6 = _arg_1.tank;
                  _local_6.tyvedyz(_arg_2,_arg_3,_local_5);
               }
            }
         }
      }
   }
}

