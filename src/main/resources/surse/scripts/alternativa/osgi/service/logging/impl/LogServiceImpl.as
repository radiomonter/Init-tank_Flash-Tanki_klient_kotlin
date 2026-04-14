package alternativa.osgi.service.logging.impl
{
   import alternativa.osgi.service.logging.LogLevel;
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.LogTarget;
   import alternativa.osgi.service.logging.Logger;
   
   public class LogServiceImpl implements LogService, LogTarget
   {
      
      private var logTargets:Vector.<LogTarget> = new Vector.<LogTarget>();
      
      public function LogServiceImpl()
      {
         super();
      }
      
      public function getLogger(_arg_1:Object) : Logger
      {
         return new LoggerImpl(_arg_1,this);
      }
      
      public function addLogTarget(_arg_1:LogTarget) : void
      {
         if(this.logTargets.indexOf(_arg_1) < 0)
         {
            this.logTargets.push(_arg_1);
         }
      }
      
      public function removeLogTarget(_arg_1:LogTarget) : void
      {
         var _local_2:int = this.logTargets.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.logTargets = this.logTargets.splice(_local_2,1);
         }
      }
      
      public function log(object:Object, level:LogLevel, message:String, params:Array = null) : void
      {
         var logTarget:LogTarget = null;
         for each(logTarget in this.logTargets)
         {
            try
            {
               logTarget.log(object,level,message,params);
            }
            catch(e:Error)
            {
            }
         }
      }
   }
}

