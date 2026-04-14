package alternativa.tanks.gui.friends
{
   import controls.base.ColorButtonBase;
   import controls.friends.RequestCountIndicator;
   import flash.events.MouseEvent;
   
   public class FriendStateButton extends ColorButtonBase
   {
      
      private static const ButtonCenter:Class = FriendStateButton_ButtonCenter;
      
      private static const ButtonLeft:Class = FriendStateButton_ButtonLeft;
      
      private static const ButtonRight:Class = FriendStateButton_ButtonRight;
      
      private static const ButtonOverCenter:Class = FriendStateButton_ButtonOverCenter;
      
      private static const ButtonOverLeft:Class = FriendStateButton_ButtonOverLeft;
      
      private static const ButtonOverRight:Class = FriendStateButton_ButtonOverRight;
      
      private static const ButtonDownCenter:Class = FriendStateButton_ButtonDownCenter;
      
      private static const ButtonDownLeft:Class = FriendStateButton_ButtonDownLeft;
      
      private static const ButtonDownRight:Class = FriendStateButton_ButtonDownRight;
      
      private static const LABEL_MARGIN:int = 26;
      
      private var _type:FriendsWindowState;
      
      private var _requestCounter:RequestCountIndicator;
      
      public function FriendStateButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.setStyle();
         this._requestCounter = new RequestCountIndicator();
         addChild(this._requestCounter);
         this._requestCounter.y = -6;
      }
      
      override public function setStyle(_arg_1:String = "def") : void
      {
         stateUP.bmpLeft = new ButtonLeft().bitmapData;
         stateUP.bmpCenter = new ButtonCenter().bitmapData;
         stateUP.bmpRight = new ButtonRight().bitmapData;
         stateOVER.bmpLeft = new ButtonOverLeft().bitmapData;
         stateOVER.bmpCenter = new ButtonOverCenter().bitmapData;
         stateOVER.bmpRight = new ButtonOverRight().bitmapData;
         stateDOWN.bmpLeft = new ButtonDownLeft().bitmapData;
         stateDOWN.bmpCenter = new ButtonDownCenter().bitmapData;
         stateDOWN.bmpRight = new ButtonDownRight().bitmapData;
         stateOFF.bmpLeft = new ButtonDownLeft().bitmapData;
         stateOFF.bmpCenter = new ButtonDownCenter().bitmapData;
         stateOFF.bmpRight = new ButtonDownRight().bitmapData;
      }
      
      public function get type() : FriendsWindowState
      {
         return this._type;
      }
      
      public function set type(_arg_1:FriendsWindowState) : void
      {
         this._type = _arg_1;
      }
      
      override protected function onMouseEvent(_arg_1:MouseEvent) : void
      {
         if(enable)
         {
            switch(_arg_1.type)
            {
               case MouseEvent.MOUSE_OVER:
                  this.setState(2);
                  return;
               case MouseEvent.MOUSE_OUT:
                  this.setState(1);
                  return;
               case MouseEvent.MOUSE_DOWN:
                  this.setState(3);
                  return;
               case MouseEvent.MOUSE_UP:
                  this.setState(1);
            }
         }
      }
      
      override protected function setState(_arg_1:int = 0) : void
      {
         switch(_arg_1)
         {
            case 0:
               stateOFF.alpha = 1;
               stateUP.alpha = 0;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 0;
               _label.y = 7;
               return;
            case 1:
               stateOFF.alpha = 0;
               stateUP.alpha = 1;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 0;
               _label.y = 6;
               return;
            case 2:
               stateOFF.alpha = 0;
               stateUP.alpha = 0;
               stateOVER.alpha = 1;
               stateDOWN.alpha = 0;
               _label.y = 6;
               return;
            case 3:
               stateOFF.alpha = 0;
               stateUP.alpha = 0;
               stateOVER.alpha = 0;
               stateDOWN.alpha = 1;
               _label.y = 7;
         }
      }
      
      override public function set width(_arg_1:Number) : void
      {
         var _local_2:int = Math.ceil(_label.textWidth) + LABEL_MARGIN;
         if(_local_2 > _arg_1)
         {
            super.width = _local_2;
         }
         else
         {
            super.width = _arg_1;
         }
         this._requestCounter.x = _width + 3;
      }
      
      override public function get width() : Number
      {
         return _width;
      }
      
      public function setRequestCount(_arg_1:int, _arg_2:int) : void
      {
         this._requestCounter.setRequestCount(_arg_1,_arg_2);
      }
      
      public function set currentRequestCount(_arg_1:int) : void
      {
         this._requestCounter.currentCount = _arg_1;
      }
      
      public function set newRequestCount(_arg_1:int) : void
      {
         this._requestCounter.newCount = _arg_1;
      }
   }
}

