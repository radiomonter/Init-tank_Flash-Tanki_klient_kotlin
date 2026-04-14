package obfuscation.gasovufe
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Ribawekot extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Covabicym;
      
      private var client:Wuv = Wuv(this);
      
      private var modelId:Long = Long.getLong(118876660,-1267889929);
      
      private var botihove:Long = Long.getLong(2126351838,-2114277847);
      
      private var nejano:ICodec;
      
      public function Ribawekot()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Covabicym(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Pygek
      {
         return Pygek(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.botihove:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

