package projects.tanks.client.clans.panel.foreignclan
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class ForeignClanModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ForeignClanModelServer;
      
      private var client:IForeignClanModelBase = IForeignClanModelBase(this);
      
      private var modelId:Long = Long.getLong(1029456312,194126704);
      
      private var _alreadyInClanOutgoingId:Long = Long.getLong(2072556979,560987130);
      
      private var _alreadyInClanOutgoing_clanNameCodec:ICodec;
      
      private var _alreadyInIncomingId:Long = Long.getLong(1821924666,143246274);
      
      private var _alreadyInIncoming_clanNameCodec:ICodec;
      
      private var _clanBlockedId:Long = Long.getLong(1269926118,-537285713);
      
      private var _clanBlocked_reasonCodec:ICodec;
      
      private var _onJoinClanId:Long = Long.getLong(2037318745,22259876);
      
      private var _onJoinClan_clanNameCodec:ICodec;
      
      private var _showForeignClanId:Long = Long.getLong(1203575776,253980200);
      
      private var _showForeignClan_clanDataCodec:ICodec;
      
      private var _userSmallRankForAddClanId:Long = Long.getLong(763277444,804297489);
      
      public function ForeignClanModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ForeignClanModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : ForeignClanCC
      {
         return ForeignClanCC(initParams[Model.object]);
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

