package obfuscation.lyguh
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Dedadeseq extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Keperu;
      
      private var client:Fywysehe = Fywysehe(this);
      
      private var modelId:Long = Long.getLong(479007306,2075268288);
      
      private var qyry:Long = Long.getLong(1090794095,949129477);
      
      private var zel:ICodec;
      
      private var zuno:Long = Long.getLong(1558315722,-513756959);
      
      private var pafylyl:ICodec;
      
      private var kejacis:ICodec;
      
      private var zykabo:Long = Long.getLong(1130188491,-1001840691);
      
      private var mecupiny:ICodec;
      
      private var jaguru:ICodec;
      
      private var hiri:ICodec;
      
      private var legizi:ICodec;
      
      private var tuliq:ICodec;
      
      private var katim:Long = Long.getLong(1555952411,-2052736679);
      
      private var vilydyna:ICodec;
      
      public function Dedadeseq()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Keperu(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Gerujywiv
      {
         return Gerujywiv(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.qyry:
               this.client.mis(String(this.zel.decode(_arg_2)));
               return;
            case this.zuno:
               this.client.tegapij(String(this.pafylyl.decode(_arg_2)),String(this.kejacis.decode(_arg_2)));
               return;
            case this.zykabo:
               this.client.kajafe(String(this.mecupiny.decode(_arg_2)),Number(this.jaguru.decode(_arg_2)),Number(this.hiri.decode(_arg_2)),Number(this.legizi.decode(_arg_2)),String(this.tuliq.decode(_arg_2)));
               return;
            case this.katim:
               this.client.geku(String(this.vilydyna.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

