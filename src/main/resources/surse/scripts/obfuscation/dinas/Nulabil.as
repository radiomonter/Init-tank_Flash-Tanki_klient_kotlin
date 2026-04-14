package obfuscation.dinas
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.DeferredAction;
   import alternativa.tanks.battle.PostPhysicsController;
   
   public class Nulabil extends BattleRunnerProvider implements DeferredAction
   {
      
      private var controller:PostPhysicsController;
      
      public function Nulabil(_arg_1:PostPhysicsController)
      {
         super();
         this.controller = _arg_1;
      }
      
      public function execute() : void
      {
         fahysemas().wapiti(this.controller);
      }
   }
}

