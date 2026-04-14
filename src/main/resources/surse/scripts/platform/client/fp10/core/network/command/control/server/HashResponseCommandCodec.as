package platform.client.fp10.core.network.command.control.server
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import flash.utils.ByteArray;
   
   public class HashResponseCommandCodec implements ICodec
   {
      
      private static const HASH_BYTE_LENGTH:int = 32;
      
      private var byteCodec:ICodec;
      
      private var booleanCodec:ICodec;
      
      public function HashResponseCommandCodec(_arg_1:IProtocol)
      {
         super();
         this.init(_arg_1);
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.byteCodec = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         this.booleanCodec = _arg_1.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_3:int = 0;
         var _local_2:ByteArray = new ByteArray();
         while(_local_3 < HASH_BYTE_LENGTH)
         {
            _local_2.writeByte(int(this.byteCodec.decode(_arg_1)));
            _local_3++;
         }
         _local_2.position = 0;
         var _local_4:Boolean = Boolean(this.booleanCodec.decode(_arg_1));
         return new HashResponseCommand(_local_2,_local_4);
      }
   }
}

