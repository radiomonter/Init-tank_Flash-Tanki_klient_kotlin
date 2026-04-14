package alternativa.tanks.engine3d
{
   import alternativa.tanks.battle.events.BattleEventListener;
   
   public class Risi implements BattleEventListener
   {
      
      private var registry:Cisi;
      
      public function Risi(_arg_1:Cisi)
      {
         super();
         this.registry = _arg_1;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.registry.clear();
      }
   }
}

