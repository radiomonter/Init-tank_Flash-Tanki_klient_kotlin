package projects.tanks.client.clans.clan.clanfriends
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanFriendsModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanFriendsModelServer;
      
      private var client:IClanFriendsModelBase = IClanFriendsModelBase(this);
      
      private var modelId:Long = Long.getLong(1889621503,1893984398);
      
      private var _onUserAddId:Long = Long.getLong(2135860306,-1585042188);
      
      private var _onUserAdd_idCodec:ICodec;
      
      private var _onUserRemoveId:Long = Long.getLong(526095397,633372847);
      
      private var _onUserRemove_idCodec:ICodec;
      
      private var _userJoinClanId:Long = Long.getLong(489547868,-896284526);
      
      private var _userJoinClan_usersIdCodec:ICodec;
      
      public function ClanFriendsModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanFriendsModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanFriendsCC
      {
         return ClanFriendsCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

