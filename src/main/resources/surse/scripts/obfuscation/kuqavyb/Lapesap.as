package obfuscation.kuqavyb
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Lapesap extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Lavugyter;
      
      private var client:Kubyceb = Kubyceb(this);
      
      private var modelId:Long = Long.getLong(254322684,-956504003);
      
      private var vumozu:Long = Long.getLong(1180507715,64759943);
      
      private var wyt:ICodec;
      
      private var qipifu:Long = Long.getLong(547115248,565846485);
      
      private var savyroju:ICodec;
      
      private var rajycyby:ICodec;
      
      private var jisyz:Long = Long.getLong(547115248,577422584);
      
      private var lore:ICodec;
      
      private var her:ICodec;
      
      private var vesy:ICodec;
      
      public function Lapesap()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Lavugyter(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.vumozu:
               return;
            case this.qipifu:
               return;
            case this.jisyz:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

