package alternativa.tanks.gui.battle
{
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class BattleFinishDmNotification extends BattleFinishNotification
   {
      
      private static const YOUR_PLACE_REPLACE_PATTERN:String = "{your_place}";
      
      private static const PLACES_REPLACE_PATTERN:String = "{places}";
      
      private static const CRYSTALLS_REPLACE_PATTERN:String = "{crystalls}";
      
      private var _position:int;
      
      private var _places:int;
      
      private var _reward:int;
      
      private var _bonusReward:int;
      
      public function BattleFinishDmNotification(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
      {
         this._position = _arg_1;
         this._places = _arg_2;
         this._reward = _arg_3;
         this._bonusReward = _arg_4;
         super();
      }
      
      override public function get message() : String
      {
         return localeService.getText(TanksLocale.TEXT_REARM_DM_END_BATTLE) + "\n" + localeService.getText(TanksLocale.TEXT_REARM_BATTLE_PLACE).replace(YOUR_PLACE_REPLACE_PATTERN,this._position).replace(PLACES_REPLACE_PATTERN,this._places) + "\n" + localeService.getText(TanksLocale.TEXT_REARM_BATTLE_PRIZE).replace(CRYSTALLS_REPLACE_PATTERN,getRewardText(this._reward,this._bonusReward));
      }
   }
}

