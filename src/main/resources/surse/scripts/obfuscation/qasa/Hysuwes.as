package obfuscation.qasa
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Zyzeri;
   import obfuscation.bude.BattleTeam;
   
   public class Hysuwes implements Zyzeri, TeamDMTargetEvaluator
   {
      
      private var fejahuda:BattleTeam;
      
      public function Hysuwes()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.fejahuda = _arg_1;
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
         return 1;
      }
      
      public function muqa(_arg_1:Body) : Boolean
      {
         var _local_2:Tank = _arg_1.tank;
         return _local_2.fiveqejav(this.fejahuda);
      }
   }
}

