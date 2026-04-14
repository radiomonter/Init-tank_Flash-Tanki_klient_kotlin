package projects.tanks.client.chat.models.chat.chat
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ChatModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ChatModelServer;
      
      private var client:IChatModelBase = IChatModelBase(this);
      
      private var modelId:Long = Long.getLong(1413646454,-1397687631);
      
      private var _cleanUsersMessagesId:Long = Long.getLong(798714808,-1771953585);
      
      private var _cleanUsersMessages_uidCodec:ICodec;
      
      private var _showMessagesId:Long = Long.getLong(978360780,-904735215);
      
      private var _showMessages_messagesCodec:ICodec;
      
      private var _updateTypingSpeedAntifloodParamsId:Long = Long.getLong(613975441,130861697);
      
      private var _updateTypingSpeedAntifloodParams_symbolCostCodec:ICodec;
      
      private var _updateTypingSpeedAntifloodParams_enterCostCodec:ICodec;
      
      public function ChatModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ChatModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ChatCC
      {
         return ChatCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._cleanUsersMessagesId:
               return;
            case this._showMessagesId:
               return;
            case this._updateTypingSpeedAntifloodParamsId:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

