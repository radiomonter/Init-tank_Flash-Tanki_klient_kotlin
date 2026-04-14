package projects.tanks.client.clans.user
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ClanUserModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _acceptId:Long = Long.getLong(1768627069,1892741997);
      
      private var _accept_lightClanCodec:ICodec;
      
      private var _addId:Long = Long.getLong(18682727,195142564);
      
      private var _add_lightClanCodec:ICodec;
      
      private var _addInClanByNameId:Long = Long.getLong(890566910,1534882553);
      
      private var _addInClanByName_nameCodec:ICodec;
      
      private var _checkClanNameId:Long = Long.getLong(1690954694,-2009525540);
      
      private var _checkClanName_nameCodec:ICodec;
      
      private var _rejectId:Long = Long.getLong(1768627069,-1913474556);
      
      private var _reject_lightClanCodec:ICodec;
      
      private var _rejectAllId:Long = Long.getLong(1489758230,1514479363);
      
      private var _revokeId:Long = Long.getLong(1768627069,-1913107221);
      
      private var _revoke_lightClanCodec:ICodec;
      
      private var model:IModel;
      
      public function ClanUserModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function accept(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;accept;" + _arg_1.name);
      }
      
      public function add(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;add;" + _arg_1.name);
      }
      
      public function addInClanByName(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;addInClanByName;" + _arg_1);
      }
      
      public function checkClanName(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;checkClanName;" + _arg_1);
      }
      
      public function reject(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;reject;" + _arg_1.name);
      }
      
      public function rejectAll() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;rejectAll");
      }
      
      public function revoke(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;revoke;" + _arg_1.name);
      }
   }
}

