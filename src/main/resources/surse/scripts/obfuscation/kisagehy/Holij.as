package obfuscation.kisagehy
{
   public class Holij
   {
      
      private var jyganukep:Number;
      
      private var zucoly:Number;
      
      private var tawiruqe:int;
      
      private var lafyreku:int;
      
      public function Holij(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:int = 0, _arg_4:int = 0)
      {
         super();
         this.jyganukep = _arg_1;
         this.zucoly = _arg_2;
         this.tawiruqe = _arg_3;
         this.lafyreku = _arg_4;
      }
      
      public function get angleX() : Number
      {
         return this.jyganukep;
      }
      
      public function set angleX(_arg_1:Number) : void
      {
         this.jyganukep = _arg_1;
      }
      
      public function get angleZ() : Number
      {
         return this.zucoly;
      }
      
      public function set angleZ(_arg_1:Number) : void
      {
         this.zucoly = _arg_1;
      }
      
      public function get lightColor() : int
      {
         return this.tawiruqe;
      }
      
      public function set lightColor(_arg_1:int) : void
      {
         this.tawiruqe = _arg_1;
      }
      
      public function get shadowColor() : int
      {
         return this.lafyreku;
      }
      
      public function set shadowColor(_arg_1:int) : void
      {
         this.lafyreku = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DynamicShadowParams [";
         _local_1 += "angleX = " + this.angleX + " ";
         _local_1 += "angleZ = " + this.angleZ + " ";
         _local_1 += "lightColor = " + this.lightColor + " ";
         _local_1 += "shadowColor = " + this.shadowColor + " ";
         return _local_1 + "]";
      }
   }
}

