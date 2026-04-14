package projects.tanks.client.clans.clan.permissions
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   
   public class ClanPermissionsModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _setPermissionForUserId:Long = Long.getLong(447793233,-26752538);
      
      private var _setPermissionForUser_userIdCodec:ICodec;
      
      private var _setPermissionForUser_permissionCodec:ICodec;
      
      private var model:IModel;
      
      public function ClanPermissionsModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function setPermissionForUser(_arg_1:String, _arg_2:ClanPermission) : void
      {
      }
   }
}

