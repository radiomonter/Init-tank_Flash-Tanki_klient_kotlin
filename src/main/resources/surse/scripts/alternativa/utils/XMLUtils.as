package alternativa.utils
{
   import flash.utils.ByteArray;
   
   public class XMLUtils
   {
      
      private static var buf:ByteArray = new ByteArray();
      
      public function XMLUtils()
      {
         super();
      }
      
      public static function copyXMLString(_arg_1:String) : String
      {
         buf.position = 0;
         buf.writeUTF(_arg_1);
         buf.position = 0;
         return buf.readUTF();
      }
      
      public static function getAttributeAsString(_arg_1:XML, _arg_2:String, _arg_3:String = null) : String
      {
         var _local_4:XML = null;
         var _local_5:XMLList = _arg_1.attribute(_arg_2);
         if(_local_5.length() > 0)
         {
            _local_4 = _local_5[0];
            return _local_4.toString();
         }
         return _arg_3;
      }
      
      public static function getAttributeAsNumber(_arg_1:XML, _arg_2:String, _arg_3:Number = NaN) : Number
      {
         var _local_4:XMLList = _arg_1.attribute(_arg_2);
         if(_local_4.length() > 0)
         {
            return Number(_local_4[0]);
         }
         return _arg_3;
      }
   }
}

