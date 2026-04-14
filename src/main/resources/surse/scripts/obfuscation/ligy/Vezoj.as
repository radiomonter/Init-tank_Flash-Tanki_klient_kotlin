package obfuscation.ligy
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Vezoj
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var zytyqes:Long = Long.getLong(1386525242,-25718765);
      
      private var madilyna:ICodec;
      
      private var model:IModel;
      
      public function Vezoj(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.madilyna = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function ces(_arg_1:int) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.madilyna.encode(this.protocolBuffer,_arg_1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_2:SpaceCommand = new SpaceCommand(Model.object.id,this.zytyqes,this.protocolBuffer);
         var _local_3:IGameObject = Model.object;
         var _local_4:ISpace = _local_3.space;
         _local_4.commandSender.sendCommand(_local_2);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

