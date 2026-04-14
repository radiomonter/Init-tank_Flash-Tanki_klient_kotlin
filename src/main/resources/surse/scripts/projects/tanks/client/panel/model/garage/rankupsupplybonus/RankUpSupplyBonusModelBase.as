package projects.tanks.client.panel.model.garage.rankupsupplybonus
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class RankUpSupplyBonusModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:RankUpSupplyBonusModelServer;
      
      private var client:IRankUpSupplyBonusModelBase = IRankUpSupplyBonusModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300050085);
      
      private var _showRankUpSupplyBonusAlertsId:Long = Long.getLong(0,300050051);
      
      private var _showRankUpSupplyBonusAlerts_bonusesCodec:ICodec;
      
      public function RankUpSupplyBonusModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new RankUpSupplyBonusModelServer(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._showRankUpSupplyBonusAlertsId:
               this.client.showRankUpSupplyBonusAlerts(this._showRankUpSupplyBonusAlerts_bonusesCodec.decode(_arg_2) as Vector.<RankUpSupplyBonusInfo>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

