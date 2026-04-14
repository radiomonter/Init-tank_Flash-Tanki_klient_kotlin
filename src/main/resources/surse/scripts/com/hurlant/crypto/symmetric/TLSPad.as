package com.hurlant.crypto.symmetric
{
   import com.hurlant.crypto.tls.TLSError;
   import flash.utils.ByteArray;
   
   public class TLSPad implements IPad
   {
      
      private var blockSize:uint;
      
      public function TLSPad(_arg_1:uint = 0)
      {
         super();
         this.blockSize = _arg_1;
      }
      
      public function pad(_arg_1:ByteArray) : void
      {
         var _local_3:uint = 0;
         var _local_2:uint = this.blockSize - (_arg_1.length + 1) % this.blockSize;
         while(_local_3 <= _local_2)
         {
            _arg_1[_arg_1.length] = _local_2;
            _local_3++;
         }
      }
      
      public function unpad(_arg_1:ByteArray) : void
      {
         var _local_4:uint = 0;
         var _local_2:uint = _arg_1.length % this.blockSize;
         if(_local_2 != 0)
         {
            throw new TLSError("TLSPad::unpad: ByteArray.length isn\'t a multiple of the blockSize",TLSError.bad_record_mac);
         }
         _local_2 = uint(_arg_1[_arg_1.length - 1]);
         var _local_3:uint = _local_2;
         while(_local_3 > 0)
         {
            _local_4 = uint(_arg_1[_arg_1.length - 1]);
            --_arg_1.length;
            if(_local_2 != _local_4)
            {
               throw new TLSError("TLSPad:unpad: Invalid padding value. expected [" + _local_2 + "], found [" + _local_4 + "]",TLSError.bad_record_mac);
            }
            _local_3--;
         }
         --_arg_1.length;
      }
      
      public function setBlockSize(_arg_1:uint) : void
      {
         this.blockSize = _arg_1;
      }
   }
}

