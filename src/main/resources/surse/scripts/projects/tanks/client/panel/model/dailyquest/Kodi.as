package projects.tanks.client.panel.model.dailyquest
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
   
   public class Kodi
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var cysu:Long = Long.getLong(721193585,-108838556);
      
      private var vigucy:ICodec;
      
      private var luqaw:ICodec;
      
      private var jyfaje:Long = Long.getLong(898481927,1112991605);
      
      private var zejin:ICodec;
      
      private var hahejiq:Long = Long.getLong(663591737,-831307794);
      
      private var wihyf:ICodec;
      
      private var model:IModel;
      
      public function Kodi(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.vigucy = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.luqaw = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.zejin = this.protocol.getCodec(new TypeCodecInfo(Long,false));
         this.wihyf = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function weh(_arg_1:Long, _arg_2:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;skipQuestForCrystals;" + _arg_1.low + ";" + _arg_2);
      }
      
      public function zedunop(_arg_1:Long) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;skipQuestForFree;" + _arg_1.low);
      }
      
      public function takePrize(_arg_1:Long) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;takePrize;" + _arg_1.low);
      }
   }
}

