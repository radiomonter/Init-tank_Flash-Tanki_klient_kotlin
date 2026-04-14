package platform.client.fp10.core.protocol.codec
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import platform.client.fp10.core.network.command.SpaceOpenedCommand;
   
   public class SpaceOpenedCommandCodec implements ICodec
   {
      
      public function SpaceOpenedCommandCodec()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:SpaceOpenedCommand = SpaceOpenedCommand(_arg_2);
         _arg_1.writer.writeByte(3);
         _arg_1.writer.writeBytes(_local_3.hash);
         _arg_1.writer.writeInt(_local_3.spaceId.high);
         _arg_1.writer.writeInt(_local_3.spaceId.low);
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         return null;
      }
   }
}

