package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class OctetStringType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.parser.OctetStringType",OctetStringType);
      
      public function OctetStringType()
      {
         super(ASN1Type.OCTET_STRING);
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_3:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_3,0,_arg_2);
         return _local_3;
      }
   }
}

