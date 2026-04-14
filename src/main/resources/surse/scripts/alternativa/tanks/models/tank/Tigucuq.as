package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.TankControlLockBits;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.utils.BitMask;
   
   public class Tigucuq extends BattleRunnerProvider implements Hytaqe
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var weapon:Weapon;
      
      private var rituq:BitMask = new BitMask();
      
      public function Tigucuq(_arg_1:Weapon)
      {
         super();
         this.weapon = _arg_1;
         this.rituq.setBits(TankControlLockBits.DEAD);
      }
      
      public function temirih() : void
      {
         this.weapon.activate();
      }
      
      public function qufosyb() : void
      {
         this.weapon.deactivate();
      }
      
      public function covymyf(_arg_1:int, _arg_2:Boolean) : void
      {
         var _local_3:Boolean = this.rituq.isEmpty();
         this.rituq.setBits(_arg_1);
         if(_local_3)
         {
            this.weapon.disable(_arg_2);
         }
      }
      
      public function fygojamo(_arg_1:int) : void
      {
         var _local_2:Boolean = this.rituq.isEmpty();
         this.rituq.clearBits(_arg_1);
         if(!_local_2 && this.rituq.isEmpty())
         {
            this.weapon.enable();
         }
      }
   }
}

