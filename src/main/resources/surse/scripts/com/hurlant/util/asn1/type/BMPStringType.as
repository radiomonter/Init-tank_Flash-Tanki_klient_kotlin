package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   
   public class BMPStringType extends StringType
   {
      
      registerClassAlias("com.hurlant.util.asn1.BMPStringType",BMPStringType);
      
      public function BMPStringType(_arg_1:int = 2147483647, _arg_2:int = 0)
      {
         super(ASN1Type.BMP_STRING,_arg_1,_arg_2);
      }
   }
}

