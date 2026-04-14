package alternativa.tanks.battle
{
   public class BattleRunnerProvider
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public function BattleRunnerProvider()
      {
         super();
      }
      
      protected function fahysemas() : BattleRunner
      {
         return battleService.getBattleRunner();
      }
   }
}

