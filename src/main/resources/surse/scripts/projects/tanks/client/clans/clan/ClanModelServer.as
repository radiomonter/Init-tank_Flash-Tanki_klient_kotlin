package projects.tanks.client.clans.clan
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   
   public class ClanModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _acceptId:Long = Long.getLong(604314745,-105798717);
      
      private var _accept_userIdCodec:ICodec;
      
      private var _addId:Long = Long.getLong(1902342915,677739462);
      
      private var _add_userIdCodec:ICodec;
      
      private var _addInClanByUidId:Long = Long.getLong(1703252332,-1020199032);
      
      private var _addInClanByUid_uidCodec:ICodec;
      
      private var _checkUidId:Long = Long.getLong(925885936,795088419);
      
      private var _checkUid_uidCodec:ICodec;
      
      private var _rejectId:Long = Long.getLong(604314746,382952026);
      
      private var _reject_userIdCodec:ICodec;
      
      private var _rejectAllId:Long = Long.getLong(1362304089,-1090734311);
      
      private var _removeUserFromClanId:Long = Long.getLong(537442486,-138480918);
      
      private var _removeUserFromClan_userIdCodec:ICodec;
      
      private var _revokeId:Long = Long.getLong(604314746,383319361);
      
      private var _revoke_userIdCodec:ICodec;
      
      private var _userLeavesClanId:Long = Long.getLong(1199890940,823346440);
      
      private var model:IModel;
      
      public function ClanModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function accept(_arg_1:String) : void
      {
      }
      
      public function add(_arg_1:String) : void
      {
      }
      
      public function addInClanByUid(_arg_1:String) : void
      {
      }
      
      public function checkUid(_arg_1:String) : void
      {
      }
      
      public function reject(_arg_1:String) : void
      {
      }
      
      public function rejectAll() : void
      {
      }
      
      public function removeUserFromClan(_arg_1:String) : void
      {
      }
      
      public function revoke(_arg_1:String) : void
      {
      }
      
      public function userLeavesClan() : void
      {
      }
   }
}

