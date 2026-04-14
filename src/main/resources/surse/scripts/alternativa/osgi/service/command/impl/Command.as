package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class Command
   {
      
      public var cmd:String;
      
      public var handler:Function;
      
      public var argsType:Array;
      
      public var scope:String;
      
      private var _help:String;
      
      public function Command(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Array, _arg_5:Function)
      {
         super();
         this._help = _arg_3;
         this.scope = _arg_1;
         this.argsType = _arg_4;
         this.handler = _arg_5;
         this.cmd = _arg_2;
      }
      
      public function excute(_arg_1:Array, _arg_2:FormattedOutput) : void
      {
         var _local_4:int = 0;
         var _local_3:Array = new Array();
         _local_3[0] = _arg_2;
         while(_local_4 < _arg_1.length)
         {
            _local_3[_local_4 + 1] = _arg_1[_local_4];
            _local_4++;
         }
         this.handler.apply(null,_local_3);
      }
      
      public function help() : String
      {
         return this.argsType + " " + this._help;
      }
   }
}

