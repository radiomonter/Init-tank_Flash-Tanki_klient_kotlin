package projects.tanks.client.clans.clan.acceptednotificator
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanAcceptedNotificatorModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanAcceptedNotificatorModelServer;
      
      private var client:IClanAcceptedNotificatorModelBase = IClanAcceptedNotificatorModelBase(this);
      
      private var modelId:Long = Long.getLong(1575927935,-367368112);
      
      private var _onAddingId:Long = Long.getLong(946943636,-1512579195);
      
      private var _onAdding_userIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(709518332,1700494084);
      
      private var _onRemoved_userIdCodec:ICodec;
      
      public function ClanAcceptedNotificatorModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanAcceptedNotificatorModelServer(IModel(this));
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

