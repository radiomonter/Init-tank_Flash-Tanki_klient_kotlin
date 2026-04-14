package alternativa.tanks.utils
{
   public class CircularObjectBuffer
   {
      
      private var buffer:Array;
      
      private var writeIndex:int;
      
      private var headIndex:int;
      
      public function CircularObjectBuffer(_arg_1:int)
      {
         super();
         this.buffer = new Array(_arg_1 + 1);
      }
      
      public function addObject(_arg_1:Object) : void
      {
         this.buffer[this.writeIndex] = _arg_1;
         this.writeIndex = this.incIndex(this.writeIndex);
         if(this.headIndex == this.writeIndex)
         {
            this.headIndex = this.incIndex(this.headIndex);
         }
      }
      
      public function clear() : void
      {
         var _local_2:int = 0;
         var _local_1:int = int(this.buffer.length);
         while(_local_2 < _local_1)
         {
            this.buffer[_local_2] = null;
            _local_2++;
         }
         this.headIndex = this.writeIndex = 0;
      }
      
      public function getObjects() : Array
      {
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_1:int = this.writeIndex - this.headIndex;
         if(_local_1 < 0)
         {
            _local_1 += this.buffer.length;
         }
         var _local_2:Array = new Array(_local_1);
         var _local_3:int = int(this.buffer.length);
         _local_4 = 0;
         _local_5 = this.headIndex;
         while(_local_4 < _local_1)
         {
            if(_local_5 == _local_3)
            {
               _local_5 = 0;
            }
            _local_2[_local_4] = this.buffer[_local_5];
            _local_4++;
            _local_5++;
         }
         return _local_2;
      }
      
      private function incIndex(_arg_1:int) : int
      {
         return ++_arg_1 == this.buffer.length ? 0 : _arg_1;
      }
   }
}

