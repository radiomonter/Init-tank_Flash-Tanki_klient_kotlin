package alternativa.osgi.service.console
{
   import alternativa.osgi.service.logging.LogLevel;
   
   public class LogEntry
   {
      
      public var level:LogLevel;
      
      public var message:String;
      
      public var params:Array;
      
      public var object:Object;
      
      public var ordinal:int;
      
      public function LogEntry(_arg_1:int, _arg_2:Object, _arg_3:LogLevel, _arg_4:String, _arg_5:Array)
      {
         super();
         this.ordinal = _arg_1;
         this.object = _arg_2;
         this.params = _arg_5;
         this.message = _arg_4;
         this.level = _arg_3;
      }
   }
}

