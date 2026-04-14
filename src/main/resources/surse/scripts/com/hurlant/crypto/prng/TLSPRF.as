package com.hurlant.crypto.prng
{
   import com.hurlant.crypto.hash.HMAC;
   import com.hurlant.crypto.hash.MD5;
   import com.hurlant.crypto.hash.SHA1;
   import com.hurlant.util.Memory;
   import flash.utils.ByteArray;
   import flash.utils.IDataOutput;
   
   public class TLSPRF
   {
      
      private var seed:ByteArray;
      
      private var s1:ByteArray;
      
      private var s2:ByteArray;
      
      private var a1:ByteArray;
      
      private var a2:ByteArray;
      
      private var p1:ByteArray;
      
      private var p2:ByteArray;
      
      private var d1:ByteArray;
      
      private var d2:ByteArray;
      
      private var hmac_md5:HMAC;
      
      private var hmac_sha1:HMAC;
      
      public function TLSPRF(_arg_1:ByteArray, _arg_2:String, _arg_3:ByteArray)
      {
         super();
         var _local_4:int = int(Math.ceil(_arg_1.length / 2));
         var _local_5:ByteArray = new ByteArray();
         var _local_6:ByteArray = new ByteArray();
         _local_5.writeBytes(_arg_1,0,_local_4);
         _local_6.writeBytes(_arg_1,_arg_1.length - _local_4,_local_4);
         var _local_7:ByteArray = new ByteArray();
         _local_7.writeUTFBytes(_arg_2);
         _local_7.writeBytes(_arg_3);
         this.seed = _local_7;
         this.s1 = _local_5;
         this.s2 = _local_6;
         this.hmac_md5 = new HMAC(new MD5());
         this.hmac_sha1 = new HMAC(new SHA1());
         this.a1 = this.hmac_md5.compute(_local_5,this.seed);
         this.a2 = this.hmac_sha1.compute(_local_6,this.seed);
         this.p1 = new ByteArray();
         this.p2 = new ByteArray();
         this.d1 = new ByteArray();
         this.d2 = new ByteArray();
         this.d1.position = MD5.HASH_SIZE;
         this.d1.writeBytes(this.seed);
         this.d2.position = SHA1.HASH_SIZE;
         this.d2.writeBytes(this.seed);
      }
      
      public function nextBytes(_arg_1:IDataOutput, _arg_2:int) : void
      {
         while(Boolean(_arg_2--))
         {
            _arg_1.writeByte(this.nextByte());
         }
      }
      
      public function nextByte() : int
      {
         if(this.p1.bytesAvailable == 0)
         {
            this.more_md5();
         }
         if(this.p2.bytesAvailable == 0)
         {
            this.more_sha1();
         }
         return this.p1.readUnsignedByte() ^ this.p2.readUnsignedByte();
      }
      
      public function dispose() : void
      {
         this.seed = this.dba(this.seed);
         this.s1 = this.dba(this.s1);
         this.s2 = this.dba(this.s2);
         this.a1 = this.dba(this.a1);
         this.a2 = this.dba(this.a2);
         this.p1 = this.dba(this.p1);
         this.p2 = this.dba(this.p2);
         this.d1 = this.dba(this.d1);
         this.d2 = this.dba(this.d2);
         this.hmac_md5.dispose();
         this.hmac_md5 = null;
         this.hmac_sha1.dispose();
         this.hmac_sha1 = null;
         Memory.gc();
      }
      
      public function toString() : String
      {
         return "tls-prf";
      }
      
      private function dba(_arg_1:ByteArray) : ByteArray
      {
         var _local_2:uint = 0;
         while(_local_2 < _arg_1.length)
         {
            _arg_1[_local_2] = 0;
            _local_2++;
         }
         _arg_1.length = 0;
         return null;
      }
      
      private function more_md5() : void
      {
         this.d1.position = 0;
         this.d1.writeBytes(this.a1);
         var _local_1:int = int(this.p1.position);
         var _local_2:ByteArray = this.hmac_md5.compute(this.s1,this.d1);
         this.a1 = this.hmac_md5.compute(this.s1,this.a1);
         this.p1.writeBytes(_local_2);
         this.p1.position = _local_1;
      }
      
      private function more_sha1() : void
      {
         this.d2.position = 0;
         this.d2.writeBytes(this.a2);
         var _local_1:int = int(this.p2.position);
         var _local_2:ByteArray = this.hmac_sha1.compute(this.s2,this.d2);
         this.a2 = this.hmac_sha1.compute(this.s2,this.a2);
         this.p2.writeBytes(_local_2);
         this.p2.position = _local_1;
      }
   }
}

