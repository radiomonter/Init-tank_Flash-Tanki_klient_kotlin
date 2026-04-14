package projects.tanks.client.chat.models.chat.chat
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class ChatModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendMessageId:Long = Long.getLong(727072716,-952919953);
      
      private var _sendMessage_targetUserNameCodec:ICodec;
      
      private var _sendMessage_addressModeCodec:ICodec;
      
      private var _sendMessage_channelCodec:ICodec;
      
      private var _sendMessage_textCodec:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function ChatModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function sendMessage(_arg_1:String, _arg_2:String) : void
      {
         this.network.send("lobby;chat_message;" + _arg_1 + ";" + _arg_2);
      }
   }
}

