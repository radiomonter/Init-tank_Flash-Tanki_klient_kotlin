package com.hurlant.crypto.symmetric
{
   import flash.utils.ByteArray;
   
   public class NullPad implements IPad
   {
      
      public function NullPad()
      {
         super();
      }
      
      public function unpad(_arg_1:ByteArray) : void
      {
      }
      
      public function pad(_arg_1:ByteArray) : void
      {
      }
      
      public function setBlockSize(_arg_1:uint) : void
      {
      }
   }
}

