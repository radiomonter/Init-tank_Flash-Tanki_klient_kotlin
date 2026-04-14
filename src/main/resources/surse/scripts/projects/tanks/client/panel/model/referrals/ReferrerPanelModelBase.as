package projects.tanks.client.panel.model.referrals
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ReferrerPanelModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ReferrerPanelModelServer;
      
      private var client:IReferrerPanelModelBase = IReferrerPanelModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300050089);
      
      private var _inviteSentSuccessfullyId:Long = Long.getLong(0,300050055);
      
      private var _openReferrerPanelId:Long = Long.getLong(0,300050056);
      
      private var _openReferrerPanel_dataCodec:ICodec;
      
      private var _openReferrerPanel_inviteLinkCodec:ICodec;
      
      private var _openReferrerPanel_bannerCodec:ICodec;
      
      private var _openReferrerPanel_inviteMessageCodec:ICodec;
      
      private var _sendInviteEmailErrorId:Long = Long.getLong(0,300050057);
      
      private var _sendInviteEmailError_errorMessageCodec:ICodec;
      
      public function ReferrerPanelModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ReferrerPanelModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ReferrerPanelCC
      {
         return ReferrerPanelCC(initParams[Model.object]);
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

