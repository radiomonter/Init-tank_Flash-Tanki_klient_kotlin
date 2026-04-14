package obfuscation.mujusaqim
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.CTFTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Zyzeri;
   import obfuscation.bude.BattleTeam;
   
   public class Nodof implements Zyzeri, CTFTargetEvaluator
   {
      
      private var fejahuda:BattleTeam;
      
      private var ryzil:Body;
      
      public function Nodof()
      {
         super();
      }
      
      public function bokepowan(_arg_1:Body) : Number
      {
         var _local_2:Tank = _arg_1.tank;
         if(_local_2.tankData.health <= 0)
         {
            return 0;
         }
         if(_local_2.fiveqejav(this.fejahuda))
         {
            return 0;
         }
         if(_arg_1 == this.ryzil)
         {
            return 10;
         }
         return 1;
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.fejahuda = _arg_1;
      }
      
      public function siga(_arg_1:Body) : void
      {
         this.ryzil = _arg_1;
      }
      
      public function muqa(_arg_1:Body) : Boolean
      {
         var _local_2:Tank = _arg_1.tank;
         return _local_2.fiveqejav(this.fejahuda);
      }
   }
}

