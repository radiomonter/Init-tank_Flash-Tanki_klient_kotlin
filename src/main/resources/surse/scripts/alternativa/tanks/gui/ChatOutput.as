package alternativa.tanks.gui
{
   import fl.containers.ScrollPane;
   import fl.controls.ScrollPolicy;
   import flash.display.Sprite;
   import projects.tanks.client.chat.types.UserStatus;
   
   public class ChatOutput extends ScrollPane
   {
      
      private const numMessages:int = 80;
      
      public var firstFill:Boolean = true;
      
      public var deltaWidth:int = 9;
      
      public var selfName:String;
      
      private var _cont:Sprite = new Sprite();
      
      private var __width:Number;
      
      private var oldLine:ChatOutputLine;
      
      private var _showIPMode:Boolean = false;
      
      public function ChatOutput()
      {
         super();
         this.source = this._cont;
         this.horizontalScrollPolicy = ScrollPolicy.OFF;
         this.focusEnabled = false;
      }
      
      public function addLine(_arg_1:UserStatus, _arg_2:UserStatus, _arg_3:String, _arg_4:Boolean = false, _arg_5:Boolean = false) : void
      {
         var _local_7:Boolean = false;
         var _local_6:ChatOutputLine = null;
         _local_7 = this.verticalScrollPosition + 5 > this.maxVerticalScrollPosition || this.firstFill;
         if(this._cont.numChildren > this.numMessages)
         {
            this.shiftMessages();
            this.oldLine = null;
            _local_6 = new ChatOutputLine(this.__width,_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         }
         else
         {
            _local_6 = new ChatOutputLine(this.__width,_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         }
         _local_6.showIP = this._showIPMode;
         var _local_8:int = int(this._cont.height + 0.5);
         _local_6.self = _local_6.userNameTo == this.selfName;
         _local_6.y = _local_8;
         this._cont.addChild(_local_6);
         this.update();
         if(_local_7)
         {
            this.verticalScrollPosition = this.maxVerticalScrollPosition;
         }
      }
      
      public function scrollDown() : void
      {
         this.verticalScrollPosition = this.maxVerticalScrollPosition;
      }
      
      public function selectUser(_arg_1:String, _arg_2:Boolean = false) : void
      {
         var _local_3:ChatOutputLine = null;
         var _local_4:int = !_arg_2 ? int(0) : int(this._cont.numChildren - 1);
         while(_local_4 < this._cont.numChildren)
         {
            _local_3 = this._cont.getChildAt(_local_4) as ChatOutputLine;
            _local_3.light = _local_3.userName == _arg_1;
            _local_3.self = _local_3.userNameTo == this.selfName;
            _local_4++;
         }
      }
      
      private function shiftMessages() : void
      {
         var _local_2:int = 0;
         this.oldLine = this._cont.getChildAt(0) as ChatOutputLine;
         var _local_1:Number = this.oldLine.height + this.oldLine.y;
         this._cont.removeChild(this.oldLine);
         while(_local_2 < this._cont.numChildren)
         {
            this._cont.getChildAt(_local_2).y = this._cont.getChildAt(_local_2).y - _local_1;
            _local_2++;
         }
      }
      
      override public function setSize(_arg_1:Number, _arg_2:Number) : void
      {
         super.setSize(_arg_1,_arg_2);
         this.__width = _arg_1 - this.deltaWidth;
         this.resizeLines();
      }
      
      private function resizeLines() : void
      {
         var _local_1:ChatOutputLine = null;
         var _local_2:int = 0;
         var _local_4:int = 0;
         var _local_3:Array = new Array();
         var _local_5:* = this._cont.numChildren > 0;
         while(this._cont.numChildren > 0)
         {
            _local_1 = this._cont.getChildAt(_local_2) as ChatOutputLine;
            _local_1.showIP = this._showIPMode;
            _local_1.width = this.__width;
            _local_3.push(_local_1);
            this._cont.removeChildAt(0);
         }
         _local_2 = 0;
         while(_local_2 < _local_3.length)
         {
            _local_1 = _local_3[_local_2];
            _local_4 = int(this._cont.height + 0.5);
            _local_1.y = _local_4;
            this._cont.addChild(_local_1);
            _local_2++;
         }
         if(Boolean(_local_5))
         {
            this.update();
         }
      }
      
      public function clear() : void
      {
         var _local_1:ChatOutputLine = null;
         var _local_3:int = 0;
         var _local_2:Array = new Array();
         while(_local_3 < this._cont.numChildren)
         {
            _local_1 = this._cont.getChildAt(_local_3) as ChatOutputLine;
            _local_2.push(_local_1);
            _local_3++;
         }
         _local_3 = 0;
         while(_local_3 < _local_2.length)
         {
            this._cont.removeChild(_local_2[_local_3]);
            _local_3++;
         }
         this.resizeLines();
      }
      
      public function cleanOutUsersMessages(_arg_1:String) : void
      {
         var _local_2:ChatOutputLine = null;
         var _local_4:int = 0;
         var _local_3:Array = new Array();
         while(_local_4 < this._cont.numChildren)
         {
            _local_2 = this._cont.getChildAt(_local_4) as ChatOutputLine;
            if(_local_2.userName == _arg_1 && !_local_2.system)
            {
               _local_3.push(_local_2);
            }
            _local_4++;
         }
         _local_4 = 0;
         while(_local_4 < _local_3.length)
         {
            this._cont.removeChild(_local_3[_local_4]);
            _local_4++;
         }
         this.resizeLines();
      }
      
      public function set showIPMode(_arg_1:Boolean) : void
      {
         this._showIPMode = _arg_1;
         this.resizeLines();
      }
   }
}

