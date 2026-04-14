package projects.tanks.client.clans.panel.loadingclan
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanLoadingPanelModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanLoadingPanelModelServer;
      
      private var client:IClanLoadingPanelModelBase = IClanLoadingPanelModelBase(this);
      
      private var modelId:Long = Long.getLong(1454635600,1588551742);
      
      public function ClanLoadingPanelModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanLoadingPanelModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanLoadingPanelCC
      {
         return ClanLoadingPanelCC(initParams[Model.object]);
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

