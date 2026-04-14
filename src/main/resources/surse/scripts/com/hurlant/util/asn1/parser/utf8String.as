package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.UTF8StringType;
   
   public function utf8String(_arg_1:int = 2147483647, _arg_2:int = 0) : UTF8StringType
   {
      return new UTF8StringType(_arg_1,_arg_2);
   }
}

