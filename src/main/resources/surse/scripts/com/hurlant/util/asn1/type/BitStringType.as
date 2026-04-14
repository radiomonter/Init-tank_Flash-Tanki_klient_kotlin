package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class BitStringType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.BitStringType",BitStringType);
      
      public function BitStringType()
      {
         super(ASN1Type.BIT_STRING);
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         _arg_1.readUnsignedByte();
         var _local_3:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_3,0,_arg_2 - 1);
         return _local_3;
      }
   }
}

