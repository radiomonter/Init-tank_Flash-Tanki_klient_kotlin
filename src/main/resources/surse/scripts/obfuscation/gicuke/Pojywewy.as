package obfuscation.gicuke
{
   import controls.Label;
   import controls.statassets.BlackRoundRect;
   
   public class Pojywewy extends BlackRoundRect
   {
      
      private static const dufusut:int = 18;
      
      private static const PADDING:int = 3;
      
      private var label:Label;
      
      public function Pojywewy(_arg_1:String)
      {
         super();
         this.label = new Label();
         this.label.size = dufusut;
         this.label.text = _arg_1;
         addChild(this.label);
         this.label.y = PADDING;
         height = 2 * PADDING + this.label.height;
      }
      
      [Obfuscation(rename="false")]
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this.label.x = int(width - this.label.width) >> 1;
      }
   }
}

