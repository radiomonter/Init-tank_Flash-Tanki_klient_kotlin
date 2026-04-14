package obfuscation.dinas
{
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.DeferredAction;
   import alternativa.tanks.battle.PhysicsController;
   
   public class Damopykul extends BattleRunnerProvider implements DeferredAction
   {
      
      private var controller:PhysicsController;
      
      private var add:Boolean;
      
      public function Damopykul(_arg_1:PhysicsController, _arg_2:Boolean)
      {
         super();
         this.controller = _arg_1;
         this.add = _arg_2;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            fahysemas().wefoderu(this.controller);
         }
         else
         {
            fahysemas().kigunig(this.controller);
         }
      }
   }
}

