package obfuscation.lokofobiv
{
   import flash.utils.Dictionary;
   
   public class Lubeno
   {
      
      private var buffer:Dictionary = new Dictionary();
      
      public function Lubeno()
      {
         super();
      }
      
      public function add(_arg_1:String, _arg_2:int) : void
      {
         this.buffer[_arg_1] = _arg_2;
      }
      
      public function remove(_arg_1:String) : void
      {
         delete this.buffer[_arg_1];
      }
      
      public function kike(_arg_1:String) : int
      {
         var _local_2:int = 0;
         if(this.buffer[_arg_1] != undefined)
         {
            _local_2 = int(this.buffer[_arg_1]);
            delete this.buffer[_arg_1];
            return _local_2;
         }
         return -1;
      }
   }
}

