package alternativa.tanks.camera
{
   public class AngleValues
   {
      
      private var lorupaz:Number;
      
      private var varohuf:Number;
      
      private var angularAcceleration:Number;
      
      private var angularSpeed:Number;
      
      private var cyq:Number;
      
      public function AngleValues()
      {
         super();
      }
      
      public function init(_arg_1:Number, _arg_2:Number, _arg_3:Number) : void
      {
         this.varohuf = _arg_2 - _arg_1;
         if(this.varohuf < 0)
         {
            this.varohuf = -this.varohuf;
            this.cyq = -1;
         }
         else
         {
            this.cyq = 1;
         }
         if(this.varohuf > Math.PI)
         {
            this.cyq = -this.cyq;
            this.varohuf = 2 * Math.PI - this.varohuf;
         }
         this.angularAcceleration = _arg_3 * this.varohuf;
         this.angularSpeed = 0;
         this.lorupaz = 0;
      }
      
      public function reverseAcceleration() : void
      {
         this.angularAcceleration = -this.angularAcceleration;
      }
      
      public function update(_arg_1:Number) : Number
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.lorupaz < this.varohuf)
         {
            _local_2 = this.angularAcceleration * _arg_1;
            _local_3 = (this.angularSpeed + 0.5 * _local_2) * _arg_1;
            this.angularSpeed += _local_2;
            _local_4 = this.varohuf - this.lorupaz;
            if(_local_4 < _local_3)
            {
               _local_3 = _local_4;
            }
            this.lorupaz += _local_3;
            return _local_3 * this.cyq;
         }
         return 0;
      }
   }
}

