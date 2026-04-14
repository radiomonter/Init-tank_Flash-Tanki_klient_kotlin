package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   
   public class PrintableStringType extends StringType
   {
      
      registerClassAlias("com.hurlant.util.asn1.PrintableStringType",PrintableStringType);
      
      public function PrintableStringType(_arg_1:int = 2147483647, _arg_2:int = 0)
      {
         super(ASN1Type.PRINTABLE_STRING,_arg_1,_arg_2);
      }
   }
}

