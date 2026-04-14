package alternativa.tanks.gui
{
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import controls.statassets.StatLineBase;
   import controls.statassets.StatLineHeader;
   import controls.statassets.StatLineNormal;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import forms.userlabel.LobbyChatUserLabel;
   import projects.tanks.client.chat.types.UserStatus;
   
   public class ChatOutputLine extends Sprite
   {
      
      private static const SYSTEM_COLOR:uint = 8454016;
      
      private static const UID_COLOR_WITHOUT_LIGHT:uint = 1244928;
      
      private static const UID_COLOR_WITH_LIGHT:uint = 5898034;
      
      private var _output:LabelBase;
      
      private var _userName:String;
      
      private var _userNameTo:String;
      
      private var _sourceUserLabel:LobbyChatUserLabel;
      
      private var _targetUserLabel:LobbyChatUserLabel;
      
      private var _arrowLabel:LabelBase;
      
      private var _light:Boolean = false;
      
      private var _self:Boolean = false;
      
      private var _namesWidth:int = 0;
      
      private var _system:Boolean = false;
      
      private var _showIP:Boolean;
      
      private var _sourceUserIP:String;
      
      private var _width:int;
      
      private var _background:Bitmap;
      
      public function ChatOutputLine(_arg_1:int, _arg_2:UserStatus, _arg_3:UserStatus, _arg_4:String, _arg_5:Boolean = false, _arg_6:Boolean = false)
      {
         super();
         this._width = _arg_1;
         this._sourceUserIP = _arg_2.ip;
         this._system = _arg_5;
         mouseEnabled = false;
         this._background = new Bitmap();
         addChild(this._background);
         if(_arg_2.userId != null)
         {
            this._userName = _arg_2.uid;
            this._sourceUserLabel = new LobbyChatUserLabel(_arg_2.userId,_arg_2.uid,_arg_2.rankIndex,_arg_2.chatModeratorLevel);
            this._sourceUserLabel.premium = _arg_2.premium;
            addChild(this._sourceUserLabel);
            this._sourceUserLabel.setUidColor(UID_COLOR_WITHOUT_LIGHT);
            this.updateSourceUserLabel(_arg_3.userId == null);
         }
         if(_arg_3.userId != null)
         {
            this._userNameTo = _arg_3.uid;
            this._targetUserLabel = new LobbyChatUserLabel(_arg_3.userId,_arg_3.uid,_arg_3.rankIndex,_arg_3.chatModeratorLevel);
            this._targetUserLabel.premium = _arg_3.premium;
            addChild(this._targetUserLabel);
            this._targetUserLabel.setUidColor(UID_COLOR_WITHOUT_LIGHT);
            this._arrowLabel = new LabelBase();
            addChild(this._arrowLabel);
            this._arrowLabel.text = "→";
            this._arrowLabel.color = UID_COLOR_WITHOUT_LIGHT;
            this.updateTargetUserLabel();
         }
         this._output = new LabelBase();
         this._output.color = !this._system ? uint(16777215) : uint(SYSTEM_COLOR);
         this._output.multiline = true;
         this._output.wordWrap = true;
         this._output.selectable = true;
         addChild(this._output);
         if(this._namesWidth > this._width / 2)
         {
            this._output.y = 15;
            this._output.x = 0;
            this._output.width = this._width - 5;
         }
         else
         {
            this._output.x = this._namesWidth + 3;
            this._output.y = 0;
            this._output.width = this._width - this._namesWidth - 8;
         }
         if(_arg_6)
         {
            this._output.htmlText = _arg_4;
         }
         else
         {
            this._output.text = _arg_4;
         }
      }
      
      private function updateSourceUserLabel(_arg_1:Boolean) : void
      {
         var _local_2:* = "";
         if(this._sourceUserIP != "" && !this._system && this._showIP)
         {
            _local_2 += " (" + this._sourceUserIP + ")";
         }
         else
         {
            this._sourceUserLabel.setAdditionalText("");
         }
         if(_arg_1)
         {
            _local_2 += ":";
         }
         if(_local_2.length != 0)
         {
            this._sourceUserLabel.setAdditionalText(_local_2);
         }
         if(_arg_1)
         {
            this._namesWidth = this._sourceUserLabel.width + 2;
         }
         else
         {
            this._namesWidth = this._sourceUserLabel.width + 6;
         }
      }
      
      private function updateTargetUserLabel() : void
      {
         this._targetUserLabel.setAdditionalText(":");
         this._targetUserLabel.x = this._sourceUserLabel.x + this._sourceUserLabel.width + 14;
         this._namesWidth += this._targetUserLabel.width + 11;
         this._arrowLabel.x = this._sourceUserLabel.x + this._sourceUserLabel.width - 1;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         var _local_2:StatLineBase = null;
         var _local_3:BitmapData = null;
         var _local_4:int = 0;
         this._width = int(_arg_1);
         if(this._namesWidth > this._width / 2 && this._output.text.length * 8 > this._width - this._namesWidth)
         {
            this._output.y = 19;
            this._output.x = 0;
            this._output.width = this._width - 5;
            _local_4 = 21;
         }
         else
         {
            this._output.x = this._namesWidth;
            this._output.y = 0;
            this._output.width = this._width - this._namesWidth - 5;
            this._output.height = 20;
         }
         this._background.bitmapData = new BitmapData(1,Math.max(int(this._output.textHeight + 7.5 + _local_4),19),true,0);
         _local_2 = !this._self ? new StatLineNormal() : new StatLineHeader();
         if(this._light || this._self)
         {
            _local_2.width = this._width;
            _local_2.height = Math.max(int(this._output.textHeight + 5.5 + _local_4),19);
            _local_2.y = 2;
            _local_2.graphics.beginFill(0,0);
            _local_2.graphics.drawRect(0,0,2,2);
            _local_2.graphics.endFill();
            _local_3 = new BitmapData(_local_2.width,_local_2.height + 2,true,0);
            _local_3.draw(_local_2);
            this._background.bitmapData = _local_3;
         }
      }
      
      public function set light(_arg_1:Boolean) : void
      {
         var _local_2:uint = 0;
         if(this._system)
         {
            return;
         }
         this._light = _arg_1;
         if(this._light)
         {
            _local_2 = UID_COLOR_WITH_LIGHT;
         }
         else
         {
            _local_2 = UID_COLOR_WITHOUT_LIGHT;
         }
         if(this._sourceUserLabel != null)
         {
            this._sourceUserLabel.setUidColor(_local_2);
         }
         if(this._targetUserLabel != null)
         {
            this._targetUserLabel.setUidColor(_local_2);
            this._arrowLabel.color = _local_2;
         }
         this.width = this._width;
      }
      
      public function set self(_arg_1:Boolean) : void
      {
         var _local_2:uint = 0;
         var _local_3:uint = 0;
         if(this._system)
         {
            return;
         }
         this._self = _arg_1;
         if(this._self)
         {
            _local_3 = TankWindowInner.GREEN;
            _local_2 = TankWindowInner.GREEN;
         }
         else
         {
            _local_2 = UID_COLOR_WITHOUT_LIGHT;
            _local_3 = !this._system ? uint(16777215) : uint(SYSTEM_COLOR);
         }
         if(this._sourceUserLabel != null)
         {
            this._sourceUserLabel.setUidColor(_local_2,this._self);
         }
         if(this._targetUserLabel != null)
         {
            this._targetUserLabel.setUidColor(_local_2);
            this._arrowLabel.color = _local_2;
         }
         this._output.color = _local_3;
         this.width = this._width;
      }
      
      public function set showIP(_arg_1:Boolean) : void
      {
         this._showIP = _arg_1;
         if(this._sourceUserLabel != null)
         {
            this.updateSourceUserLabel(this._targetUserLabel == null);
         }
         if(this._targetUserLabel != null)
         {
            this.updateTargetUserLabel();
         }
         this.width = this._width;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get system() : Boolean
      {
         return this._system;
      }
      
      public function get userNameTo() : String
      {
         return this._userNameTo;
      }
   }
}

