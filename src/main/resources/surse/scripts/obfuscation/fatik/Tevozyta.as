package obfuscation.fatik
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.bude.BattleTeam;
   
   public class Tevozyta extends Fujujys implements Zer, TeamDMTargetEvaluator
   {
      
      private var teamType:BattleTeam;
      
      public function Tevozyta()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.teamType = _arg_1;
      }
      
      public function roruqily(_arg_1:Body, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : Number
      {
         var _local_7:Tank = _arg_1.tank;
         if(!_local_7.fiveqejav(this.teamType))
         {
            return bebohid(_local_7,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
         }
         return 0;
      }
   }
}

