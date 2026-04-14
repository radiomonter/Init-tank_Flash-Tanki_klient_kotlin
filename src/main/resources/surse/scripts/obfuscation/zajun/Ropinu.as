package obfuscation.zajun
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Ropinu extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Nuqywaz;
      
      private var client:Pureta = Pureta(this);
      
      private var modelId:Long = Long.getLong(170467452,-1685189911);
      
      private var zez:Long = Long.getLong(741262612,-1895966548);
      
      private var dubeneqad:ICodec;
      
      private var zakidy:Long = Long.getLong(1921998262,-1791534114);
      
      private var nevumu:ICodec;
      
      private var soh:ICodec;
      
      private var bada:ICodec;
      
      private var pihako:ICodec;
      
      private var riqomevo:ICodec;
      
      private var dote:Long = Long.getLong(247034803,-90734157);
      
      private var libegimi:ICodec;
      
      public function Ropinu()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Nuqywaz(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Qiqa
      {
         return Qiqa(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.zez:
               return;
            case this.zakidy:
               return;
            case this.dote:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

