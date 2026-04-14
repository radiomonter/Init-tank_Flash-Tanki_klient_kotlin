package projects.tanks.client.clans.clan.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   
   public class ClanInfoModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _changeFlagId:Long = Long.getLong(7985443,1344518925);
      
      private var _changeFlag_flagIdCodec:ICodec;
      
      private var _changeMinRankForAddClanId:Long = Long.getLong(888363060,-1039017893);
      
      private var _changeMinRankForAddClan_rankIndexCodec:ICodec;
      
      private var _incomingRequestEnableId:Long = Long.getLong(1864388665,1550465963);
      
      private var _incomingRequestEnable_enabledCodec:ICodec;
      
      private var _updateDescriptionId:Long = Long.getLong(201719116,-324479452);
      
      private var _updateDescription_descriptionCodec:ICodec;
      
      private var model:IModel;
      
      public function ClanInfoModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function changeFlag(_arg_1:Long) : void
      {
      }
      
      public function changeMinRankForAddClan(_arg_1:int) : void
      {
      }
      
      public function incomingRequestEnable(_arg_1:Boolean) : void
      {
      }
      
      public function updateDescription(_arg_1:String) : void
      {
      }
   }
}

