package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanUserModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanUserModelServer;
      
      private var client:IClanUserModelBase = IClanUserModelBase(this);
      
      private var modelId:Long = Long.getLong(259670316,1522052296);
      
      private var _alreadyInAcceptedId:Long = Long.getLong(57363867,1237781863);
      
      private var _alreadyInAccepted_nameCodec:ICodec;
      
      private var _alreadyInClanId:Long = Long.getLong(618126442,-725356522);
      
      private var _alreadyInClanOutgoingId:Long = Long.getLong(1671975780,-1329402274);
      
      private var _alreadyInClanOutgoing_nameCodec:ICodec;
      
      private var _alreadyInClanOutgoing_lightClanCodec:ICodec;
      
      private var _alreadyInIncomingId:Long = Long.getLong(57363920,-817863194);
      
      private var _alreadyInIncoming_nameCodec:ICodec;
      
      private var _alreadyInIncoming_clanCodec:ICodec;
      
      private var _alreadyInOutgoingId:Long = Long.getLong(57363960,-848977620);
      
      private var _alreadyInOutgoing_nameCodec:ICodec;
      
      private var _clanBlockedId:Long = Long.getLong(325235064,-2121980921);
      
      private var _clanExistId:Long = Long.getLong(1693514433,32146500);
      
      private var _clanIncomingRequestDisabledId:Long = Long.getLong(944293305,-1852342578);
      
      private var _clanNotExistId:Long = Long.getLong(1492352330,720837769);
      
      private var _creatorLeaveOfClanIfEmptyClanId:Long = Long.getLong(1273341198,-1482111631);
      
      private var _joinClanId:Long = Long.getLong(193176875,2068732989);
      
      private var _leftClanId:Long = Long.getLong(193176886,893937818);
      
      private var _leftClan_restrictionTimeInSecCodec:ICodec;
      
      private var _removeClanBonusesId:Long = Long.getLong(1136230800,538530230);
      
      private var _showAlertFullClanId:Long = Long.getLong(2062667168,-2002974215);
      
      private var _updateStatusBonusesClanId:Long = Long.getLong(1570177194,1280257195);
      
      private var _updateStatusBonusesClan_canGiveBonusesClanCodec:ICodec;
      
      private var _userLowRankId:Long = Long.getLong(321756128,1414681448);
      
      public function ClanUserModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanUserModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanUserCC
      {
         return ClanUserCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

