package alternativa.tanks.models.battle.gui.chat
{
   import controls.Label;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import obfuscation.mujusaqim.MessageColor;
   
   public class Qijinif extends Sprite
   {
      
      private var label:Label;
      
      public function Qijinif()
      {
         super();
         this.label = new Label();
         this.label.color = MessageColor.YELLOW;
         this.label.autoSize = TextFieldAutoSize.LEFT;
         this.label.multiline = true;
         this.label.wordWrap = true;
         this.label.mouseEnabled = false;
         addChild(this.label);
      }
      
      public function setText(_arg_1:String) : void
      {
         this.label.text = _arg_1;
      }
      
      public function telusedy(_arg_1:Number) : void
      {
         this.label.width = _arg_1;
      }
      
      public function getText() : String
      {
         return this.label.text;
      }
   }
}

