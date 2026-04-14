package projects.tanks.client.clans.clan.info
{
   import alternativa.types.Long;
   
   public class ClanInfoCC
   {
      
      private var _blocked:Boolean;
      
      private var _createTime:String;
      
      private var _creatorId:String;
      
      private var _description:String;
      
      private var _flagId:Long;
      
      private var _incomingRequestEnabled:Boolean;
      
      private var _maxCharactersDescription:int;
      
      private var _maxMembers:int;
      
      private var _minRankForAddClan:int;
      
      private var _name:String;
      
      private var _reasonForBlocking:String;
      
      private var _self:Boolean;
      
      private var _tag:String;
      
      private var _timeBlocking:Long;
      
      private var _users:Vector.<String>;
      
      public function ClanInfoCC(_arg_1:Boolean = false, _arg_2:String = null, _arg_3:String = null, _arg_4:String = null, _arg_5:Long = null, _arg_6:Boolean = false, _arg_7:int = 0, _arg_8:int = 0, _arg_9:int = 0, _arg_10:String = null, _arg_11:String = null, _arg_12:Boolean = false, _arg_13:String = null, _arg_14:Long = null, _arg_15:Vector.<String> = null)
      {
         super();
         this._blocked = _arg_1;
         this._createTime = _arg_2;
         this._creatorId = _arg_3;
         this._description = _arg_4;
         this._flagId = _arg_5;
         this._incomingRequestEnabled = _arg_6;
         this._maxCharactersDescription = _arg_7;
         this._maxMembers = _arg_8;
         this._minRankForAddClan = _arg_9;
         this._name = _arg_10;
         this._reasonForBlocking = _arg_11;
         this._self = _arg_12;
         this._tag = _arg_13;
         this._timeBlocking = _arg_14;
         this._users = _arg_15;
      }
      
      public function get blocked() : Boolean
      {
         return this._blocked;
      }
      
      public function set blocked(_arg_1:Boolean) : void
      {
         this._blocked = _arg_1;
      }
      
      public function get createTime() : String
      {
         return this._createTime;
      }
      
      public function set createTime(_arg_1:String) : void
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
      
      public function get maxCharactersDescription() : int
      {
         return this._maxCharactersDescription;
      }
      
      public function set maxCharactersDescription(_arg_1:int) : void
      {
         this._maxCharactersDescription = _arg_1;
      }
      
      public function get maxMembers() : int
      {
         return this._maxMembers;
      }
      
      public function set maxMembers(_arg_1:int) : void
      {
         this._maxMembers = _arg_1;
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
      
      public function get self() : Boolean
      {
         return this._self;
      }
      
      public function set self(_arg_1:Boolean) : void
      {
         this._self = _arg_1;
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
      
      public function get users() : Vector.<String>
      {
         return this._users;
      }
      
      public function set users(_arg_1:Vector.<String>) : void
      {
         this._users = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanInfoCC [";
         _local_1 += "blocked = " + this.blocked + " ";
         _local_1 += "createTime = " + this.createTime + " ";
         _local_1 += "creatorId = " + this.creatorId + " ";
         _local_1 += "description = " + this.description + " ";
         _local_1 += "flagId = " + this.flagId + " ";
         _local_1 += "incomingRequestEnabled = " + this.incomingRequestEnabled + " ";
         _local_1 += "maxCharactersDescription = " + this.maxCharactersDescription + " ";
         _local_1 += "maxMembers = " + this.maxMembers + " ";
         _local_1 += "minRankForAddClan = " + this.minRankForAddClan + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "reasonForBlocking = " + this.reasonForBlocking + " ";
         _local_1 += "self = " + this.self + " ";
         _local_1 += "tag = " + this.tag + " ";
         _local_1 += "timeBlocking = " + this.timeBlocking + " ";
         _local_1 += "users = " + this.users + " ";
         return _local_1 + "]";
      }
   }
}

