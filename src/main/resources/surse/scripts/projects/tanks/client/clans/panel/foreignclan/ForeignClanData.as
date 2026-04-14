package projects.tanks.client.clans.panel.foreignclan
{
   import alternativa.types.Long;
   import projects.tanks.client.clans.clan.clanmembersdata.UserData;
   
   public class ForeignClanData
   {
      
      private var _blocked:Boolean;
      
      private var _createTime:Long;
      
      private var _creatorId:String;
      
      private var _description:String;
      
      private var _flagId:Long;
      
      private var _incomingRequestEnabled:Boolean;
      
      private var _maxMembers:int;
      
      private var _memberClan:Boolean;
      
      private var _minRankForAddClan:int;
      
      private var _name:String;
      
      private var _reasonForBlocking:String;
      
      private var _requestInIncoming:Boolean;
      
      private var _requestInOutgoing:Boolean;
      
      private var _tag:String;
      
      private var _timeBlocking:Long;
      
      private var _users:Vector.<UserData>;
      
      public function ForeignClanData(_arg_1:Boolean = false, _arg_2:Long = null, _arg_3:String = null, _arg_4:String = null, _arg_5:Long = null, _arg_6:Boolean = false, _arg_7:int = 0, _arg_8:Boolean = false, _arg_9:int = 0, _arg_10:String = null, _arg_11:String = null, _arg_12:Boolean = false, _arg_13:Boolean = false, _arg_14:String = null, _arg_15:Long = null, _arg_16:Vector.<UserData> = null)
      {
         super();
         this._blocked = _arg_1;
         this._createTime = _arg_2;
         this._creatorId = _arg_3;
         this._description = _arg_4;
         this._flagId = _arg_5;
         this._incomingRequestEnabled = _arg_6;
         this._maxMembers = _arg_7;
         this._memberClan = _arg_8;
         this._minRankForAddClan = _arg_9;
         this._name = _arg_10;
         this._reasonForBlocking = _arg_11;
         this._requestInIncoming = _arg_12;
         this._requestInOutgoing = _arg_13;
         this._tag = _arg_14;
         this._timeBlocking = _arg_15;
         this._users = _arg_16;
      }
      
      public function get blocked() : Boolean
      {
         return this._blocked;
      }
      
      public function set blocked(_arg_1:Boolean) : void
      {
         this._blocked = _arg_1;
      }
      
      public function get createTime() : Long
      {
         return this._createTime;
      }
      
      public function set createTime(_arg_1:Long) : void
      {
         this._createTime = _arg_1;
      }
      
      public function get creatorId() : String
      {
         return this._creatorId;
      }
      
      public function set creatorId(_arg_1:String) : void
      {
         this._creatorId = _arg_1;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(_arg_1:String) : void
      {
         this._description = _arg_1;
      }
      
      public function get flagId() : Long
      {
         return this._flagId;
      }
      
      public function set flagId(_arg_1:Long) : void
      {
         this._flagId = _arg_1;
      }
      
      public function get incomingRequestEnabled() : Boolean
      {
         return this._incomingRequestEnabled;
      }
      
      public function set incomingRequestEnabled(_arg_1:Boolean) : void
      {
         this._incomingRequestEnabled = _arg_1;
      }
      
      public function get maxMembers() : int
      {
         return this._maxMembers;
      }
      
      public function set maxMembers(_arg_1:int) : void
      {
         this._maxMembers = _arg_1;
      }
      
      public function get memberClan() : Boolean
      {
         return this._memberClan;
      }
      
      public function set memberClan(_arg_1:Boolean) : void
      {
         this._memberClan = _arg_1;
      }
      
      public function get minRankForAddClan() : int
      {
         return this._minRankForAddClan;
      }
      
      public function set minRankForAddClan(_arg_1:int) : void
      {
         this._minRankForAddClan = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get reasonForBlocking() : String
      {
         return this._reasonForBlocking;
      }
      
      public function set reasonForBlocking(_arg_1:String) : void
      {
         this._reasonForBlocking = _arg_1;
      }
      
      public function get requestInIncoming() : Boolean
      {
         return this._requestInIncoming;
      }
      
      public function set requestInIncoming(_arg_1:Boolean) : void
      {
         this._requestInIncoming = _arg_1;
      }
      
      public function get requestInOutgoing() : Boolean
      {
         return this._requestInOutgoing;
      }
      
      public function set requestInOutgoing(_arg_1:Boolean) : void
      {
         this._requestInOutgoing = _arg_1;
      }
      
      public function get tag() : String
      {
         return this._tag;
      }
      
      public function set tag(_arg_1:String) : void
      {
         this._tag = _arg_1;
      }
      
      public function get timeBlocking() : Long
      {
         return this._timeBlocking;
      }
      
      public function set timeBlocking(_arg_1:Long) : void
      {
         this._timeBlocking = _arg_1;
      }
      
      public function get users() : Vector.<UserData>
      {
         return this._users;
      }
      
      public function set users(_arg_1:Vector.<UserData>) : void
      {
         this._users = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ForeignClanData [";
         _local_1 += "blocked = " + this.blocked + " ";
         _local_1 += "createTime = " + this.createTime + " ";
         _local_1 += "creatorId = " + this.creatorId + " ";
         _local_1 += "description = " + this.description + " ";
         _local_1 += "flagId = " + this.flagId + " ";
         _local_1 += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _local_1 += "maxMembers = " + this.maxMembers + " ";
         _local_1 += "memberClan = " + this.memberClan + " ";
         _local_1 += "minRankForAddClan = " + this.minRankForAddClan + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "reasonForBlocking = " + this.reasonForBlocking + " ";
         _local_1 += "requestInIncoming = " + this.requestInIncoming + " ";
         _local_1 += "requestInOutgoing = " + this.requestInOutgoing + " ";
         _local_1 += "tag = " + this.tag + " ";
         _local_1 += "timeBlocking = " + this.timeBlocking + " ";
         _local_1 += "users = " + this.users + " ";
         return _local_1 + "]";
      }
   }
}

