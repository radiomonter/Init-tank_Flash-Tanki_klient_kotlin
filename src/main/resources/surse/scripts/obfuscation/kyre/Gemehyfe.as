package obfuscation.kyre
{
   import alternativa.tanks.utils.BitVector;
   
   public class Gemehyfe
   {
      
      private static const suqerided:int = 64;
      
      private static const instance:Gemehyfe = new Gemehyfe();
      
      private const ids:Vector.<int> = new Vector.<int>(suqerided,true);
      
      private const cony:BitVector = new BitVector(suqerided);
      
      private var vub:int;
      
      public function Gemehyfe()
      {
         super();
         this.reset();
      }
      
      public static function zoty() : int
      {
         return instance.papy();
      }
      
      public static function saqoqigo(_arg_1:int) : void
      {
         instance.release(_arg_1);
      }
      
      public static function qyhod() : void
      {
         instance.reset();
      }
      
      public function papy() : int
      {
         var _local_1:int = 0;
         if(this.vub < suqerided)
         {
            _local_1 = this.ids[this.vub++];
            this.cony.setBit(_local_1);
            return _local_1;
         }
         throw new Error();
      }
      
      public function release(_arg_1:int) : void
      {
         var _local_2:* = undefined;
         if(this.cony.getBit(_arg_1) == 1)
         {
            this.cony.clearBit(_arg_1);
            _local_2 = --this.vub;
            this.ids[_local_2] = _arg_1;
         }
      }
      
      public function reset() : void
      {
         var _local_1:int = 0;
         this.vub = 0;
         while(_local_1 < suqerided)
         {
            this.ids[_local_1] = _local_1;
            _local_1++;
         }
         this.cony.clear();
      }
   }
}

