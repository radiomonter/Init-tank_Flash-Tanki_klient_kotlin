package projects.tanks.client.clans.notifier
{
   import alternativa.types.Long;
   import projects.tanks.client.clans.clan.permissions.ClanAction;
   
   public class ClanNotifierData
   {
      
      private var _clanAction:Vector.<ClanAction>;
      
      private var _clanId:String;
      
      private var _clanIncoming:Vector.<String>;
      
      private var _clanMember:Boolean;
      
      private var _clanName:String;
      
      private var _clanOutgoing:Vector.<String>;
      
      private var _clanTag:String;
      
      private var _incomingRequestEnabled:Boolean;
      
      private var _minRankForJoinClan:int;
      
      private var _restrictionTimeJoinClan:Long;
      
      private var _userId:String;
      
      public function ClanNotifierData(_arg_1:Vector.<ClanAction> = null, _arg_2:String = null, _arg_3:Vector.<String> = null, _arg_4:Boolean = false, _arg_5:String = null, _arg_6:Vector.<String> = null, _arg_7:String = null, _arg_8:Boolean = false, _arg_9:int = 0, _arg_10:Long = null, _arg_11:String = null)
      {
         super();
         this._clanAction = _arg_1;
         this._clanId = _arg_2;
         this._clanIncoming = _arg_3;
         this._clanMember = _arg_4;
         this._clanName = _arg_5;
         this._clanOutgoing = _arg_6;
         this._clanTag = _arg_7;
         this._incomingRequestEnabled = _arg_8;
         this._minRankForJoinClan = _arg_9;
         this._restrictionTimeJoinClan = _arg_10;
         this._userId = _arg_11;
      }
      
      public function get clanAction() : Vector.<ClanAction>
      {
         return this._clanAction;
      }
      
      public function set clanAction(_arg_1:Vector.<ClanAction>) : void
      {
         this._clanAction = _arg_1;
      }
      
      public function get clanId() : String
      {
         return this._clanId;
      }
      
      public function set clanId(_arg_1:String) : void
      {
         this._clanId = _arg_1;
      }
      
      public function get clanIncoming() : Vector.<String>
      {
         return this._clanIncoming;
      }
      
      public function set clanIncoming(_arg_1:Vector.<String>) : void
      {
         this._clanIncoming = _arg_1;
      }
      
      public function get clanMember() : Boolean
      {
         return this._clanMember;
      }
      
      public function set clanMember(_arg_1:Boolean) : void
      {
         this._clanMember = _arg_1;
      }
      
      public function get clanName() : String
      {
         return this._clanName;
      }
      
      public function set clanName(_arg_1:String) : void
      {
         this._clanName = _arg_1;
      }
      
      public function get clanOutgoing() : Vector.<String>
      {
         return this._clanOutgoing;
      }
      
      public function set clanOutgoing(_arg_1:Vector.<String>) : void
      {
         this._clanOutgoing = _arg_1;
      }
      
      public function get clanTag() : String
      {
         return this._clanTag;
      }
      
      public function set clanTag(_arg_1:String) : void
      {
         this._clanTag = _arg_1;
      }
      
      public function get incomingRequestEnabled() : Boolean
      {
         return this._incomingRequestEnabled;
      }
      
      public function set incomingRequestEnabled(_arg_1:Boolean) : void
      {
         this._incomingRequestEnabled = _arg_1;
      }
      
      public function get minRankForJoinClan() : int
      {
         return this._minRankForJoinClan;
      }
      
      public function set minRankForJoinClan(_arg_1:int) : void
      {
         this._minRankForJoinClan = _arg_1;
      }
      
      public function get restrictionTimeJoinClan() : Long
      {
         return this._restrictionTimeJoinClan;
      }
      
      public function set restrictionTimeJoinClan(_arg_1:Long) : void
      {
         this._restrictionTimeJoinClan = _arg_1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanNotifierData [";
         _local_1 += "clanAction = " + this.clanAction + " ";
         _local_1 += "clanId = " + this.clanId + " ";
         _local_1 += "clanIncoming = " + this.clanIncoming + " ";
         _local_1 += "clanMember = " + this.clanMember + " ";
         _local_1 += "clanName = " + this.clanName + " ";
         _local_1 += "clanOutgoing = " + this.clanOutgoing + " ";
         _local_1 += "clanTag = " + this.clanTag + " ";
         _local_1 += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _local_1 += "minRankForJoinClan = " + this.minRankForJoinClan + " ";
         _local_1 += "restrictionTimeJoinClan = " + this.restrictionTimeJoinClan + " ";
         _local_1 += "userId = " + this.userId + " ";
         return _local_1 + "]";
      }
   }
}

