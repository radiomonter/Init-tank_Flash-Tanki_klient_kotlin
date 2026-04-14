package platform.client.fp10.core.network.handler
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.dump.IDumpService;
   import alternativa.osgi.service.dump.IDumper;
   import alternativa.osgi.service.launcherparams.ILauncherParams;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.protocol.IProtocol;
   import flash.utils.Dictionary;
   import platform.client.fp10.core.network.ControlChannelContext;
   import platform.client.fp10.core.network.ICommandHandler;
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.network.command.IServerControlCommand;
   import platform.client.fp10.core.network.command.control.client.HashRequestCommand;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.service.address.AddressService;
   import platform.client.fp10.core.service.clientparam.ClientParamUtil;
   import platform.client.fp10.core.service.errormessage.IErrorMessageService;
   import platform.client.fp10.core.service.errormessage.errors.ConnectionClosedError;
   import platform.client.fp10.core.type.ISpace;
   
   public class ControlCommandHandler implements ICommandHandler
   {
      
      [Inject]
      public static var logService:LogService;
      
      private static var logger:Logger;
      
      [Inject]
      public static var messageBoxService:IErrorMessageService;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var launcherParams:ILauncherParams;
      
      [Inject]
      public static var addressService:AddressService;
      
      private var channelContext:ControlChannelContext = new ControlChannelContext();
      
      private var commandSender:ICommandSender;
      
      public function ControlCommandHandler()
      {
         super();
         var _local_1:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.channelContext.spaceProtocol = _local_1;
      }
      
      private static function getLogger() : Logger
      {
         return logger || (logger = logService.getLogger("control"));
      }
      
      public function getCommandSender() : ICommandSender
      {
         return this.commandSender;
      }
      
      public function getChannelContext() : ControlChannelContext
      {
         return this.channelContext;
      }
      
      public function onConnectionOpen(_arg_1:ICommandSender) : void
      {
         this.commandSender = _arg_1;
         this.sendConnectionResponse();
      }
      
      public function onConnectionClose(_arg_1:ConnectionCloseStatus, _arg_2:String = null) : void
      {
         var _local_3:Object = null;
         var _local_4:ISpace = null;
         while(spaceRegistry.spaces.length > 0)
         {
            _local_4 = spaceRegistry.spaces[0];
            _local_4.close();
         }
         for each(_local_3 in OSGi.getInstance().serviceList)
         {
            if(_local_3 is OnConnectionClosedServiceListener)
            {
               OnConnectionClosedServiceListener(_local_3).onConnectionClosed(_arg_1);
            }
         }
         if(_arg_1 != ConnectionCloseStatus.CLOSED_BY_CLIENT)
         {
            messageBoxService.showMessage(new ConnectionClosedError(_arg_1));
         }
         this.commandSender = null;
         this.logDumpers();
      }
      
      public function executeCommand(_arg_1:Object) : void
      {
         IServerControlCommand(_arg_1).execute(this.channelContext);
      }
      
      private function sendConnectionResponse() : void
      {
         var _local_1:String = null;
         var _local_2:Dictionary = null;
         var _local_3:* = null;
         var _local_4:Array = [];
         var _local_5:Array = [];
         for each(_local_1 in launcherParams.parameterNames)
         {
            _local_4.push(_local_1);
            _local_5.push(launcherParams.getParameter(_local_1));
         }
         _local_4.push("clientHashURL");
         _local_5.push(this.getClientHashURL());
         _local_2 = ClientParamUtil.collectClientParams();
         for(_local_3 in _local_2)
         {
            _local_4.push(_local_3);
            _local_5.push(_local_2[_local_3]);
         }
         this.commandSender.sendCommand(new HashRequestCommand(_local_4,_local_5));
      }
      
      private function logDumpers() : void
      {
         var _local_1:IDumper = null;
         var _local_2:IDumpService = IDumpService(OSGi.getInstance().getService(IDumpService));
         for each(_local_1 in _local_2.dumpersList)
         {
            logService.getLogger("dumper_" + _local_1.dumperName).info(_local_1.dump([]));
         }
      }
      
      private function getClientHashURL() : String
      {
         return addressService.getBaseURL() + "#" + addressService.getValue();
      }
   }
}

