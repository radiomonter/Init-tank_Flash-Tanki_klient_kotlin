package obfuscation.lucaby
{
   public class Pehiluwu
   {
      
      private var _serverHalt:Boolean;
      
      public function Pehiluwu(_arg_1:Boolean = false)
      {
         super();
         this._serverHalt = _arg_1;
      }
      
      public function get serverHalt() : Boolean
      {
         return this._serverHalt;
      }
      
      public function set serverHalt(_arg_1:Boolean) : void
      {
         this._serverHalt = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ServerHaltEntranceCC [";
         _local_1 += "serverHalt = " + this.serverHalt + " ";
         return _local_1 + "]";
      }
   }
}

