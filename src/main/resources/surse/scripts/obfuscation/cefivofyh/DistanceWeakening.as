package obfuscation.cefivofyh
{
   public class DistanceWeakening
   {
      
      private var muku:Number;
      
      private var cuqutel:Number;
      
      private var nudonywo:Number;
      
      private var rowurasof:Number;
      
      public function DistanceWeakening(_arg_1:Number, _arg_2:Number, _arg_3:Number)
      {
         super();
         this.muku = _arg_1;
         this.cuqutel = _arg_2;
         this.nudonywo = _arg_3;
         this.rowurasof = _arg_2 - _arg_1;
      }
      
      public function sygyta(_arg_1:Number) : Number
      {
         if(this.rowurasof <= 0)
         {
            return 1;
         }
         if(_arg_1 <= this.muku)
         {
            return 1;
         }
         if(_arg_1 >= this.cuqutel)
         {
            return 0.01 * this.nudonywo;
         }
         return 0.01 * (this.nudonywo + (this.cuqutel - _arg_1) * (100 - this.nudonywo) / this.rowurasof);
      }
      
      public function mosez() : Number
      {
         return this.muku;
      }
      
      public function wyky() : Number
      {
         return this.cuqutel;
      }
   }
}

