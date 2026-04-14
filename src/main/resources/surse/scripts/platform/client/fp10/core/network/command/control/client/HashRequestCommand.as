package platform.client.fp10.core.network.command.control.client
{
   import platform.client.fp10.core.network.command.ControlCommand;
   import platform.client.fp10.core.network.command.IConnectionInitCommand;
   
   public class HashRequestCommand extends ControlCommand implements IConnectionInitCommand
   {
      
      public var parameterNames:Array;
      
      public var parameterValues:Array;
      
      public function HashRequestCommand(_arg_1:Array, _arg_2:Array)
      {
         super(ControlCommand.CL_HASH_REQUEST,"Hash request");
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter parameterNames is null");
         }
         if(_arg_2 == null)
         {
            throw new ArgumentError("Parameter parameterValues is null");
         }
         this.parameterNames = _arg_1;
         this.parameterValues = _arg_2;
      }
   }
}

