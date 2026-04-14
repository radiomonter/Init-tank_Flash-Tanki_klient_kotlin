package projects.tanks.client.clans.clan.incoming
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import projects.tanks.client.clans.container.ContainerCC;
   
   public class ClanIncomingModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanIncomingModelServer;
      
      private var client:IClanIncomingModelBase = IClanIncomingModelBase(this);
      
      private var modelId:Long = Long.getLong(794660588,-483099162);
      
      private var _onAddingId:Long = Long.getLong(492813833,1824512689);
      
      private var _onAdding_userIdCodec:ICodec;
      
      private var _onRemovedId:Long = Long.getLong(1902640351,1514469490);
      
      private var _onRemoved_userIdCodec:ICodec;
      
      public function ClanIncomingModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanIncomingModelServer(IModel(this));
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

