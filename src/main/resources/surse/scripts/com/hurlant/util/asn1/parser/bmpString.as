package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.BMPStringType;
   
   public function bmpString(_arg_1:int = 2147483647, _arg_2:int = 0) : BMPStringType
   {
      return new BMPStringType(_arg_1,_arg_2);
   }
}

