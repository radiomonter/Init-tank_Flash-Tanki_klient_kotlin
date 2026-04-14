package obfuscation.lecezik
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.achievements.model.achievements.Jypofa;
   
   public class Kanefyz extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Fyq;
      
      private var client:Gas = Gas(this);
      
      private var modelId:Long = Long.getLong(0,300110001);
      
      private var gerine:Long = Long.getLong(0,300110000);
      
      private var zuhihalow:ICodec;
      
      private var qike:Long = Long.getLong(0,300110001);
      
      private var cen:ICodec;
      
      private var gob:ICodec;
      
      private var novel:ICodec;
      
      public function Kanefyz()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Fyq(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Tabaw
      {
         return Tabaw(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.gerine:
               this.client.activateAchievement(Jypofa(this.zuhihalow.decode(_arg_2)));
               return;
            case this.qike:
               this.client.completeAchievement(Jypofa(this.cen.decode(_arg_2)),String(this.gob.decode(_arg_2)),int(this.novel.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

