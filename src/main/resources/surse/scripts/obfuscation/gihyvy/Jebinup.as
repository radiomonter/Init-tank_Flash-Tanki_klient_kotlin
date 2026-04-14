package obfuscation.gihyvy
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Jebinup extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Wogyq;
      
      private var client:Zynyjah = Zynyjah(this);
      
      private var modelId:Long = Long.getLong(500772743,-1275562344);
      
      private var favo:Long = Long.getLong(1132148565,-1228176022);
      
      private var hakybed:Long = Long.getLong(1500025148,-1072265992);
      
      private var sarehel:Long = Long.getLong(815803475,677498549);
      
      private var hyguti:ICodec;
      
      private var hiqefugy:ICodec;
      
      private var gujajef:ICodec;
      
      private var kos:Long = Long.getLong(815803475,677432898);
      
      private var jirugus:ICodec;
      
      private var rawovo:Long = Long.getLong(1121481378,274069336);
      
      private var dowafub:ICodec;
      
      private var vakananyd:ICodec;
      
      private var gugi:Long = Long.getLong(1056545941,1597681057);
      
      private var zybapo:ICodec;
      
      private var jasogir:Long = Long.getLong(1235006804,1616331544);
      
      private var vazyvamy:ICodec;
      
      private var bymif:Long = Long.getLong(696094159,-894234735);
      
      private var mojel:ICodec;
      
      public function Jebinup()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Wogyq(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

