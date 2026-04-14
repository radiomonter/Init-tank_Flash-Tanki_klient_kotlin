package obfuscation.samona
{
   public class Diqije
   {
      
      private var bufom:Number;
      
      private var rufah:Number;
      
      private var jybos:Number;
      
      public function Diqije(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0)
      {
         super();
         this.bufom = _arg_1;
         this.rufah = _arg_2;
         this.jybos = _arg_3;
      }
      
      public function get distance() : Number
      {
         return this.bufom;
      }
      
      public function set distance(_arg_1:Number) : void
      {
         this.bufom = _arg_1;
      }
      
      public function get shellRadius() : Number
      {
         return this.rufah;
      }
      
      public function set shellRadius(_arg_1:Number) : void
      {
         this.rufah = _arg_1;
      }
      
      public function get speed() : Number
      {
         return this.jybos;
      }
      
      public function set speed(_arg_1:Number) : void
      {
         this.jybos = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TwinsCC [";
         _local_1 += "distance = " + this.distance + " ";
         _local_1 += "shellRadius = " + this.shellRadius + " ";
         _local_1 += "speed = " + this.speed + " ";
         return _local_1 + "]";
      }
   }
}

