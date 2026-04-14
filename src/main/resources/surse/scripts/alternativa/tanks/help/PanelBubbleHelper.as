package alternativa.tanks.help
{
   public class PanelBubbleHelper extends BubbleHelper
   {
      
      private var A:Number;
      
      private var B:Number;
      
      private var C:Number;
      
      public function PanelBubbleHelper(_arg_1:Number, _arg_2:Number, _arg_3:Number)
      {
         super();
         this.A = _arg_1;
         this.B = _arg_2;
         this.C = _arg_3;
         _showLimit = 3;
         _targetPoint.y = 25;
      }
      
      override public function align(_arg_1:int, _arg_2:int) : void
      {
         if(_arg_1 < 1000)
         {
            _arg_1 = 1000;
         }
         _targetPoint.x = int(this.A * (_arg_1 - this.B) + this.C);
         doAlign();
      }
   }
}

