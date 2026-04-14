package platform.client.fp10.core.network.connection.protection
{
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import flash.utils.IDataInput;
   import flash.utils.IDataOutput;
   import platform.client.fp10.core.network.connection.IProtectionContext;
   
   public class XorBasedProtectionContext implements IProtectionContext
   {
      
      private var serverSequence:Vector.<int>;
      
      private var serverSelector:int = 0;
      
      private var clientSequence:Vector.<int>;
      
      private var clientSelector:int = 0;
      
      private var initialSeed:int;
      
      public function XorBasedProtectionContext(_arg_1:ByteArray, _arg_2:Long)
      {
         var _local_3:int = 0;
         this.serverSequence = new Vector.<int>(8,true);
         this.clientSequence = new Vector.<int>(8,true);
         super();
         this.initialSeed = 0;
         while(_local_3 < 32)
         {
            this.initialSeed ^= _arg_1[_local_3];
            _local_3++;
         }
         this.initialSeed ^= _arg_2.high >> 24 & 0xFF;
         this.initialSeed ^= _arg_2.high >> 16 & 0xFF;
         this.initialSeed ^= _arg_2.high >> 8 & 0xFF;
         this.initialSeed ^= _arg_2.high >> 0 & 0xFF;
         this.initialSeed ^= _arg_2.low >> 24 & 0xFF;
         this.initialSeed ^= _arg_2.low >> 16 & 0xFF;
         this.initialSeed ^= _arg_2.low >> 8 & 0xFF;
         this.initialSeed ^= _arg_2.low >> 0 & 0xFF;
         this.initialSeed = this.initialSeed >= 128 ? int(this.initialSeed - 256) : int(this.initialSeed);
         this.reset();
      }
      
      public function reset() : void
      {
         var _local_1:int = 0;
         while(_local_1 < 8)
         {
            this.serverSequence[_local_1] = this.initialSeed ^ _local_1 << 3;
            this.clientSequence[_local_1] = this.initialSeed ^ _local_1 << 3 ^ 0x57;
            _local_1++;
         }
         this.serverSelector = 0;
         this.clientSelector = 0;
      }
      
      public function wrap(_arg_1:IDataOutput, _arg_2:ByteArray) : void
      {
         var _local_3:int = 0;
         while(_arg_2.bytesAvailable > 0)
         {
            _local_3 = _arg_2.readByte();
            _arg_1.writeByte(_local_3 ^ this.clientSequence[this.clientSelector]);
            this.clientSequence[this.clientSelector] = _local_3;
            this.clientSelector ^= _local_3 & 7;
         }
      }
      
      public function unwrap(_arg_1:ByteArray, _arg_2:IDataInput) : void
      {
         while(_arg_2.bytesAvailable > 0)
         {
            this.serverSequence[this.serverSelector] = _arg_2.readByte() ^ this.serverSequence[this.serverSelector];
            _arg_1.writeByte(this.serverSequence[this.serverSelector]);
            this.serverSelector ^= this.serverSequence[this.serverSelector] & 7;
         }
      }
   }
}

