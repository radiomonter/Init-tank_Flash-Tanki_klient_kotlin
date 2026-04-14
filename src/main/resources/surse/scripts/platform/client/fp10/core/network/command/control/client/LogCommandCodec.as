package platform.client.fp10.core.network.command.control.client
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   
   public class LogCommandCodec implements ICodec
   {
      
      private var intCodec:ICodec;
      
      private var stringCodec:ICodec;
      
      public function LogCommandCodec(_arg_1:IProtocol)
      {
         super();
         this.init(_arg_1);
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.intCodec = _arg_1.getCodec(new TypeCodecInfo(int,false));
         this.stringCodec = _arg_1.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:LogCommand = LogCommand(_arg_2);
         this.intCodec.encode(_arg_1,_local_3.level);
         this.stringCodec.encode(_arg_1,_local_3.channel);
         this.stringCodec.encode(_arg_1,_local_3.message);
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return null;
      }
   }
}

