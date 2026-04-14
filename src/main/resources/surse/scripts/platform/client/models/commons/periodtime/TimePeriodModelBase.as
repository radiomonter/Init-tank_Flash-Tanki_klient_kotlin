package platform.client.models.commons.periodtime
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class TimePeriodModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:TimePeriodModelServer;
      
      private var client:ITimePeriodModelBase = ITimePeriodModelBase(this);
      
      private var modelId:Long = Long.getLong(1870140649,1080360405);
      
      public function TimePeriodModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new TimePeriodModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         _local_1.registerModelConstructorCodec(this.modelId,this._protocol.getCodec(new TypeCodecInfo(TimePeriodModelCC,false)));
      }
      
      protected function getInitParam() : TimePeriodModelCC
      {
         return TimePeriodModelCC(initParams[Model.object]);
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

