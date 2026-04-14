package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class StringType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.StringType",StringType);
      
      public var size1:int;
      
      public var size2:int;
      
      public function StringType(_arg_1:int, _arg_2:int = 2147483647, _arg_3:int = 0)
      {
         super(_arg_1);
         this.size1 = _arg_2;
         this.size2 = _arg_3;
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         return _arg_1.readMultiByte(_arg_2,"US-ASCII");
      }
   }
}

