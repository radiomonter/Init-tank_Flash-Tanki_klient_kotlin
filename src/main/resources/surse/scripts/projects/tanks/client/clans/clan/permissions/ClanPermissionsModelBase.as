package projects.tanks.client.clans.clan.permissions
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanPermissionsModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanPermissionsModelServer;
      
      private var client:IClanPermissionsModelBase = IClanPermissionsModelBase(this);
      
      private var modelId:Long = Long.getLong(1602467880,168781542);
      
      private var _updateActionsId:Long = Long.getLong(871743923,-1602562917);
      
      private var _updateActions_actionsCodec:ICodec;
      
      public function ClanPermissionsModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanPermissionsModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanPermissionsCC
      {
         return ClanPermissionsCC(initParams[Model.object]);
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

