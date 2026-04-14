package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.battle
{
   import obfuscation.fabuqy.Nukoki;
   import projects.tanks.client.tanksservices.model.notifier.battle.BattleNotifierData;
   import projects.tanks.client.tanksservices.types.battle.BattleInfoData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoLabelUpdater;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class BattleLinkData
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      private var _userId:String;
      
      private var battleData:BattleInfoData;
      
      private var _mapName:String;
      
      public function BattleLinkData(_arg_1:String, _arg_2:BattleNotifierData)
      {
         super();
         this._userId = _arg_1;
         this.battleData = _arg_2.battleData;
         this._mapName = this.battleData.mapName + " " + this.battleData.mode.name;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get serverNumber() : int
      {
         return this.battleData.serverNumber;
      }
      
      public function get battleId() : String
      {
         return this.battleData.battleId;
      }
      
      public function get range() : Nukoki
      {
         return this.battleData.range;
      }
      
      public function getBattleData() : BattleInfoData
      {
         return this.battleData;
      }
      
      public function isSelfBattle() : Boolean
      {
         var _local_1:String = userInfoService.getCurrentUserId();
         var _local_2:IUserInfoLabelUpdater = userInfoService.getOrCreateUpdater(_local_1);
         if(_local_2.battleLink != null)
         {
            return _local_2.battleLink.battleId == this.battleId;
         }
         return false;
      }
      
      public function isShowBattle() : Boolean
      {
         var _local_1:Boolean = true;
         if(this.battleData.privateBattle)
         {
            _local_1 = this.isSelfBattle();
         }
         return _local_1;
      }
      
      public function availableRank() : Boolean
      {
         var _local_1:int = userPropertiesService.rank;
         return this.isShowBattle() && (_local_1 >= this.battleData.range.min && _local_1 <= this.battleData.range.max);
      }
      
      public function isClickable() : Boolean
      {
         return !this.isSelfBattle() && this.isShowBattle();
      }
      
      public function get proBattle() : Boolean
      {
         return this.battleData.proBattle;
      }
      
      public function get mapName() : String
      {
         return this._mapName;
      }
   }
}

