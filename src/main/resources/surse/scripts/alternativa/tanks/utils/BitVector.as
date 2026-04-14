package alternativa.tanks.utils
{
   public class BitVector
   {
      
      private var elements:Vector.<int>;
      
      public function BitVector(_arg_1:uint)
      {
         super();
         this.elements = new Vector.<int>(_arg_1 >> 5,true);
      }
      
      public function setBit(_arg_1:int) : void
      {
         var _local_2:* = _arg_1 >> 5;
         this.elements[_local_2] |= 1 << (_arg_1 & 0x1F);
      }
      
      public function clearBit(_arg_1:int) : void
      {
         var _local_2:* = _arg_1 >> 5;
         this.elements[_local_2] &= ~(1 << (_arg_1 & 0x1F));
      }
      
      public function getBit(_arg_1:int) : int
      {
         var _local_2:* = _arg_1 >> 5;
         return this.elements[_local_2] >> (_arg_1 & 0x1F) & 1;
      }
      
      public function clear() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.elements.length)
         {
            this.elements[_local_1] = 0;
            _local_1++;
         }
      }
   }
}

