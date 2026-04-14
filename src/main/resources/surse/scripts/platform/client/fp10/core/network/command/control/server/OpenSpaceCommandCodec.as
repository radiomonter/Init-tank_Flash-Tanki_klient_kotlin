package platform.client.fp10.core.network.command.control.server
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   
   public class OpenSpaceCommandCodec implements ICodec
   {
      
      private var idCodec:ICodec;
      
      public function OpenSpaceCommandCodec(_arg_1:IProtocol)
      {
         super();
         this.init(_arg_1);
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.idCodec = _arg_1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:Long = Long(this.idCodec.decode(_arg_1));
         return new OpenSpaceCommand(_local_2);
      }
   }
}

