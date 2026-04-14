package obfuscation.kelideci
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class ChatModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendMessageId:Long = Long.getLong(339805286,174227780);
      
      private var wozut:ICodec;
      
      private var cenyjuw:ICodec;
      
      private var model:IModel;
      
      public function ChatModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.wozut = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.cenyjuw = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function sendMessage(_arg_1:String, _arg_2:Boolean) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;chat;" + _arg_1 + ";" + _arg_2);
      }
   }
}

