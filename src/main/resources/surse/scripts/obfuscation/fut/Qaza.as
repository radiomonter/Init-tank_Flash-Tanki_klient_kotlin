package obfuscation.fut
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Qaza extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Sus;
      
      private var client:Zyv = Zyv(this);
      
      private var modelId:Long = Long.getLong(0,300090028);
      
      private var tiwisebyq:Long = Long.getLong(0,300090034);
      
      private var bahuna:ICodec;
      
      private var fygu:Long = Long.getLong(0,300090035);
      
      private var hohyped:ICodec;
      
      private var ruw:ICodec;
      
      private var lobutuliw:Long = Long.getLong(0,300090036);
      
      public function Qaza()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Sus(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Donoqof
      {
         return Donoqof(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.tiwisebyq:
               return;
            case this.fygu:
               return;
            case this.lobutuliw:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

