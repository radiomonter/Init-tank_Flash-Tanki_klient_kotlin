package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   
   public class UTF8StringType extends StringType
   {
      
      registerClassAlias("com.hurlant.util.asn1.UTF8String",UTF8StringType);
      
      public function UTF8StringType(_arg_1:int = 2147483647, _arg_2:int = 0)
      {
         super(ASN1Type.UTF8STRING,_arg_1,_arg_2);
      }
   }
}

