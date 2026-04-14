package projects.tanks.client.battleselect.model.battleselect.create
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.fabuqy.Qumafi;
   import platform.client.fp10.core.model.IModel;
   
   public class BattleCreateModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _checkBattleNameForForbiddenWordsId:Long = Long.getLong(0,300090000);
      
      private var _checkBattleNameForForbiddenWords_battleNameCodec:ICodec;
      
      private var _createBattleId:Long = Long.getLong(0,300090001);
      
      private var _createBattle_paramsCodec:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function BattleCreateModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      }
      
      public function checkBattleNameForForbiddenWords(_arg_1:String) : void
      {
         this.network = Network(OSGi.getInstance().getService(INetworker));
         this.network.send("battle_create;checkBattleNameForForbiddenWords;" + _arg_1);
      }
      
      public function createBattle(_arg_1:Qumafi) : void
      {
         this.network = Network(OSGi.getInstance().getService(INetworker));
         var _local_2:Object = new Object();
         _local_2.autoBalance = _arg_1.autoBalance;
         _local_2.battleMode = _arg_1.battleMode.name;
         _local_2.friendlyFire = _arg_1.friendlyFire;
         _local_2.scoreLimit = _arg_1.fik.scoreLimit;
         _local_2.timeLimitInSec = _arg_1.fik.timeLimitInSec;
         _local_2.mapId = _arg_1.mapId;
         _local_2.maxPeopleCount = _arg_1.maxPeopleCount;
         _local_2.name = _arg_1.name;
         _local_2.privateBattle = _arg_1.privateBattle;
         _local_2.proBattle = _arg_1.proBattle;
         _local_2.minRank = _arg_1.rankRange.min;
         _local_2.maxRank = _arg_1.rankRange.max;
         _local_2.reArmorEnabled = _arg_1.reArmorEnabled;
         _local_2.theme = _arg_1.theme.name;
         _local_2.withoutBonuses = _arg_1.withoutBonuses;
         _local_2.withoutCrystals = _arg_1.withoutCrystals;
         _local_2.withoutSupplies = _arg_1.withoutSupplies;
         _local_2.equipmentConstraintsMode = _arg_1.equipmentConstraintsMode.name;
         _local_2.parkourMode = _arg_1.parkourMode;
         this.network.send("battle_create;battle_create;" + JSON.stringify(_local_2));
      }
   }
}

