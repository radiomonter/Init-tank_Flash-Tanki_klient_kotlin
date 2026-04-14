package obfuscation.hasitaze
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Fije extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Caqeziryn;
      
      private var client:Qufami = Qufami(this);
      
      private var modelId:Long = Long.getLong(1645686167,1474428435);
      
      private var dabevagis:Long = Long.getLong(1426613749,-669664322);
      
      private var kanige:Long = Long.getLong(387341675,1817286639);
      
      private var tozili:ICodec;
      
      private var jifeceh:ICodec;
      
      private var vew:Long = Long.getLong(877312902,1109359872);
      
      public function Fije()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Caqeziryn(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Rajyc
      {
         return Rajyc(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.dabevagis:
               return;
            case this.kanige:
               return;
            case this.vew:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

