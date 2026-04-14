package obfuscation.samona
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Syvyviho extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Qozyrolej;
      
      private var client:Dyw = Dyw(this);
      
      private var modelId:Long = Long.getLong(1952266263,-1912192267);
      
      private var zakidy:Long = Long.getLong(823399156,351343872);
      
      private var nevumu:ICodec;
      
      private var dumagu:ICodec;
      
      private var mugysecyg:ICodec;
      
      private var gubuhave:ICodec;
      
      private var taqejic:Long = Long.getLong(1289133603,-862527368);
      
      private var ratuf:ICodec;
      
      private var vajugecu:ICodec;
      
      public function Syvyviho()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Qozyrolej(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Diqije
      {
         return Diqije(initParams[Model.object]);
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

