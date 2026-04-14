package obfuscation.fatik
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.CTFTargetEvaluator;
   import alternativa.tanks.battle.TeamDMTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.bude.BattleTeam;
   
   public class Kadiwitu extends Fujujys implements Zer, TeamDMTargetEvaluator, CTFTargetEvaluator
   {
      
      private static const bov:int = 3;
      
      private var teamType:BattleTeam;
      
      private var ryzil:Body;
      
      public function Kadiwitu()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.teamType = _arg_1;
      }
      
      public function siga(_arg_1:Body) : void
      {
         this.ryzil = _arg_1;
      }
      
      public function roruqily(_arg_1:Body, _arg_2:int, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : Number
      {
         var _local_7:Number = NaN;
         var _local_8:Tank = _arg_1.tank;
         if(!_local_8.fiveqejav(this.teamType))
         {
            _local_7 = bebohid(_local_8,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
            if(_arg_1 == this.ryzil)
            {
               _local_7 += bov;
            }
            return _local_7;
         }
         return 0;
      }
   }
}

