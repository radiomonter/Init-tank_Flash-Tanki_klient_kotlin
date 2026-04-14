package projects.tanks.clients.fp10.libraries.tanksservices.service.user
{
   import flash.events.EventDispatcher;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.UserInfoConsumer;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle.BattleLinkData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.IInfoLabelUpdater;
   
   public class UserInfoLabelUpdater extends EventDispatcher implements UserInfoConsumer, IUserInfoLabelUpdater, IInfoLabelUpdater
   {
      
      private var _rank:int = 0;
      
      private var _uid:String = null;
      
      private var _online:Boolean = false;
      
      private var _serverNumber:int;
      
      private var _battleLink:BattleLinkData;
      
      private var _visibleLabelsCounter:int;
      
      private var _lastAccessTime:Number;
      
      private var _hasPremium:Boolean;
      
      public function UserInfoLabelUpdater()
      {
         super();
      }
      
      public function setOnline(_arg_1:Boolean, _arg_2:int) : void
      {
         this._online = _arg_1;
         this._serverNumber = _arg_2;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_ONLINE));
      }
      
      public function setUid(_arg_1:String) : void
      {
         this._uid = _arg_1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_UID));
      }
      
      public function setRank(_arg_1:int) : void
      {
         this._rank = _arg_1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_RANK));
      }
      
      public function setBattleUrl(_arg_1:BattleLinkData) : void
      {
         this._battleLink = _arg_1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_BATTLE_LINK));
      }
      
      public function setPremium(_arg_1:Boolean, _arg_2:String = null) : void
      {
         this._hasPremium = _arg_1;
         dispatchEvent(new UserInfoLabelUpdaterEvent(UserInfoLabelUpdaterEvent.CHANGE_PREMIUM_STATUS,false,false,false,_arg_2));
      }
      
      public function hasData() : Boolean
      {
         return this.uid != null;
      }
      
      public function get rank() : int
      {
         return this._rank;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function get battleLink() : BattleLinkData
      {
         return this._battleLink;
      }
      
      public function incrementVisibleLabelsCounter() : void
      {
         ++this._visibleLabelsCounter;
      }
      
      public function decrementVisibleLabelsCounter() : void
      {
         --this._visibleLabelsCounter;
      }
      
      public function get visibleLabelsCounter() : int
      {
         return this._visibleLabelsCounter;
      }
      
      public function updateLastAccessTime() : void
      {
         this._lastAccessTime = new Date().time;
      }
      
      public function get lastAccessTime() : Number
      {
         return this._lastAccessTime;
      }
      
      public function hasBattleLink() : Boolean
      {
         return this._battleLink != null;
      }
      
      public function hasPremium() : Boolean
      {
         return this._hasPremium;
      }
   }
}

