package projects.tanks.client.clans.clan.clanmembersdata
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanMembersDataModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanMembersDataModelServer;
      
      private var client:IClanMembersDataModelBase = IClanMembersDataModelBase(this);
      
      private var modelId:Long = Long.getLong(1647741962,-1293471250);
      
      private var _sendDataId:Long = Long.getLong(264735719,2108782023);
      
      private var _sendData_userDataCodec:ICodec;
      
      public function ClanMembersDataModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanMembersDataModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanMembersCC
      {
         return ClanMembersCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._sendDataId:
               this.client.sendData(UserData(this._sendData_userDataCodec.decode(_arg_2)));
               return;
            default:
               return;
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

