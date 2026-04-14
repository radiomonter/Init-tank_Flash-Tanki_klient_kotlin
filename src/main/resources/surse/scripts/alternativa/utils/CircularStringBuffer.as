package alternativa.utils
{
   public class CircularStringBuffer implements ICircularStringBuffer
   {
      
      public var strings:Vector.<String>;
      
      public var headIndex:int;
      
      public var tailIndex:int;
      
      private var _capacity:int;
      
      public function CircularStringBuffer(_arg_1:int)
      {
         super();
         this._capacity = _arg_1;
         this.strings = new Vector.<String>(this._capacity + 1);
      }
      
      public function add(_arg_1:String) : void
      {
         this.strings[this.tailIndex] = _arg_1;
         this.tailIndex = this.incIndex(this.tailIndex);
         if(this.tailIndex == this.headIndex)
         {
            this.headIndex = this.incIndex(this.headIndex);
         }
      }
      
      public function clear() : void
      {
         var _local_2:int = 0;
         this.headIndex = 0;
         this.tailIndex = 0;
         var _local_1:int = int(this.strings.length);
         while(_local_2 < _local_1)
         {
            this.strings[_local_2] = null;
            _local_2++;
         }
      }
      
      public function get size() : int
      {
         var _local_1:int = this.tailIndex - this.headIndex;
         if(_local_1 < 0)
         {
            _local_1 += this.strings.length;
         }
         return _local_1;
      }
      
      public function get capacity() : int
      {
         return this._capacity;
      }
      
      public function getStrings() : Vector.<String>
      {
         var _local_1:Vector.<String> = new Vector.<String>();
         var _local_2:int = this.headIndex;
         while(_local_2 != this.tailIndex)
         {
            _local_1.push(this.strings[_local_2]);
            _local_2 = this.incIndex(_local_2);
         }
         return _local_1;
      }
      
      public function set capacity(_arg_1:int) : void
      {
         throw new Error("Unimplemented");
      }
      
      public function getIterator(_arg_1:int) : IStringBufferIterator
      {
         return new Iterator(this,_arg_1);
      }
      
      private function incIndex(_arg_1:int) : int
      {
         return ++_arg_1 >= this.strings.length ? int(0) : int(_arg_1);
      }
   }
}

class Iterator implements IStringBufferIterator
{
   
   internal var buffer:CircularStringBuffer;
   
   internal var index:int;
   
   public function Iterator(_arg_1:CircularStringBuffer, _arg_2:int)
   {
      super();
      if(_arg_2 < 0 || _arg_2 > _arg_1.size)
      {
         throw new Error("Index " + _arg_2 + " is out of range [0, " + _arg_1.size + "]");
      }
      this.buffer = _arg_1;
      var _local_3:uint = _arg_1.strings.length;
      this.index = _arg_1.headIndex + _arg_2 - 1;
      if(this.index < 0)
      {
         this.index = _local_3 - 1;
      }
      if(this.index >= _local_3)
      {
         this.index -= _local_3;
      }
   }
   
   public function hasNext() : Boolean
   {
      return this.incIndex(this.index) != this.buffer.tailIndex;
   }
   
   public function getNext() : String
   {
      this.index = this.incIndex(this.index);
      if(this.index == this.buffer.tailIndex)
      {
         throw new Error("End of buffer");
      }
      return this.buffer.strings[this.index];
   }
   
   internal function incIndex(_arg_1:int) : int
   {
      return ++_arg_1 >= this.buffer.strings.length ? int(0) : int(_arg_1);
   }
}
