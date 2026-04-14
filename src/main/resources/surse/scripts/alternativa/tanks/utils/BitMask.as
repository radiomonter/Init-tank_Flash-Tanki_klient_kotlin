package alternativa.tanks.utils
{
   public class BitMask
   {
      
      private var mask:int;
      
      public function BitMask(_arg_1:int = 0)
      {
         super();
         this.mask = _arg_1;
      }
      
      public function setBits(_arg_1:int) : void
      {
         this.mask |= _arg_1;
      }
      
      public function clearBits(_arg_1:int) : void
      {
         this.mask &= ~_arg_1;
      }
      
      public function setBit(_arg_1:int) : void
      {
         this.setBits(1 << _arg_1);
      }
      
      public function clearBit(_arg_1:int) : void
      {
         this.clearBits(1 << _arg_1);
      }
      
      public function getBitValue(_arg_1:int) : int
      {
         return 1 & this.mask >> _arg_1;
      }
      
      public function clear() : void
      {
         this.mask = 0;
      }
      
      public function isEmpty() : Boolean
      {
         return this.mask == 0;
      }
      
      public function hasAnyBit(_arg_1:int) : Boolean
      {
         return (this.mask & _arg_1) != 0;
      }
      
      public function change(_arg_1:int, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.setBits(_arg_1);
         }
         else
         {
            this.clearBits(_arg_1);
         }
      }
   }
}

