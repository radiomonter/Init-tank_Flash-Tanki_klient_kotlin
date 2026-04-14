package projects.tanks.client.battlefield.models.battle.battlefield
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import obfuscation.kisagehy.Qomopesu;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Zotimum extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Mijitew;
      
      private var client:Rejeh = Rejeh(this);
      
      private var modelId:Long = Long.getLong(1723277227,1936126557);
      
      private var haqecys:Long = Long.getLong(1285984840,1983429603);
      
      private var mude:Long = Long.getLong(1210824392,-987670337);
      
      private var zadobumac:Long = Long.getLong(180030714,353397522);
      
      private var bucyge:ICodec;
      
      private var cujuvu:Long = Long.getLong(711773257,1091256454);
      
      private var hunab:ICodec;
      
      public function Zotimum()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Mijitew(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Qomopesu
      {
         return Qomopesu(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.haqecys:
               return;
            case this.mude:
               return;
            case this.zadobumac:
               return;
            case this.cujuvu:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

