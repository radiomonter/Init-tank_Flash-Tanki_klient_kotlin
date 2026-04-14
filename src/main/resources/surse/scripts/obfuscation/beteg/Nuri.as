package obfuscation.beteg
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import obfuscation.hasitaze.Gypuza;
   
   public class Nuri implements Weapon, Lalibyjib
   {
      
      private var effects:Homas;
      
      private var currentTarget:Tank;
      
      public function Nuri(_arg_1:Homas)
      {
         super();
         this.effects = _arg_1;
      }
      
      public function init(_arg_1:WeaponPlatform) : void
      {
         this.effects.init(_arg_1.qenokeru(),_arg_1.getynos());
      }
      
      public function destroy() : void
      {
         this.reset();
      }
      
      public function activate() : void
      {
      }
      
      public function deactivate() : void
      {
         this.reset();
      }
      
      public function enable() : void
      {
      }
      
      public function disable(_arg_1:Boolean) : void
      {
         this.reset();
      }
      
      public function reset() : void
      {
         this.currentTarget = null;
         this.effects.tesebelyd();
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function jagu(_arg_1:Gypuza, _arg_2:Tank = null, _arg_3:Vector3 = null) : void
      {
         this.effects.gav(_arg_1,_arg_2,_arg_3);
         this.currentTarget = _arg_2;
      }
      
      public function doverizu() : void
      {
         this.effects.gav(Gypuza.IDLE);
         this.currentTarget = null;
      }
      
      public function stop() : void
      {
         this.effects.tesebelyd();
         this.currentTarget = null;
      }
      
      public function nurafiboh(_arg_1:Tank) : void
      {
         if(_arg_1 != null)
         {
            if(this.currentTarget == _arg_1)
            {
               this.currentTarget = null;
               this.effects.gav(Gypuza.IDLE);
            }
         }
      }
   }
}

