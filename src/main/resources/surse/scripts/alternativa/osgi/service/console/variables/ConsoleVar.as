package alternativa.osgi.service.console.variables
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.IConsole;
   
   public class ConsoleVar
   {
      
      protected var varName:String;
      
      protected var inputListener:Function;
      
      public function ConsoleVar(_arg_1:String, _arg_2:Function = null)
      {
         super();
         this.varName = _arg_1;
         this.inputListener = _arg_2;
         var _local_3:IConsole = IConsole(OSGi.getInstance().getService(IConsole));
         if(_local_3 != null)
         {
            _local_3.addVariable(this);
         }
      }
      
      public function getName() : String
      {
         return this.varName;
      }
      
      public function destroy() : void
      {
         var _local_1:IConsole = IConsole(OSGi.getInstance().getService(IConsole));
         if(_local_1 != null)
         {
            _local_1.removeVariable(this.varName);
         }
         this.inputListener = null;
      }
      
      public function acceptInput(_arg_1:String) : String
      {
         return "Not implemented";
      }
      
      public function toString() : String
      {
         return "Not implemented";
      }
   }
}

