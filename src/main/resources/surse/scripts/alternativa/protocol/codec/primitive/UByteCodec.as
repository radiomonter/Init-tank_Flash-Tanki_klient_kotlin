package alternativa.protocol.codec.primitive
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   
   public class UByteCodec implements ICodec
   {
      
      public function UByteCodec()
      {
         super();
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         _arg_1.writer.writeUnsignedInt(uint(_arg_2));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return _arg_1.reader.readUnsignedByte();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
   }
}

