package projects.tanks.client.clans.user.outgoing
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanUserOutgoingModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanUserOutgoingModelServer;
      
      private var client:IClanUserOutgoingModelBase = IClanUserOutgoingModelBase(this);
      
      private var modelId:Long = Long.getLong(205268203,-139952058);
      
      private var _onAddingId:Long = Long.getLong(230800152,-1398596335);
      
      private var _onAdding_userIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(1435129862,-1648365870);
      
      private var _onRemoved_userIdCodec:ICodec;
      
      public function ClanUserOutgoingModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanUserOutgoingModelServer(IModel(this));
      }
      
      protected function getInitParam() : ContainerCC
      {
         return ContainerCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

