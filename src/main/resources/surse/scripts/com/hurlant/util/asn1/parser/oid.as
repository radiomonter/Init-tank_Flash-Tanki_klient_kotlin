package com.hurlant.util.asn1.parser
{
   import com.hurlant.util.asn1.type.OIDType;
   
   public function oid(... _args) : OIDType
   {
      var _local_2:String = _args.length > 0 ? _args.join(".") : null;
      return new OIDType(_local_2);
   }
}

