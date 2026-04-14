package controls
{
   import assets.icons.CheckIcons;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.GridFitType;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol81")]
   public class TankCheckBox extends MovieClip
   {
      
      public static const FRIENDLY_FIRE:int = 1;
      
      public static const INVITE_ONLY:int = 2;
      
      public static const AUTO_BALANCE:int = 3;
      
      public static const CHECK_SIGN:int = 4;
      
      public static const CAPTURE_THE_FLAG:int = 5;
      
      public static const PAY:int = 6;
      
      public static const INVENTORY:int = 7;
      
      public var _typeIcon:CheckIcons;
      
      private var typeChek:CheckIcons;
      
      private var _type:int;
      
      private var _checked:Boolean = false;
      
      private var _label:Label;
      
      private var _enable:Boolean = true;
      
      public function TankCheckBox()
      {
         super();
         this.typeChek = getChildByName("_typeIcon") as CheckIcons;
         this.type = CHECK_SIGN;
         tabEnabled = false;
         this.changeState();
         gotoAndStop(1);
         this.enable = true;
         this._label = new Label();
         this._label.x = 29;
         this._label.y = 7;
         this._label.gridFitType = GridFitType.SUBPIXEL;
         addChild(this._label);
      }
      
      public function get checked() : Boolean
      {
         return this._checked;
      }
      
      public function set checked(param1:Boolean) : void
      {
         this._checked = param1;
         this.changeState();
      }
      
      public function set enable(param1:Boolean) : void
      {
         this._enable = param1;
         if(this._enable)
         {
            this.addListeners();
         }
         else
         {
            this.removeListeners();
         }
      }
      
      public function set label(param1:String) : void
      {
         this._label.text = param1;
      }
      
      private function addListeners() : void
      {
         gotoAndStop(1);
         buttonMode = true;
         mouseEnabled = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function removeListeners() : void
      {
         gotoAndStop(4);
         buttonMode = false;
         mouseEnabled = false;
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
         this.typeChek.type = this._type;
      }
      
      private function onMouseEvent(param1:MouseEvent) : void
      {
         switch(param1.type)
         {
            case MouseEvent.MOUSE_OVER:
               gotoAndStop(2);
               this.typeChek.y = 0;
               break;
            case MouseEvent.MOUSE_OUT:
               gotoAndStop(1);
               this.typeChek.y = 0;
               break;
            case MouseEvent.MOUSE_DOWN:
               gotoAndStop(3);
               this.typeChek.y = 1;
               break;
            case MouseEvent.MOUSE_UP:
               gotoAndStop(2);
               this._checked = !this._checked;
               this.changeState();
               this.typeChek.y = 0;
         }
      }
      
      private function changeState() : void
      {
         this.typeChek.visible = this._checked;
      }
   }
}

