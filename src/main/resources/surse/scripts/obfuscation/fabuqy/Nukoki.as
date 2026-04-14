package obfuscation.fabuqy
{
   public class Nukoki
   {
      
      private var rutahop:int;
      
      private var jurigyh:int;
      
      public function Nukoki(_arg_1:int = 0, _arg_2:int = 0)
      {
         super();
         this.rutahop = _arg_1;
         this.jurigyh = _arg_2;
      }
      
      public function get max() : int
      {
         return this.rutahop;
      }
      
      public function set max(_arg_1:int) : void
      {
         this.rutahop = _arg_1;
      }
      
      public function get min() : int
      {
         return this.jurigyh;
      }
      
      public function set min(_arg_1:int) : void
      {
         this.jurigyh = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "Range [";
         _local_1 += "max = " + this.max + " ";
         _local_1 += "min = " + this.min + " ";
         return _local_1 + "]";
      }
   }
}

