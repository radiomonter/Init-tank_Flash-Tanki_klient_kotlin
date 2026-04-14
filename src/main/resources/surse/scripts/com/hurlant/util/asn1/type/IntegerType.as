package com.hurlant.util.asn1.type
{
   import com.hurlant.math.BigInteger;
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class IntegerType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.IntegerType",IntegerType);
      
      public function IntegerType()
      {
         super(ASN1Type.INTEGER);
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_3:int = int(_arg_1.position);
         var _local_4:int = _arg_2;
         var _local_5:ByteArray = new ByteArray();
         _arg_1.readBytes(_local_5,0,_arg_2);
         _local_5.position = 0;
         var _local_6:BigInteger = new BigInteger(_local_5);
         if(_local_6.bitLength() < 31)
         {
            return _local_6.intValue();
         }
         return _local_6;
      }
   }
}

