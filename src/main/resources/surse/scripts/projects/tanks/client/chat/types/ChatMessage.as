package projects.tanks.client.chat.types
{
   public class ChatMessage
   {
      
      private var _links:SetOfString;
      
      private var _sourceUserStatus:UserStatus;
      
      private var _system:Boolean;
      
      private var _targetUserStatus:UserStatus;
      
      private var _text:String;
      
      private var _warning:Boolean;
      
      private var _premium:Boolean;
      
      public function ChatMessage(_arg_1:SetOfString = null, _arg_2:UserStatus = null, _arg_3:Boolean = false, _arg_4:UserStatus = null, _arg_5:String = null, _arg_6:Boolean = false, _arg_7:Boolean = false)
      {
         super();
         this._links = _arg_1;
         this._sourceUserStatus = _arg_2;
         this._system = _arg_3;
         this._targetUserStatus = _arg_4;
         this._text = _arg_5;
         this._warning = _arg_6;
         this._premium = _arg_7;
      }
      
      public function get links() : SetOfString
      {
         return this._links;
      }
      
      public function set links(_arg_1:SetOfString) : void
      {
         this._links = _arg_1;
      }
      
      public function get sourceUserStatus() : UserStatus
      {
         return this._sourceUserStatus;
      }
      
      public function set sourceUserStatus(_arg_1:UserStatus) : void
      {
         this._sourceUserStatus = _arg_1;
      }
      
      public function get system() : Boolean
      {
         return this._system;
      }
      
      public function set system(_arg_1:Boolean) : void
      {
         this._system = _arg_1;
      }
      
      public function get targetUserStatus() : UserStatus
      {
         return this._targetUserStatus;
      }
      
      public function set targetUserStatus(_arg_1:UserStatus) : void
      {
         this._targetUserStatus = _arg_1;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function set text(_arg_1:String) : void
      {
         this._text = _arg_1;
      }
      
      public function get warning() : Boolean
      {
         return this._warning;
      }
      
      public function set warning(_arg_1:Boolean) : void
      {
         this._warning = _arg_1;
      }
      
      public function get premium() : Boolean
      {
         return this._premium;
      }
      
      public function set premium(_arg_1:Boolean) : void
      {
         this._premium = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ChatMessage [";
         _local_1 += "links = " + this.links + " ";
         _local_1 += "sourceUserStatus = " + this.sourceUserStatus + " ";
         _local_1 += "system = " + this.system + " ";
         _local_1 += "targetUserStatus = " + this.targetUserStatus + " ";
         _local_1 += "text = " + this.text + " ";
         _local_1 += "warning = " + this.warning + " ";
         _local_1 += "premium = " + this.premium + " ";
         return _local_1 + "]";
      }
   }
}

