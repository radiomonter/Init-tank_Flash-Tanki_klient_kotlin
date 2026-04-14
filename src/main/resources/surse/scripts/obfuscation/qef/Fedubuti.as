package obfuscation.qef
{
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.battle.objects.tank.WeaponPlatform;
   import obfuscation.vynoq.Peg;
   
   public class Fedubuti implements Weapon
   {
      
      private var effects:Peg;
      
      private var nywyv:WeaponPlatform;
      
      public function Fedubuti(_arg_1:Peg)
      {
         super();
         this.effects = _arg_1;
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
      }
      
      public function getStatus() : Number
      {
         return 0;
      }
      
      public function startFire() : void
      {
         this.effects.bihev(this.nywyv.qiniwu(),this.nywyv.getynos(),this.nywyv.qenokeru());
      }
      
      public function kowywer() : void
      {
         this.effects.tesebelyd();
      }
   }
}

