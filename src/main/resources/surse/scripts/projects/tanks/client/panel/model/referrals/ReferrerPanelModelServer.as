package projects.tanks.client.panel.model.referrals
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
   
   public class ReferrerPanelModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _sendInviteEmailId:Long = Long.getLong(0,300050053);
      
      private var _sendInviteEmail_recipientsCodec:ICodec;
      
      private var _sendInviteEmail_senderNameCodec:ICodec;
      
      private var _showReferrerPanelId:Long = Long.getLong(0,300050054);
      
      private var model:IModel;
      
      public function ReferrerPanelModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function sendInviteEmail(_arg_1:Vector.<String>, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;sendInviteEmail;" + _arg_1 + ";" + _arg_2);
      }
      
      public function showReferrerPanel() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;showReferrerPanel");
      }
   }
}

