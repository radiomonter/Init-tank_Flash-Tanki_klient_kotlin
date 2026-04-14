package projects.tanks.client.chat.models.chat.chat
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class ChatCC
   {
      
      private var _admin:Boolean;
      
      private var _antifloodEnabled:Boolean;
      
      private var _bufferSize:int;
      
      private var _channels:Vector.<String>;
      
      private var _chatEnabled:Boolean;
      
      private var _chatModeratorLevel:ChatModeratorLevel;
      
      private var _linksWhiteList:Vector.<String>;
      
      private var _minChar:int;
      
      private var _minWord:int;
      
      private var _privateMessagesEnabled:Boolean;
      
      private var _selfName:String;
      
      private var _showLinks:Boolean;
      
      private var _typingSpeedAntifloodEnabled:Boolean;
      
      private var _symbolCost:int;
      
      private var _enterCost:int;
      
      public function ChatCC(_arg_1:Boolean = false, _arg_2:Boolean = false, _arg_3:int = 0, _arg_4:Vector.<String> = null, _arg_5:Boolean = false, _arg_6:ChatModeratorLevel = null, _arg_7:Vector.<String> = null, _arg_8:int = 0, _arg_9:int = 0, _arg_10:Boolean = false, _arg_11:String = null, _arg_12:Boolean = false, _arg_13:Boolean = false, _arg_14:int = 0, _arg_15:int = 0)
      {
         super();
         this._admin = _arg_1;
         this._antifloodEnabled = _arg_2;
         this._bufferSize = _arg_3;
         this._channels = _arg_4;
         this._chatEnabled = _arg_5;
         this._chatModeratorLevel = _arg_6;
         this._linksWhiteList = _arg_7;
         this._minChar = _arg_8;
         this._minWord = _arg_9;
         this._privateMessagesEnabled = _arg_10;
         this._selfName = _arg_11;
         this._showLinks = _arg_12;
         this._typingSpeedAntifloodEnabled = _arg_13;
         this._symbolCost = _arg_14;
         this._enterCost = _arg_15;
      }
      
      public function get admin() : Boolean
      {
         return this._admin;
      }
      
      public function set admin(_arg_1:Boolean) : void
      {
         this._admin = _arg_1;
      }
      
      public function get antifloodEnabled() : Boolean
      {
         return this._antifloodEnabled;
      }
      
      public function set antifloodEnabled(_arg_1:Boolean) : void
      {
         this._antifloodEnabled = _arg_1;
      }
      
      public function get bufferSize() : int
      {
         return this._bufferSize;
      }
      
      public function set bufferSize(_arg_1:int) : void
      {
         this._bufferSize = _arg_1;
      }
      
      public function get channels() : Vector.<String>
      {
         return this._channels;
      }
      
      public function set channels(_arg_1:Vector.<String>) : void
      {
         this._channels = _arg_1;
      }
      
      public function get chatEnabled() : Boolean
      {
         return this._chatEnabled;
      }
      
      public function set chatEnabled(_arg_1:Boolean) : void
      {
         this._chatEnabled = _arg_1;
      }
      
      public function get chatModeratorLevel() : ChatModeratorLevel
      {
         return this._chatModeratorLevel;
      }
      
      public function set chatModeratorLevel(_arg_1:ChatModeratorLevel) : void
      {
         this._chatModeratorLevel = _arg_1;
      }
      
      public function get linksWhiteList() : Vector.<String>
      {
         return this._linksWhiteList;
      }
      
      public function set linksWhiteList(_arg_1:Vector.<String>) : void
      {
         this._linksWhiteList = _arg_1;
      }
      
      public function get minChar() : int
      {
         return this._minChar;
      }
      
      public function set minChar(_arg_1:int) : void
      {
         this._minChar = _arg_1;
      }
      
      public function get minWord() : int
      {
         return this._minWord;
      }
      
      public function set minWord(_arg_1:int) : void
      {
         this._minWord = _arg_1;
      }
      
      public function get privateMessagesEnabled() : Boolean
      {
         return this._privateMessagesEnabled;
      }
      
      public function set privateMessagesEnabled(_arg_1:Boolean) : void
      {
         this._privateMessagesEnabled = _arg_1;
      }
      
      public function get selfName() : String
      {
         return this._selfName;
      }
      
      public function set selfName(_arg_1:String) : void
      {
         this._selfName = _arg_1;
      }
      
      public function get showLinks() : Boolean
      {
         return this._showLinks;
      }
      
      public function set showLinks(_arg_1:Boolean) : void
      {
         this._showLinks = _arg_1;
      }
      
      public function get typingSpeedAntifloodEnabled() : Boolean
      {
         return this._typingSpeedAntifloodEnabled;
      }
      
      public function set typingSpeedAntifloodEnabled(_arg_1:Boolean) : void
      {
         this._typingSpeedAntifloodEnabled = _arg_1;
      }
      
      public function get symbolCost() : int
      {
         return this._symbolCost;
      }
      
      public function set symbolCost(_arg_1:int) : void
      {
         this._symbolCost = _arg_1;
      }
      
      public function get enterCost() : int
      {
         return this._enterCost;
      }
      
      public function set enterCost(_arg_1:int) : void
      {
         this._enterCost = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ChatCC [";
         _local_1 += "admin = " + this.admin + " ";
         _local_1 += "antifloodEnabled = " + this.antifloodEnabled + " ";
         _local_1 += "bufferSize = " + this.bufferSize + " ";
         _local_1 += "channels = " + this.channels + " ";
         _local_1 += "chatEnabled = " + this.chatEnabled + " ";
         _local_1 += "chatModeratorLevel = " + this.chatModeratorLevel + " ";
         _local_1 += "linksWhiteList = " + this.linksWhiteList + " ";
         _local_1 += "minChar = " + this.minChar + " ";
         _local_1 += "minWord = " + this.minWord + " ";
         _local_1 += "privateMessagesEnabled = " + this.privateMessagesEnabled + " ";
         _local_1 += "selfName = " + this.selfName + " ";
         _local_1 += "showLinks = " + this.showLinks + " ";
         _local_1 += "typingSpeedAntifloodEnabled = " + this.typingSpeedAntifloodEnabled + " ";
         _local_1 += "symbolCost = " + this.symbolCost + " ";
         _local_1 += "enterCost = " + this.enterCost + " ";
         return _local_1 + "]";
      }
   }
}

