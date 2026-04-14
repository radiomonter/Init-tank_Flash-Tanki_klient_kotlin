package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   
   public class TeletexStringType extends StringType
   {
      
      registerClassAlias("com.hurlant.util.asn1.TeletexStringType",TeletexStringType);
      
      public function TeletexStringType(_arg_1:int = 2147483647, _arg_2:int = 0)
      {
         super(ASN1Type.TELETEX_STRING,_arg_1,_arg_2);
      }
   }
}

