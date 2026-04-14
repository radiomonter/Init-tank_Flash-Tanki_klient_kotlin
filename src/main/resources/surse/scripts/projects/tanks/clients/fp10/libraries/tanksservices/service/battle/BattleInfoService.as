package projects.tanks.clients.fp10.libraries.tanksservices.service.battle
{
   import flash.events.EventDispatcher;
   
   public class BattleInfoService extends EventDispatcher implements IBattleInfoService
   {
      
      private var _currentBattleId:String;
      
      private var _currentSelectionBattleId:String;
      
      private var _minRank:int;
      
      private var _maxRank:int;
      
      private var _spectator:Boolean;
      
      private var fejopova:Boolean;
      
      private var _battleActive:Boolean;
      
      private var userIsInBattle:Boolean;
      
      public function BattleInfoService()
      {
         super();
      }
      
      public function get currentSelectionBattleId() : String
      {
         return this._currentSelectionBattleId;
      }
      
      public function resetCurrentBattle() : void
      {
         this._spectator = false;
         this._currentBattleId = null;
         if(this._currentSelectionBattleId != null)
         {
         }
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_UNLOAD));
      }
      
      public function setCurrentSelectionBattle(_arg_1:String, _arg_2:int, _arg_3:int) : void
      {
         this._currentSelectionBattleId = _arg_1;
         this._minRank = _arg_2;
         this._maxRank = _arg_3;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.SELECTION_BATTLE));
      }
      
      public function get currentBattleId() : String
      {
         return this._currentBattleId;
      }
      
      public function set currentBattleId(_arg_1:String) : void
      {
         this._currentBattleId = _arg_1;
      }
      
      public function resetCurrentSelectionBattleId() : void
      {
         this._currentSelectionBattleId = null;
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.RESET_SELECTION_BATTLE));
      }
      
      public function battleRestart() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_RESTART));
      }
      
      public function battleLoad() : void
      {
         dispatchEvent(new BattleInfoServiceEvent(BattleInfoServiceEvent.BATTLE_LOAD));
      }
      
      public function hasCurrentSelectionBattleId() : Boolean
      {
         return this._currentSelectionBattleId != null;
      }
      
      public function hasCurrentBattleId() : Boolean
      {
         return this._currentBattleId != null;
      }
      
      public function isSpectatorMode() : Boolean
      {
         return this._spectator;
      }
      
      public function get spectator() : Boolean
      {
         return this._spectator;
      }
      
      public function set spectator(_arg_1:Boolean) : void
      {
         this._spectator = _arg_1;
      }
      
      public function get reArmorEnabled() : Boolean
      {
         return this.fejopova;
      }
      
      public function set reArmorEnabled(_arg_1:Boolean) : void
      {
         this.fejopova = _arg_1;
      }
      
      public function availableRank(_arg_1:int) : Boolean
      {
         if(this.hasCurrentSelectionBattleId())
         {
            return _arg_1 >= this._minRank && _arg_1 <= this._maxRank;
         }
         return false;
      }
      
      public function get battleActive() : Boolean
      {
         return this._battleActive;
      }
      
      public function set battleActive(_arg_1:Boolean) : void
      {
         this._battleActive = _arg_1;
      }
      
      public function isInBattle() : Boolean
      {
         return this.userIsInBattle;
      }
      
      public function setInBattle(_arg_1:Boolean) : void
      {
         this.userIsInBattle = _arg_1;
      }
   }
}

