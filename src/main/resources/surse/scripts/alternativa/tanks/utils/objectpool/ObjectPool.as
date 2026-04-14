package alternativa.tanks.utils.objectpool
{
   import flash.utils.Dictionary;
   
   public class ObjectPool
   {
      
      private var lazehe:Dictionary = new Dictionary();
      
      public function ObjectPool()
      {
         super();
      }
      
      public function getObject(_arg_1:Class) : Object
      {
         return this.maferu(_arg_1).getObject();
      }
      
      public function clear() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.lazehe)
         {
            Pool(this.lazehe[_local_1]).clear();
            delete this.lazehe[_local_1];
         }
      }
      
      public function qep(_arg_1:Class) : void
      {
         var _local_2:Pool = this.lazehe[_arg_1];
         if(_local_2 != null)
         {
            _local_2.clear();
         }
      }
      
      [Obfuscation(rename="false")]
      public function toString() : String
      {
         var _local_2:Pool = null;
         var _local_1:* = undefined;
         var _local_3:* = "";
         for(_local_1 in this.lazehe)
         {
            _local_2 = this.lazehe[_local_1];
            _local_3 += _local_1 + ": " + _local_2.lihahody() + "\n";
         }
         return _local_3;
      }
      
      private function maferu(_arg_1:Class) : Pool
      {
         var _local_2:Pool = this.lazehe[_arg_1];
         if(_local_2 == null)
         {
            _local_2 = new Pool(_arg_1);
            this.lazehe[_arg_1] = _local_2;
         }
         return _local_2;
      }
   }
}

