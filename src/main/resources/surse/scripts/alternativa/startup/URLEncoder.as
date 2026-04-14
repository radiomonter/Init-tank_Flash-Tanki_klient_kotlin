package alternativa.startup
{
   import flash.utils.ByteArray;
   import mx.utils.Base64Encoder;
   
   public class URLEncoder
   {
      
      public function URLEncoder()
      {
         super();
      }
      
      public static function encode(_arg_1:String) : String
      {
         var _local_2:Base64Encoder = new Base64Encoder();
         _local_2.insertNewLines = false;
         var _local_3:ByteArray = new ByteArray();
         _local_3.writeUTFBytes(_arg_1);
         _local_2.encodeUTFBytes(_local_3.toString());
         return _local_2.toString();
      }
   }
}

