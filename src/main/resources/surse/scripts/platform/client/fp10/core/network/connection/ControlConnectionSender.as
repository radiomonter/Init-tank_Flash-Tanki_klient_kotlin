package platform.client.fp10.core.network.connection
{
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.service.transport.ITransportService;
   
   public class ControlConnectionSender implements ICommandSender
   {
      
      [Inject]
      public static var transportService:ITransportService;
      
      public function ControlConnectionSender()
      {
         super();
      }
      
      public function sendCommand(_arg_1:Object) : void
      {
         var _local_2:ICommandSender = null;
         if(transportService == null || (_local_2 = transportService.controlConnection) == null)
         {
            return;
         }
         _local_2.sendCommand(_arg_1);
      }
   }
}

