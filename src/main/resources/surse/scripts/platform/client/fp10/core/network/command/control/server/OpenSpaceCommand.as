package platform.client.fp10.core.network.command.control.server
{
   import alternativa.osgi.service.network.INetworkService;
   import alternativa.types.Long;
   import platform.client.fp10.core.network.ControlChannelContext;
   import platform.client.fp10.core.network.command.ControlCommand;
   import platform.client.fp10.core.network.command.IServerControlCommand;
   import platform.client.fp10.core.network.handler.SpaceCommandHandler;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.impl.Space;
   
   public class OpenSpaceCommand extends ControlCommand implements IServerControlCommand
   {
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var networkService:INetworkService;
      
      private var spaceId:Long;
      
      public function OpenSpaceCommand(_arg_1:Long)
      {
         super(ControlCommand.SV_OPEN_SPACE,"Open space");
         this.spaceId = _arg_1;
      }
      
      public function execute(_arg_1:ControlChannelContext) : void
      {
         var _local_2:SpaceCommandHandler = new SpaceCommandHandler(_arg_1.hash);
         var _local_3:Space = new Space(this.spaceId,_local_2,_arg_1.spaceProtocol,_arg_1.channelProtectionEnabled);
         spaceRegistry.addSpace(_local_3);
         _local_3.connect(networkService.controlServerAddress,networkService.controlServerPorts);
      }
   }
}

