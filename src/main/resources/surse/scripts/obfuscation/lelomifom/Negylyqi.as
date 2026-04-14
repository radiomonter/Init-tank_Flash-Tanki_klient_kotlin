package obfuscation.lelomifom
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
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   
   public class Negylyqi extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Dutul;
      
      private var client:Sile = Sile(this);
      
      private var modelId:Long = Long.getLong(183455729,-2099733819);
      
      private var mimypazit:Long = Long.getLong(1367071399,-1702461867);
      
      private var roty:ICodec;
      
      private var dydotaz:ICodec;
      
      private var wuba:Long = Long.getLong(1479921566,-1347191967);
      
      private var vicopipoh:ICodec;
      
      private var qemidob:ICodec;
      
      private var bebop:Long = Long.getLong(1581597391,-963196943);
      
      private var wis:ICodec;
      
      private var degohafow:ICodec;
      
      private var lamaqy:Long = Long.getLong(1345957775,1774893408);
      
      private var visewacam:ICodec;
      
      private var fifapycul:ICodec;
      
      private var gywutowij:Long = Long.getLong(386945968,-373481329);
      
      private var picihyd:ICodec;
      
      private var qukiwopegy:ICodec;
      
      private var cec:ICodec;
      
      private var fuludikor:Long = Long.getLong(184857581,1110813993);
      
      private var gofeberut:ICodec;
      
      public function Negylyqi()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Dutul(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Mikiqejav
      {
         return Mikiqejav(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.mimypazit:
               this.client.changeTeamScore(BattleTeam(this.roty.decode(_arg_2)),int(this.dydotaz.decode(_arg_2)));
               return;
            case this.wuba:
               this.client.donanuno(Suc(this.vicopipoh.decode(_arg_2)),BattleTeam(this.qemidob.decode(_arg_2)));
               return;
            case this.bebop:
               this.client.cesipuvav(this.wis.decode(_arg_2) as Vector.<Suc>,BattleTeam(this.degohafow.decode(_arg_2)));
               return;
            case this.lamaqy:
               this.client.gyf(this.visewacam.decode(_arg_2) as Vector.<Suc>,this.fifapycul.decode(_arg_2) as Vector.<Suc>);
               return;
            case this.gywutowij:
               this.client.userConnect(String(this.picihyd.decode(_arg_2)),this.qukiwopegy.decode(_arg_2) as Vector.<Bamapylaq>,BattleTeam(this.cec.decode(_arg_2)));
               return;
            case this.fuludikor:
               this.client.sywibo(String(this.gofeberut.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

