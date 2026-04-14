package obfuscation.pyp
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Pywytadu extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Gycebubu;
      
      private var client:Hafot = Hafot(this);
      
      private var modelId:Long = Long.getLong(1428989873,1951780812);
      
      private var boruc:Long = Long.getLong(810018451,-1328707173);
      
      private var tawu:ICodec;
      
      private var pasej:ICodec;
      
      private var nyqezaj:ICodec;
      
      private var jir:Long = Long.getLong(826886748,-1809986386);
      
      private var vaw:ICodec;
      
      public function Pywytadu()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Gycebubu(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.boruc:
               return;
            case this.jir:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

