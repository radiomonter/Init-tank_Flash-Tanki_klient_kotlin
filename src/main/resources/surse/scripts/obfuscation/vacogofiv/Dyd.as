package obfuscation.vacogofiv
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Dyd extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Bejilure;
      
      private var client:Sybo = Sybo(this);
      
      private var modelId:Long = Long.getLong(1286074115,-176946994);
      
      private var weqet:Long = Long.getLong(343596326,-230405373);
      
      private var puqakinu:ICodec;
      
      private var muvawyw:Long = Long.getLong(208555485,-6667003);
      
      private var lanokeka:ICodec;
      
      private var hojytabu:Long = Long.getLong(154981282,1951339013);
      
      public function Dyd()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Bejilure(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.weqet:
               this.client.die(int(this.puqakinu.decode(_arg_2)));
               return;
            case this.muvawyw:
               this.client.onDeathScheduled(int(this.lanokeka.decode(_arg_2)));
               return;
            default:
               return;
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

