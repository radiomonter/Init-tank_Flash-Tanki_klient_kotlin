package projects.tanks.client.clans.user.incomingnotificator
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanUserIncomingNotificatorModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanUserIncomingNotificatorModelServer;
      
      private var client:IClanUserIncomingNotificatorModelBase = IClanUserIncomingNotificatorModelBase(this);
      
      private var modelId:Long = Long.getLong(151267905,-1393229156);
      
      private var _onAddingId:Long = Long.getLong(1638331388,1514392729);
      
      private var _onAdding_clanIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(751334509,-1941322344);
      
      private var _onRemoved_clanIdCodec:ICodec;
      
      public function ClanUserIncomingNotificatorModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanUserIncomingNotificatorModelServer(IModel(this));
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

