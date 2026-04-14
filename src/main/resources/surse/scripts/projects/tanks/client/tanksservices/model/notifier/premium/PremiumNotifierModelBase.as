package projects.tanks.client.tanksservices.model.notifier.premium
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class PremiumNotifierModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:PremiumNotifierModelServer;
      
      private var client:IPremiumNotifierModelBase = IPremiumNotifierModelBase(this);
      
      private var modelId:Long = Long.getLong(302389563,-1379937773);
      
      private var _setPremiumTimeLeftId:Long = Long.getLong(177962403,-1405245077);
      
      private var _setPremiumTimeLeft_premiumTimeLeftCodec:ICodec;
      
      private var _updateTimeLeftId:Long = Long.getLong(1172025171,225736801);
      
      private var _updateTimeLeft_leftTimeInSecondsCodec:ICodec;
      
      public function PremiumNotifierModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new PremiumNotifierModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : PremiumNotifierCC
      {
         return PremiumNotifierCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._setPremiumTimeLeftId:
               return;
            case this._updateTimeLeftId:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

