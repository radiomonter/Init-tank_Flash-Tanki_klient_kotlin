package obfuscation.bicyhaq
{
   import alternativa.tanks.battle.DeferredAction;
   import alternativa.tanks.battle.Trigger;
   
   public class Daduzesi implements DeferredAction
   {
      
      private var cigypy:Dyv;
      
      private var trigger:Trigger;
      
      public function Daduzesi(_arg_1:Dyv, _arg_2:Trigger)
      {
         super();
         this.cigypy = _arg_1;
         this.trigger = _arg_2;
      }
      
      public function execute() : void
      {
         this.cigypy.remove(this.trigger);
      }
   }
}

