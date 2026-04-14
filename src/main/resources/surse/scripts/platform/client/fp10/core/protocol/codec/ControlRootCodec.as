package platform.client.fp10.core.protocol.codec
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Byte;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.command.ControlCommand;
   import platform.client.fp10.core.network.command.SpaceOpenedCommand;
   import platform.client.fp10.core.network.command.control.client.HashRequestCommandCodec;
   import platform.client.fp10.core.network.command.control.client.LogCommandCodec;
   import platform.client.fp10.core.network.command.control.server.HashResponseCommandCodec;
   import platform.client.fp10.core.network.command.control.server.OpenSpaceCommandCodec;
   
   public class ControlRootCodec implements ICodec
   {
      
      [Inject]
      public static var logService:LogService;
      
      private static var logger:Logger;
      
      private var byteCodec:ICodec;
      
      private var serverCommandCodecs:Dictionary = new Dictionary();
      
      private var clientCommandCodecs:Dictionary = new Dictionary();
      
      public function ControlRootCodec()
      {
         super();
      }
      
      private static function getLogger() : Logger
      {
         return logger || (logger = logService.getLogger("codec"));
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.byteCodec = _arg_1.getCodec(new TypeCodecInfo(Byte,false));
         _arg_1.registerCodec(new TypeCodecInfo(SpaceOpenedCommand,false),new SpaceOpenedCommandCodec());
         this.serverCommandCodecs[ControlCommand.SV_HASH_RESPONSE] = new HashResponseCommandCodec(_arg_1);
         this.serverCommandCodecs[ControlCommand.SV_OPEN_SPACE] = new OpenSpaceCommandCodec(_arg_1);
         this.clientCommandCodecs[ControlCommand.CL_HASH_REQUEST] = new HashRequestCommandCodec(_arg_1);
         this.clientCommandCodecs[ControlCommand.CL_LOG] = new LogCommandCodec(_arg_1);
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         var _local_3:ControlCommand = ControlCommand(_arg_2);
         this.byteCodec.encode(_arg_1,_local_3.id);
         var _local_4:ICodec = this.clientCommandCodecs[_local_3.id];
         if(_local_4 != null)
         {
            _local_4.encode(_arg_1,_arg_2);
         }
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:int = int(this.byteCodec.decode(_arg_1));
         var _local_3:ICodec = this.serverCommandCodecs[_local_2];
         if(_local_3 == null)
         {
            getLogger().error("ControlRootCodec::doDecode() No codec found for command id=" + _local_2);
            return null;
         }
         return _local_3.decode(_arg_1);
      }
   }
}

