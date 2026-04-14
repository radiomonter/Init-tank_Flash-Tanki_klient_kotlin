package alternativa.tanks.models.weapon.shaft
{
   public class Dodaly
   {
      
      private var a:Number;
      
      private var b:Number;
      
      public function Dodaly(_arg_1:Number = 0, _arg_2:Number = 1)
      {
         super();
         this.a = _arg_1;
         this.b = _arg_2;
      }
      
      public function setInterval(_arg_1:Number, _arg_2:Number) : void
      {
         this.a = _arg_1;
         this.b = _arg_2;
      }
      
      public function interpolate(_arg_1:Number) : Number
      {
         return this.a + (this.b - this.a) * _arg_1;
      }
   }
}

