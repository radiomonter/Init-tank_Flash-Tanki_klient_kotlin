package obfuscation.mujusaqim
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   
   public class Hewofyh implements LogicUnit
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var callback:Hylyv;
      
      private var bym:int;
      
      public function Hewofyh(_arg_1:Hylyv, _arg_2:int)
      {
         super();
         this.callback = _arg_1;
         this.bym = _arg_2;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(_arg_1 >= this.bym)
         {
            battleService.getBattleRunner().bapucic(this);
            this.callback.jebycu();
         }
      }
   }
}

