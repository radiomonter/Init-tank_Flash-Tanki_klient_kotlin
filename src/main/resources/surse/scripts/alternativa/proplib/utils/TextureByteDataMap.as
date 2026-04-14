package alternativa.proplib.utils
{
   import alternativa.utils.textureutils.TextureByteData;
   
   public class TextureByteDataMap
   {
      
      private var _data:Object;
      
      public function TextureByteDataMap(_arg_1:Object = null)
      {
         super();
         this._data = _arg_1 == null ? {} : _arg_1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function getValue(_arg_1:String) : TextureByteData
      {
         return this._data[_arg_1];
      }
      
      public function putValue(_arg_1:String, _arg_2:TextureByteData) : void
      {
         this._data[_arg_1] = _arg_2;
      }
   }
}

