package alternativa.proplib.utils
{
   import flash.utils.ByteArray;
   
   public class ByteArrayMap
   {
      
      private var _data:Object;
      
      public function ByteArrayMap(_arg_1:Object = null)
      {
         super();
         this._data = _arg_1 == null ? {} : _arg_1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getValue(_arg_1:String) : ByteArray
      {
         return this._data[_arg_1];
      }
      
      public function putValue(_arg_1:String, _arg_2:ByteArray) : void
      {
         this._data[_arg_1] = _arg_2;
      }
   }
}

