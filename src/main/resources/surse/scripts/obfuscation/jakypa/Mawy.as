package obfuscation.jakypa
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
   import platform.client.fp10.core.type.IGameObject;
   
   public class Mawy
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var tyly:Long = Long.getLong(169296918,-2003348677);
      
      private var hezepony:ICodec;
      
      private var pezor:ICodec;
      
      private var zuweb:ICodec;
      
      private var huhy:ICodec;
      
      private var model:IModel;
      
      public function Mawy(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.hezepony = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.pezor = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this.zuweb = this.protocol.getCodec(new TypeCodecInfo(String,false));
         this.huhy = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function cari(_arg_1:String, _arg_2:IGameObject, _arg_3:String, _arg_4:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;purchasePresent;" + _arg_1 + ";" + _arg_2.name + ";" + _arg_3);
      }
   }
}

