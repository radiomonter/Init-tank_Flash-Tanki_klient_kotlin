package obfuscation.hizohofog
{
   import obfuscation.kofen.Vector3d;
   
   public class Lyf
   {
      
      private var zodahej:Vector3d;
      
      private var zyteloqu:String;
      
      private var kehezomob:Vector3d;
      
      public function Lyf(_arg_1:Vector3d = null, _arg_2:String = null, _arg_3:Vector3d = null)
      {
         super();
         this.zodahej = _arg_1;
         this.zyteloqu = _arg_2;
         this.kehezomob = _arg_3;
      }
      
      public function get vylon() : Vector3d
      {
         return this.zodahej;
      }
      
      public function set vylon(_arg_1:Vector3d) : void
      {
         this.zodahej = _arg_1;
      }
      
      public function get dumetone() : String
      {
         return this.zyteloqu;
      }
      
      public function set dumetone(_arg_1:String) : void
      {
         this.zyteloqu = _arg_1;
      }
      
      public function get rulijo() : Vector3d
      {
         return this.kehezomob;
      }
      
      public function set rulijo(_arg_1:Vector3d) : void
      {
         this.kehezomob = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ClientFlag [";
         _local_1 += "flagBasePosition = " + this.vylon + " ";
         _local_1 += "flagCarrierId = " + this.dumetone + " ";
         _local_1 += "flagPosition = " + this.rulijo + " ";
         return _local_1 + "]";
      }
   }
}

