package alternativa.tanks.sfx
{
   public class Blinker
   {
      
      private var qutaly:int;
      
      private var pigarenu:int;
      
      private var huvake:int;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var vuzucuf:Number;
      
      private var value:Number;
      
      private var jybos:Number;
      
      private var pacatywak:Number;
      
      private var cemalihi:int;
      
      private var tady:int;
      
      public function Blinker(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Number, _arg_5:Number, _arg_6:Number)
      {
         super();
         this.qutaly = _arg_1;
         this.pigarenu = _arg_2;
         this.huvake = _arg_3;
         this.minValue = _arg_4;
         this.maxValue = _arg_5;
         this.vuzucuf = _arg_6;
         this.pacatywak = _arg_5 - _arg_4;
      }
      
      public function muluz(_arg_1:int) : void
      {
         this.qutaly = _arg_1;
      }
      
      public function init(_arg_1:int) : void
      {
         this.value = this.maxValue;
         this.tady = this.qutaly;
         this.jybos = this.vuq(-1);
         this.cemalihi = _arg_1 + this.tady;
      }
      
      public function qijav(_arg_1:Number) : void
      {
         if(_arg_1 >= this.minValue)
         {
            this.maxValue = _arg_1;
            this.pacatywak = this.maxValue - this.minValue;
         }
      }
      
      public function robop(_arg_1:Number) : void
      {
         if(_arg_1 <= this.maxValue)
         {
            this.minValue = _arg_1;
            this.pacatywak = this.maxValue - this.minValue;
         }
      }
      
      public function siparipo() : Number
      {
         return this.minValue;
      }
      
      public function cusyrun(_arg_1:int, _arg_2:int) : Number
      {
         this.value += this.jybos * _arg_2;
         if(this.value > this.maxValue)
         {
            this.value = this.maxValue;
         }
         if(this.value < this.minValue)
         {
            this.value = this.minValue;
         }
         if(_arg_1 >= this.cemalihi)
         {
            if(this.tady > this.pigarenu)
            {
               this.tady -= this.huvake;
               if(this.tady < this.pigarenu)
               {
                  this.tady = this.pigarenu;
               }
            }
            this.cemalihi = _arg_1 + this.tady;
            if(this.jybos < 0)
            {
               this.jybos = this.vuq(1);
            }
            else
            {
               this.jybos = this.vuq(-1);
            }
         }
         return this.value;
      }
      
      private function vuq(_arg_1:Number) : Number
      {
         return _arg_1 * this.vuzucuf * this.pacatywak / this.tady;
      }
   }
}

