package obfuscation.wadili
{
   public class Hidol
   {
      
      private var _data:Vector.<Cupudiw>;
      
      public function Hidol(_arg_1:Vector.<Cupudiw> = null)
      {
         super();
         this._data = _arg_1;
      }
      
      public function get data() : Vector.<Cupudiw>
      {
         return this._data;
      }
      
      public function set data(_arg_1:Vector.<Cupudiw>) : void
      {
         this._data = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BCSHModelCC [";
         _local_1 += "data = " + this.data + " ";
         return _local_1 + "]";
      }
   }
}

