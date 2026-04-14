package alternativa.osgi.service.logging.impl
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogTarget;
   import alternativa.osgi.service.logging.Logger;
   
   public class LoggerImpl implements Logger
   {
      
      private var logTarget:LogTarget;
      
      private var object:Object;
      
      public function LoggerImpl(_arg_1:Object, _arg_2:LogTarget)
      {
         super();
         this.object = _arg_1;
         this.logTarget = _arg_2;
      }
      
      public function trace(_arg_1:String, _arg_2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.TRACE,_arg_1,_arg_2);
      }
      
      public function debug(_arg_1:String, _arg_2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.DEBUG,_arg_1,_arg_2);
      }
      
      public function info(_arg_1:String, _arg_2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.INFO,_arg_1,_arg_2);
      }
      
      public function warning(_arg_1:String, _arg_2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.WARNING,_arg_1,_arg_2);
      }
      
      public function error(_arg_1:String, _arg_2:Array = null) : void
      {
         this.logTarget.log(this.object,LogLevel.ERROR,_arg_1,_arg_2);
      }
   }
}

