package obfuscation.wadili
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Qypapeliz extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Suhy;
      
      private var client:Vysip = Vysip(this);
      
      private var modelId:Long = Long.getLong(1099120188,-904226430);
      
      public function Qypapeliz()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Suhy(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Hidol
      {
         return Hidol(initParams[Model.object]);
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

