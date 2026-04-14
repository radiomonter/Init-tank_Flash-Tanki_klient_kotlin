package projects.tanks.client.clans.user.incoming
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanUserIncomingModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanUserIncomingModelServer;
      
      private var client:IClanUserIncomingModelBase = IClanUserIncomingModelBase(this);
      
      private var modelId:Long = Long.getLong(1120804751,-1974844538);
      
      private var _onAddingId:Long = Long.getLong(591561906,1809211473);
      
      private var _onAdding_userIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(1158549911,-1988807186);
      
      private var _onRemoved_userIdCodec:ICodec;
      
      public function ClanUserIncomingModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanUserIncomingModelServer(IModel(this));
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

