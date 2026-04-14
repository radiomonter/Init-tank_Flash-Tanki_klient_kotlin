package alternativa.protocol
{
   import flash.utils.ByteArray;
   
   public class OptionalMap
   {
      
      private var readPosition:int;
      
      private var size:int;
      
      private var map:ByteArray;
      
      public function OptionalMap(_arg_1:int = 0, _arg_2:ByteArray = null)
      {
         super();
         this.init(_arg_1,_arg_2);
      }
      
      public function getReadPosition() : int
      {
         return this.readPosition;
      }
      
      public function setReadPosition(_arg_1:int) : void
      {
         this.readPosition = _arg_1;
      }
      
      public function reset() : void
      {
         this.readPosition = 0;
      }
      
      public function init(_arg_1:int = 0, _arg_2:ByteArray = null) : void
      {
         this.map = _arg_2;
         if(_arg_2 == null)
         {
            this.map = new ByteArray();
         }
         else
         {
            this.map.position = 0;
         }
         this.size = _arg_1;
         this.readPosition = 0;
      }
      
      public function clear() : void
      {
         this.size = 0;
         this.readPosition = 0;
      }
      
      public function addBit(_arg_1:Boolean) : void
      {
         this.setBit(this.size,_arg_1);
         ++this.size;
      }
      
      public function hasNextBit() : Boolean
      {
         return this.readPosition < this.size;
      }
      
      public function Jul() : Boolean
      {
         if(this.readPosition >= this.size)
         {
            throw new Error("Index out of bounds: " + this.readPosition);
         }
         var _local_1:Boolean = this.getBit(this.readPosition);
         ++this.readPosition;
         return _local_1;
      }
      
      public function getMap() : ByteArray
      {
         return this.map;
      }
      
      public function getSize() : int
      {
         return this.size;
      }
      
      private function getBit(_arg_1:int) : Boolean
      {
         var _local_2:* = _arg_1 >> 3;
         var _local_3:* = 7 ^ _arg_1 & 7;
         this.map.position = _local_2;
         return (this.map.readByte() & 1 << _local_3) != 0;
      }
      
      private function setBit(_arg_1:int, _arg_2:Boolean) : void
      {
         var _local_3:* = _arg_1 >> 3;
         var _local_4:* = 7 ^ _arg_1 & 7;
         this.map.position = _local_3;
         if(_arg_2)
         {
            this.map.writeByte(int(this.map[_local_3] | 1 << _local_4));
         }
         else
         {
            this.map.writeByte(int(this.map[_local_3] & (0xFF ^ 1 << _local_4)));
         }
      }
      
      private function convertSize(_arg_1:int) : int
      {
         var _local_2:* = _arg_1 >> 3;
         var _local_3:int = (_arg_1 & 7) == 0 ? int(0) : int(1);
         return _local_2 + _local_3;
      }
      
      public function toString() : String
      {
         var _local_1:* = "readPosition: " + this.readPosition + " size:" + this.getSize() + " mask:";
         var _local_2:int = this.readPosition;
         var _local_3:int = this.readPosition;
         while(_local_3 < this.getSize())
         {
            _local_1 += !this.Jul() ? "0" : "1";
            _local_3++;
         }
         this.readPosition = _local_2;
         return _local_1;
      }
      
      public function clone() : OptionalMap
      {
         var _local_1:ByteArray = new ByteArray();
         _local_1.writeBytes(this.map,0,this.convertSize(this.size));
         var _local_2:OptionalMap = new OptionalMap(this.size,_local_1);
         _local_2.readPosition = this.readPosition;
         return _local_2;
      }
   }
}

