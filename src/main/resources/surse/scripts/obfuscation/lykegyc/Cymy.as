package obfuscation.lykegyc
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
   
   public class Cymy
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var todezoz:Long = Long.getLong(1669375812,-973745790);
      
      private var sihilanoh:ICodec;
      
      private var model:IModel;
      
      public function Cymy(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.sihilanoh = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function kykur(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;attempt_to_take_bonus;" + _arg_1);
      }
   }
}

