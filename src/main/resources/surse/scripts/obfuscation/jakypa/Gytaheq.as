package obfuscation.jakypa
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.tanks.model.item.present.PresentItem;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Gytaheq
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var vateju:Long = Long.getLong(1053633131,-938990018);
      
      private var ryhy:ICodec;
      
      private var model:IModel;
      
      public function Gytaheq(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.ryhy = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      public function removePresent(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;removePresent;" + PresentItem(_arg_1.adapt(PresentItem)).getConstructor().id);
      }
   }
}

