package obfuscation.pyp
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
   import obfuscation.muc.Nuwyzogi;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Gycebubu
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var mydyqy:Long = Long.getLong(1792558267,422618582);
      
      private var valis:ICodec;
      
      private var dih:Long = Long.getLong(763612380,736380393);
      
      private var jofalo:Long = Long.getLong(1605739608,-2116633576);
      
      private var dopev:ICodec;
      
      private var model:IModel;
      
      public function Gycebubu(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function sogyp(_arg_1:Nuwyzogi) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.valis.encode(this.protocolBuffer,_arg_1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_2:SpaceCommand = new SpaceCommand(Model.object.id,this.mydyqy,this.protocolBuffer);
         var _local_3:IGameObject = Model.object;
         var _local_4:ISpace = _local_3.space;
         _local_4.commandSender.sendCommand(_local_2);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function showSettings() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;showSettings");
      }
      
      public function qomyhuq(_arg_1:Mibagu) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;showDamageEnabled;" + _arg_1.hetosaz);
      }
   }
}

