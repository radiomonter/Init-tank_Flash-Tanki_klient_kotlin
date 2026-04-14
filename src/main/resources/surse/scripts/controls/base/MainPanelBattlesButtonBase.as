package controls.base
{
   import flash.events.MouseEvent;
   import flash.text.TextFieldAutoSize;
   
   public class MainPanelBattlesButtonBase extends MainPanelBattlesButton
   {
      
      private static const LABEL_POSITION_Y:int = 4;
      
      private var _labelBase:LabelBase;
      
      public function MainPanelBattlesButtonBase()
      {
         super();
         this._labelBase = new LabelBase();
         this._labelBase.x = 18;
         this._labelBase.y = LABEL_POSITION_Y;
         this._labelBase.width = this.width - 18;
         this._labelBase.autoSize = TextFieldAutoSize.CENTER;
         this._labelBase.mouseEnabled = false;
         addChild(this._labelBase);
      }
      
      override public function set label(_arg_1:String) : void
      {
         this._labelBase.text = _arg_1;
      }
      
      override protected function onMouseEvent(_arg_1:MouseEvent) : void
      {
         super.onMouseEvent(_arg_1);
         var _local_2:int = _arg_1.type == MouseEvent.MOUSE_DOWN ? 1 : 0;
         this._labelBase.y = LABEL_POSITION_Y + _local_2;
      }
   }
}

