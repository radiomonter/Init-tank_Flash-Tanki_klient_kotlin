package obfuscation.byg
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Kamybeqed extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Tem;
      
      private var client:Viwu = Viwu(this);
      
      private var modelId:Long = Long.getLong(505740619,208573179);
      
      private var qedafag:Long = Long.getLong(1314377165,-137514211);
      
      private var ciqona:ICodec;
      
      private var vumozu:Long = Long.getLong(1283643622,1059974789);
      
      private var wyt:ICodec;
      
      private var qipifu:Long = Long.getLong(954743485,-2074939053);
      
      private var savyroju:ICodec;
      
      private var rajycyby:ICodec;
      
      private var jisyz:Long = Long.getLong(954743485,-2063362954);
      
      private var lore:ICodec;
      
      private var her:ICodec;
      
      private var fohi:ICodec;
      
      private var tyjejasate:ICodec;
      
      private var banopafem:ICodec;
      
      public function Kamybeqed()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Tem(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.qedafag:
               return;
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

