package alternativa.osgi.service.dump
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.console.IConsole;
   import flash.utils.Dictionary;
   
   public class DumpService implements IDumpService
   {
      
      public function DumpService(_arg_1:OSGi)
      {
         super();
      }
      
      public function registerDumper(_arg_1:IDumper) : void
      {
      }
      
      public function unregisterDumper(_arg_1:String) : void
      {
      }
      
      public function dump(_arg_1:String, _arg_2:Array) : String
      {
         return "unsupported";
      }
      
      public function get dumpersByName() : Dictionary
      {
         return new Dictionary();
      }
      
      public function get dumpersList() : Vector.<IDumper>
      {
         return new Vector.<IDumper>();
      }
      
      private function getDumperList() : String
      {
         return "";
      }
      
      private function hadleConsoleCommand(_arg_1:IConsole, _arg_2:Array) : void
      {
      }
   }
}

