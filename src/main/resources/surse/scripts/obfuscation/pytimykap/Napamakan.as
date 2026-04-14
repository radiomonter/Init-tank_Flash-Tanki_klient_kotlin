package obfuscation.pytimykap
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.models.commons.types.ValidationStatus;
   
   public class Napamakan extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Qem;
      
      private var client:Qifizid = Qifizid(this);
      
      private var modelId:Long = Long.getLong(1543089237,611543143);
      
      private var vogetyqoq:Long = Long.getLong(317069682,-1647554367);
      
      private var pyce:ICodec;
      
      public function Napamakan()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Qem(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Cypeza
      {
         return Cypeza(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.vogetyqoq:
               this.client.validateResult(ValidationStatus(this.pyce.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

