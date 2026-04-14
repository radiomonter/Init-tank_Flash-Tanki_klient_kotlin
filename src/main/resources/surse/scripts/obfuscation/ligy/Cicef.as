package obfuscation.ligy
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import obfuscation.bude.BattleTeam;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Cicef extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Vezoj;
      
      private var client:Rypybuje = Rypybuje(this);
      
      private var modelId:Long = Long.getLong(375259874,-2064506790);
      
      private var hagym:Long = Long.getLong(113336798,-635616124);
      
      private var bemimifu:ICodec;
      
      private var mukonuki:Long = Long.getLong(113336798,-648481992);
      
      private var vificyduc:ICodec;
      
      private var tequcuzy:Long = Long.getLong(1656540814,-150441162);
      
      private var cojig:ICodec;
      
      private var vovuf:ICodec;
      
      private var litaw:ICodec;
      
      private var lira:Long = Long.getLong(93222359,396117780);
      
      private var zunupa:ICodec;
      
      private var wogeje:ICodec;
      
      private var qikuluqis:Long = Long.getLong(1109525934,-1995327689);
      
      private var digubac:Long = Long.getLong(1209531510,1444573534);
      
      private var jabuqemo:ICodec;
      
      private var wif:ICodec;
      
      private var jerukagu:Long = Long.getLong(1944648201,859419652);
      
      private var salama:ICodec;
      
      private var teqehisit:ICodec;
      
      public function Cicef()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Vezoj(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Dijiz
      {
         return Dijiz(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.hagym:
               this.client.pointCaptureStarted(BattleTeam(this.bemimifu.decode(_arg_2)));
               return;
            case this.mukonuki:
               this.client.pointCaptureStopped(BattleTeam(this.vificyduc.decode(_arg_2)));
               return;
            case this.tequcuzy:
               this.client.setPointProgress(int(this.cojig.decode(_arg_2)),Number(this.vovuf.decode(_arg_2)),Number(this.litaw.decode(_arg_2)));
               return;
            case this.lira:
               this.client.setPointState(int(this.zunupa.decode(_arg_2)),Zyjova(this.wogeje.decode(_arg_2)));
               return;
            case this.qikuluqis:
               this.client.vyjo();
               return;
            case this.digubac:
               this.client.tankEnteredPointZone(int(this.jabuqemo.decode(_arg_2)),String(this.wif.decode(_arg_2)));
               return;
            case this.jerukagu:
               this.client.tankLeftPointZone(int(this.salama.decode(_arg_2)),String(this.teqehisit.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

