package alternativa.protocol.codec.primitive
{
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   
   public class ShortCodec implements IPrimitiveCodec
   {
      
      public function ShortCodec()
      {
         super();
      }
      
      public function nullValue() : Object
      {
         return int.MIN_VALUE;
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         _arg_1.writer.writeShort(int(_arg_2));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return _arg_1.reader.readShort();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
   }
}

