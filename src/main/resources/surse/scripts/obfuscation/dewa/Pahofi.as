package obfuscation.dewa
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Pahofi extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Wogudic;
      
      private var client:Qepof = Qepof(this);
      
      private var modelId:Long = Long.getLong(2120141642,699496177);
      
      private var racis:Long = Long.getLong(1609604139,228512172);
      
      private var cavecywu:ICodec;
      
      private var maqec:Long = Long.getLong(1853038031,-1082989884);
      
      private var werujiwy:ICodec;
      
      public function Pahofi()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Wogudic(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Cuq
      {
         return Cuq(initParams[Model.object]);
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

