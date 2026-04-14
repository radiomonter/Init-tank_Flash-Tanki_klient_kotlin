package obfuscation.dinas
{
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.DeferredAction;
   import alternativa.tanks.battle.LogicUnit;
   
   public class Cyw implements DeferredAction
   {
      
      private var natoz:LogicUnit;
      
      private var rycabo:BattleRunner;
      
      private var add:Boolean;
      
      public function Cyw(_arg_1:BattleRunner, _arg_2:LogicUnit, _arg_3:Boolean)
      {
         super();
         this.rycabo = _arg_1;
         this.natoz = _arg_2;
         this.add = _arg_3;
      }
      
      public function execute() : void
      {
         if(this.add)
         {
            this.rycabo.wop(this.natoz);
         }
         else
         {
            this.rycabo.bapucic(this.natoz);
         }
      }
   }
}

