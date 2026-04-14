package obfuscation.hufikutu
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Judyf extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Jyfymur;
      
      private var client:Lybi = Lybi(this);
      
      private var modelId:Long = Long.getLong(387277533,1853292335);
      
      private var zakidy:Long = Long.getLong(87545380,-265767482);
      
      private var nevumu:ICodec;
      
      private var soh:ICodec;
      
      private var jizym:ICodec;
      
      private var dub:ICodec;
      
      private var taqejic:Long = Long.getLong(289812713,334160242);
      
      private var ratuf:ICodec;
      
      private var nibocoha:Long = Long.getLong(498560719,475399825);
      
      private var zipudo:ICodec;
      
      public function Judyf()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Jyfymur(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Vivubefav
      {
         return Vivubefav(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.zakidy:
               return;
            case this.taqejic:
               return;
            case this.nibocoha:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

