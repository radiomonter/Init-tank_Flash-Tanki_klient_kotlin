package projects.tanks.client.clans.space.createclan
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
   
   public class ClanCreateModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _createClanId:Long = Long.getLong(153047394,1401385547);
      
      private var _createClan_nameCodec:ICodec;
      
      private var _createClan_tagCodec:ICodec;
      
      private var _createClan_flagIdCodec:ICodec;
      
      private var _validateNameId:Long = Long.getLong(940455925,-1899445316);
      
      private var _validateName_nameCodec:ICodec;
      
      private var _validateTagId:Long = Long.getLong(445979284,1324195135);
      
      private var _validateTag_tagCodec:ICodec;
      
      private var model:IModel;
      
      public function ClanCreateModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function createClan(_arg_1:String, _arg_2:String, _arg_3:Long) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;createClan;" + _arg_1 + ";" + _arg_2);
      }
      
      public function validateName(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;validateName;" + _arg_1);
      }
      
      public function validateTag(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("clan;validateTag;" + _arg_1);
      }
   }
}

