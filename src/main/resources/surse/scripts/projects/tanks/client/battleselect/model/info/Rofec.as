package projects.tanks.client.battleselect.model.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Rofec extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Tepocyki;
      
      private var client:Wyrikipo = Wyrikipo(this);
      
      private var modelId:Long = Long.getLong(0,300090007);
      
      private var barefahof:Long = Long.getLong(0,300090014);
      
      private var nasoze:Long = Long.getLong(0,300090015);
      
      private var fusunyfuv:Long = Long.getLong(0,300090016);
      
      private var domavugov:ICodec;
      
      private var kopiku:Long = Long.getLong(0,300090017);
      
      private var ruta:Long = Long.getLong(0,300090018);
      
      private var _updateNameId:Long = Long.getLong(0,300090019);
      
      private var sefo:ICodec;
      
      private var wam:Long = Long.getLong(0,300090020);
      
      private var kuduwarum:ICodec;
      
      private var zujuputin:ICodec;
      
      public function Rofec()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Tepocyki(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Qaru
      {
         return Qaru(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.barefahof:
               this.client.battleStop();
               return;
            case this.nasoze:
               this.client.fightFailedServerIsHalting();
               return;
            case this.fusunyfuv:
               return;
            case this.kopiku:
               this.client.roundFinish();
               return;
            case this.ruta:
               this.client.roundStart();
               return;
            case this._updateNameId:
               this.client.updateName(String(this.sefo.decode(_arg_2)));
               return;
            case this.wam:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

