package alternativa.tanks.models.battle.gui.chat
{
   import controls.Label;
   import obfuscation.pawikoz.Fojuhe;
   
   public class Cymuryful extends Fojuhe
   {
      
      private var output:Label = new Label();
      
      public function Cymuryful(_arg_1:int, _arg_2:String)
      {
         super();
         this.output.color = 8454016;
         this.output.multiline = true;
         this.output.wordWrap = true;
         this.output.mouseEnabled = false;
         this.output.text = _arg_2;
         shadowContainer.addChild(this.output);
         this.width = _arg_1;
      }
      
      [Obfuscation(rename="false")]
      override public function set width(_arg_1:Number) : void
      {
         this.output.width = int(_arg_1) - 5;
      }
   }
}

