package platform.client.fp10.core.network.command.control.server
{
   import flash.utils.ByteArray;
   import platform.client.fp10.core.network.ControlChannelContext;
   import platform.client.fp10.core.network.command.ControlCommand;
   import platform.client.fp10.core.network.command.IServerControlCommand;
   
   public class HashResponseCommand extends ControlCommand implements IServerControlCommand
   {
      
      public var hash:ByteArray;
      
      public var channelProtectionEnabled:Boolean;
      
      public function HashResponseCommand(_arg_1:ByteArray, _arg_2:Boolean)
      {
         super(ControlCommand.SV_HASH_RESPONSE,"Hash response");
         this.hash = _arg_1;
         this.channelProtectionEnabled = _arg_2;
      }
      
      public function execute(_arg_1:ControlChannelContext) : void
      {
         _arg_1.hash = this.hash;
         _arg_1.channelProtectionEnabled = this.channelProtectionEnabled;
      }
   }
}

