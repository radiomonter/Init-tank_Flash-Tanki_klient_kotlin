package platform.client.fp10.core.protocol.codec
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.network.command.SpaceOpenedCommand;
   
   public class SpaceRootCodec implements ICodec
   {
      
      private var spaceOpenedCommandCodec:ICodec;
      
      private var longCodec:ICodec;
      
      public function SpaceRootCodec()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.spaceOpenedCommandCodec = _arg_1.getCodec(new TypeCodecInfo(SpaceOpenedCommand,false));
         this.longCodec = _arg_1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:SpaceCommand = null;
         var _local_4:ByteArray = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         if(_arg_2 is SpaceOpenedCommand)
         {
            this.spaceOpenedCommandCodec.encode(_arg_1,_arg_2);
         }
         else
         {
            if(!(_arg_2 is SpaceCommand))
            {
               throw new Error("Unknown space command");
            }
            _local_3 = SpaceCommand(_arg_2);
            this.longCodec.encode(_arg_1,_local_3.objectId);
            this.longCodec.encode(_arg_1,_local_3.methodId);
            _local_4 = ByteArray(_local_3.protocolBuffer.reader);
            _local_4.position = 0;
            while(Boolean(_local_4.bytesAvailable))
            {
               _local_6 = _local_4.readByte();
               _arg_1.writer.writeByte(_local_6);
            }
            _local_3.protocolBuffer.optionalMap.reset();
            _local_5 = 0;
            while(_local_5 < _local_3.protocolBuffer.optionalMap.getSize())
            {
               _arg_1.optionalMap.addBit(_local_3.protocolBuffer.optionalMap.Jul());
               _local_5++;
            }
         }
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return _arg_1;
      }
   }
}

