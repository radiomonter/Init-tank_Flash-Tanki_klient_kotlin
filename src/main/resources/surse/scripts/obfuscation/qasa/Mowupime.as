package obfuscation.qasa
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.CTFTargetEvaluator;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Qunomili;
   import obfuscation.bude.BattleTeam;
   
   public class Mowupime implements Qunomili, CTFTargetEvaluator
   {
      
      private static const sote:Number = 0.0001;
      
      private var fejahuda:BattleTeam;
      
      public function Mowupime()
      {
         super();
      }
      
      public function bobaku(_arg_1:BattleTeam) : void
      {
         this.fejahuda = _arg_1;
      }
      
      public function roruqily(_arg_1:Body) : Number
      {
         var _local_2:int = 0;
         var _local_3:Tank = _arg_1.tank;
         if(_local_3.fiveqejav(this.fejahuda))
         {
            _local_2 = 0;
            if(_local_3.batubazy() > sote)
            {
               _local_2 = 5;
            }
            else if(_local_3.batubazy() < -sote)
            {
               _local_2 = 4;
            }
            return _local_3.tankData.health > _local_3.cimyg() - sote ? Number(1) : Number(3 + _local_2);
         }
         return 2;
      }
      
      public function siga(_arg_1:Body) : void
      {
      }
   }
}

