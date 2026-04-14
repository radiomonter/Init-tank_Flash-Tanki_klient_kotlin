package alternativa.tanks.battle.objects.tank
{
   public class Dobyt implements Cokunuf
   {
      
      private var currentValue:Number;
      
      private var duwy:Number;
      
      private var dudecy:Number;
      
      private var dywykowe:Number;
      
      public function Dobyt(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.dudecy = _arg_1;
         this.dywykowe = _arg_2;
         this.duwy = _arg_3;
         this.currentValue = _arg_4;
      }
      
      public function reset(_arg_1:Number) : void
      {
         this.currentValue = _arg_1;
         this.duwy = _arg_1;
      }
      
      public function update(_arg_1:Number) : Number
      {
         if(this.currentValue < this.duwy)
         {
            this.currentValue += this.dudecy * _arg_1;
            if(this.currentValue > this.duwy)
            {
               this.currentValue = this.duwy;
            }
         }
         else if(this.currentValue > this.duwy)
         {
            this.currentValue -= this.dywykowe * _arg_1;
            if(this.currentValue < this.duwy)
            {
               this.currentValue = this.duwy;
            }
         }
         return this.currentValue;
      }
      
      public function ravik(_arg_1:Number) : void
      {
         this.duwy = _arg_1;
      }
      
      public function vur() : Number
      {
         return this.duwy;
      }
   }
}

