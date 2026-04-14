package alternativa.protocol.codec.primitive
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   
   public class BooleanCodec implements ICodec
   {
      
      public function BooleanCodec()
      {
         super();
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         _arg_1.writer.writeByte(!Boolean(_arg_2) ? int(int(0)) : int(int(1)));
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return _arg_1.reader.readByte() != 0;
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
   }
}

