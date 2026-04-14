package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.objects.tank.Weapon;
   
   public class Kaqydaho extends BattleRunnerProvider implements Hytaqe
   {
      
      private var weapon:Weapon;
      
      public function Kaqydaho(_arg_1:Weapon)
      {
         super();
         this.weapon = _arg_1;
      }
      
      public function covymyf(_arg_1:int, _arg_2:Boolean) : void
      {
         this.weapon.disable(false);
      }
      
      public function fygojamo(_arg_1:int) : void
      {
         this.weapon.enable();
      }
      
      public function temirih() : void
      {
         this.weapon.activate();
      }
      
      public function qufosyb() : void
      {
         this.weapon.deactivate();
      }
   }
}

