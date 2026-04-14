package platform.client.fp10.core.network.command.control.client
{
   import platform.client.fp10.core.network.command.ControlCommand;
   
   public class LogCommand extends ControlCommand
   {
      
      public var level:int;
      
      public var channel:String;
      
      public var message:String;
      
      public function LogCommand(_arg_1:int, _arg_2:String, _arg_3:String)
      {
         super(ControlCommand.CL_LOG,"Log");
         this.level = _arg_1;
         this.channel = _arg_2;
         this.message = _arg_3;
      }
   }
}

