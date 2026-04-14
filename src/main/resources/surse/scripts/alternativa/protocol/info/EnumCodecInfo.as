package alternativa.protocol.info
{
   public class EnumCodecInfo extends TypeCodecInfo
   {
      
      public function EnumCodecInfo(_arg_1:Class, _arg_2:Boolean)
      {
         super(_arg_1,_arg_2);
      }
      
      override public function toString() : String
      {
         return "[EnumCodec " + super.toString() + " type=" + type.toString();
      }
   }
}

