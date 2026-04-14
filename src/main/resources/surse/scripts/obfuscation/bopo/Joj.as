package obfuscation.bopo
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
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Joj extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Gines;
      
      private var client:Degah = Degah(this);
      
      private var modelId:Long = Long.getLong(0,300090027);
      
      private var govycy:Long = Long.getLong(0,300090029);
      
      private var qiwy:ICodec;
      
      private var cemity:ICodec;
      
      private var musoq:Long = Long.getLong(0,300090030);
      
      private var lobutuliw:Long = Long.getLong(0,300090031);
      
      private var nuv:Long = Long.getLong(0,300090032);
      
      private var neqigo:ICodec;
      
      private var pisaha:ICodec;
      
      private var pomin:Long = Long.getLong(0,300090033);
      
      private var cuwuky:ICodec;
      
      private var viwob:ICodec;
      
      public function Joj()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Gines(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Wecy
      {
         return Wecy(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.govycy:
               this.client.addUser(BattleInfoUser(this.qiwy.decode(_arg_2)),BattleTeam(this.cemity.decode(_arg_2)));
               return;
            case this.musoq:
               this.client.pevuje();
               return;
            case this.lobutuliw:
               this.client.swapTeams();
               return;
            case this.nuv:
               this.client.updateTeamScore(BattleTeam(this.neqigo.decode(_arg_2)),int(this.pisaha.decode(_arg_2)));
               return;
            case this.pomin:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

