package projects.tanks.client.clans.clan.incomingnotificator
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanIncomingNotificatorModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanIncomingNotificatorModelServer;
      
      private var client:IClanIncomingNotificatorModelBase = IClanIncomingNotificatorModelBase(this);
      
      private var modelId:Long = Long.getLong(1448266566,-1893699662);
      
      private var _onAddingId:Long = Long.getLong(47370739,-335983741);
      
      private var _onAdding_userIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(1468492941,414226622);
      
      private var _onRemoved_userIdCodec:ICodec;
      
      public function ClanIncomingNotificatorModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanIncomingNotificatorModelServer(IModel(this));
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

