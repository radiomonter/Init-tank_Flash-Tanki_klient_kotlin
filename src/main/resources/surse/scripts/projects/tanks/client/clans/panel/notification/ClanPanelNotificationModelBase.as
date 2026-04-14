package projects.tanks.client.clans.panel.notification
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanPanelNotificationModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanPanelNotificationModelServer;
      
      private var client:IClanPanelNotificationModelBase = IClanPanelNotificationModelBase(this);
      
      private var modelId:Long = Long.getLong(606942677,1590617894);
      
      private var _addedId:Long = Long.getLong(1587343137,-1916924187);
      
      private var _removedId:Long = Long.getLong(723365112,-1678221051);
      
      private var _updateRestrictionTimeJoinClanId:Long = Long.getLong(1322847239,424158635);
      
      private var _updateRestrictionTimeJoinClan_restrictionTimeJoinClanInSecCodec:ICodec;
      
      public function ClanPanelNotificationModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanPanelNotificationModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanPanelNotificationCC
      {
         return ClanPanelNotificationCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

