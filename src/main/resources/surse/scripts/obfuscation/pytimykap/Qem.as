package obfuscation.pytimykap
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
   
   public class Qem
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var semivemyf:Long = Long.getLong(668941246,-1113168476);
      
      private var pujyle:ICodec;
      
      private var model:IModel;
      
      public function Qem(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.pujyle = this.protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      public function syvagycy(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;validateUid;" + _arg_1);
      }
   }
}

