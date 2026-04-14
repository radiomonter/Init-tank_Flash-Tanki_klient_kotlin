package com.hurlant.crypto.tls
{
   import com.hurlant.crypto.Crypto;
   import com.hurlant.crypto.hash.HMAC;
   import com.hurlant.crypto.hash.MAC;
   
   public class MACs
   {
      
      public static const NULL:uint = 0;
      
      public static const MD5:uint = 1;
      
      public static const SHA1:uint = 2;
      
      public function MACs()
      {
         super();
      }
      
      public static function getHashSize(_arg_1:uint) : uint
      {
         return [0,16,20][_arg_1];
      }
      
      public static function getPadSize(_arg_1:uint) : int
      {
         return [0,48,40][_arg_1];
      }
      
      public static function getHMAC(_arg_1:uint) : HMAC
      {
         if(_arg_1 == NULL)
         {
            return null;
         }
         return Crypto.getHMAC(["","md5","sha1"][_arg_1]);
      }
      
      public static function getMAC(_arg_1:uint) : MAC
      {
         return Crypto.getMAC(["","md5","sha1"][_arg_1]);
      }
   }
}

