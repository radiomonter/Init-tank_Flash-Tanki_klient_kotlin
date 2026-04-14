package obfuscation.kewic
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Budysajoz extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Palina;
      
      private var client:Jylicuten = Jylicuten(this);
      
      private var modelId:Long = Long.getLong(592429654,1339096271);
      
      private var zakidy:Long = Long.getLong(1979897371,-1124194266);
      
      private var nevumu:ICodec;
      
      private var dinajynyf:ICodec;
      
      private var jerigawy:ICodec;
      
      private var wenuducal:ICodec;
      
      private var taqejic:Long = Long.getLong(1470645133,813558546);
      
      private var ratuf:ICodec;
      
      public function Budysajoz()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Palina(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Pafijoban
      {
         return Pafijoban(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.zakidy:
               return;
            case this.taqejic:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

