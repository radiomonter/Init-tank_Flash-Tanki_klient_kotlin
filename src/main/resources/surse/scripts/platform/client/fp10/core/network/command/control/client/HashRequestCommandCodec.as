package platform.client.fp10.core.network.command.control.client
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   
   public class HashRequestCommandCodec implements ICodec
   {
      
      private var arrayCodec:ICodec;
      
      public function HashRequestCommandCodec(_arg_1:IProtocol)
      {
         super();
         this.init(_arg_1);
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.arrayCodec = _arg_1.getCodec(new CollectionCodecInfo(new TypeCodecInfo(String,false),false,1));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:HashRequestCommand = HashRequestCommand(_arg_2);
         this.arrayCodec.encode(_arg_1,_local_3.parameterNames);
         this.arrayCodec.encode(_arg_1,_local_3.parameterValues);
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return null;
      }
   }
}

