package obfuscation.tupujy
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Zakybevyd extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Tovaha;
      
      private var client:Qasepyhob = Qasepyhob(this);
      
      private var modelId:Long = Long.getLong(1034700989,1212373553);
      
      private var racis:Long = Long.getLong(597053943,1126684268);
      
      private var cavecywu:ICodec;
      
      private var maqec:Long = Long.getLong(119287527,-1716930052);
      
      private var werujiwy:ICodec;
      
      public function Zakybevyd()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Tovaha(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Qemokumy
      {
         return Qemokumy(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.racis:
               return;
            case this.maqec:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

