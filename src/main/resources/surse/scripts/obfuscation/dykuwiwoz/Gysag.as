package obfuscation.dykuwiwoz
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class Gysag
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var gecagi:Long = Long.getLong(2095583187,-547646417);
      
      private var vyzahamud:ICodec;
      
      private var model:IModel;
      
      public function Gysag(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.vyzahamud = this.protocol.getCodec(new TypeCodecInfo(Boolean,false));
      }
      
      public function enable(_arg_1:Boolean) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;updateBattleInviteEnabled;" + _arg_1);
      }
   }
}

