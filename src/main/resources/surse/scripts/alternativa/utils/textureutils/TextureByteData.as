package alternativa.utils.textureutils
{
   import flash.utils.ByteArray;
   
   public class TextureByteData
   {
      
      public var diffuseData:ByteArray;
      
      public var opacityData:ByteArray;
      
      public function TextureByteData(_arg_1:ByteArray = null, _arg_2:ByteArray = null)
      {
         super();
         this.diffuseData = _arg_1;
         this.opacityData = _arg_2;
      }
   }
}

