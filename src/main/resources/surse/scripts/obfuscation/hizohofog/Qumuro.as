package obfuscation.hizohofog
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Qumuro extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Jomub;
      
      private var client:Birupu = Birupu(this);
      
      private var modelId:Long = Long.getLong(1965338956,1417730743);
      
      private var mobiq:Long = Long.getLong(1487412361,8128743);
      
      private var hycuqu:ICodec;
      
      private var dypoz:ICodec;
      
      private var role:Long = Long.getLong(1849471524,-639146266);
      
      private var qaji:ICodec;
      
      private var gujy:ICodec;
      
      private var viguhon:Long = Long.getLong(1134857420,-1224060835);
      
      private var cipu:ICodec;
      
      private var qyvini:ICodec;
      
      private var zelifuwor:Long = Long.getLong(794624341,25869850);
      
      private var cakurufo:ICodec;
      
      private var coji:ICodec;
      
      public function Qumuro()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Jomub(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Dusy
      {
         return Dusy(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.mobiq:
               this.client.dropFlag(Vector3d(this.hycuqu.decode(_arg_2)),BattleTeam(this.dypoz.decode(_arg_2)));
               return;
            case this.role:
               this.client.flagDelivered(BattleTeam(this.qaji.decode(_arg_2)),String(this.gujy.decode(_arg_2)));
               return;
            case this.viguhon:
               this.client.flagTaken(String(this.cipu.decode(_arg_2)),BattleTeam(this.qyvini.decode(_arg_2)));
               return;
            case this.zelifuwor:
               this.client.returnFlagToBase(BattleTeam(this.cakurufo.decode(_arg_2)),String(this.coji.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

