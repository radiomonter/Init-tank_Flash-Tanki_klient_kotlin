package platform.client.core.general.socialnetwork.models.socialnetworkparameters
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class SocialNetworkParametersModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:SocialNetworkParametersModelServer;
      
      private var client:ISocialNetworkParametersModelBase = ISocialNetworkParametersModelBase(this);
      
      private var modelId:Long = Long.getLong(1480731399,760833293);
      
      public function SocialNetworkParametersModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new SocialNetworkParametersModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _local_1.registerModelConstructorCodec(this.modelId,this._protocol.getCodec(new TypeCodecInfo(SocialNetworkParametersCC,false)));
      }
      
      protected function getInitParam() : SocialNetworkParametersCC
      {
         return SocialNetworkParametersCC(initParams[Model.object]);
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

