package obfuscation.pysuzi
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Lozuwyzu extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Har;
      
      private var client:Kecuwy = Kecuwy(this);
      
      private var modelId:Long = Long.getLong(0,300090004);
      
      private var tiwisebyq:Long = Long.getLong(0,300090011);
      
      private var bahuna:ICodec;
      
      private var fygu:Long = Long.getLong(0,300090012);
      
      private var hohyped:ICodec;
      
      public function Lozuwyzu()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Har(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Homevobi
      {
         return Homevobi(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.tiwisebyq:
               return;
            case this.fygu:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

