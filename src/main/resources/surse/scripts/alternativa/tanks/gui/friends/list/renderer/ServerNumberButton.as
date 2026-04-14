package alternativa.tanks.gui.friends.list.renderer
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.external.ExternalInterface;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   import forms.ColorConstants;
   
   public class ServerNumberButton extends Sprite
   {
      
      private static const WIDTH:int = 25;
      
      private var _serverNumberLabel:LabelBase;
      
      public function ServerNumberButton()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,WIDTH,FriendsAcceptedListRenderer.ROW_HEIGHT);
         graphics.endFill();
         this._serverNumberLabel = new LabelBase();
         this._serverNumberLabel.mouseEnabled = false;
         this._serverNumberLabel.autoSize = TextFieldAutoSize.NONE;
         this._serverNumberLabel.align = TextFormatAlign.RIGHT;
         this._serverNumberLabel.color = ColorConstants.GREEN_LABEL;
         this._serverNumberLabel.width = WIDTH;
         this._serverNumberLabel.height = 18;
         addChild(this._serverNumberLabel);
      }
      
      public function setText(_arg_1:String, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this._serverNumberLabel.text = _arg_1;
            this._serverNumberLabel.y = 0;
         }
         else
         {
            this._serverNumberLabel.y = -1;
            this._serverNumberLabel.htmlText = "<u>" + _arg_1 + "</u>";
         }
         if(ExternalInterface.available)
         {
            this.selected = _arg_2;
         }
         else
         {
            this.selected = true;
         }
      }
      
      public function set selected(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            buttonMode = useHandCursor = false;
            mouseChildren = false;
            mouseEnabled = false;
         }
         else
         {
            buttonMode = useHandCursor = true;
            mouseChildren = true;
            mouseEnabled = true;
         }
      }
   }
}

