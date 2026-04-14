package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class OIDType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.OIDType",OIDType);
      
      public var oid:String = null;
      
      public function OIDType(_arg_1:String = null)
      {
         super(ASN1Type.OID);
         this.oid = _arg_1;
      }
      
      public function toString() : String
      {
         return this.oid;
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_9:Boolean = false;
         var _local_7:uint = 0;
         var _local_3:int = int(_arg_1.position);
         var _local_4:uint = _arg_1.readUnsignedByte();
         var _local_5:int = _arg_2 - 1;
         var _local_6:Array = [];
         _local_6.push(uint(_local_4 / 40));
         _local_6.push(uint(_local_4 % 40));
         while(_local_5-- > 0)
         {
            _local_4 = _arg_1.readUnsignedByte();
            _local_9 = (_local_4 & 0x80) == 0;
            _local_4 &= 127;
            _local_7 = _local_7 * 128 + _local_4;
            if(_local_9)
            {
               _local_6.push(_local_7);
               _local_7 = 0;
            }
         }
         var _local_8:String = _local_6.join(".");
         if(this.oid != null)
         {
            if(this.oid == _local_8)
            {
               return this.clone();
            }
            _arg_1.position = _local_3;
            return null;
         }
         return new OIDType(_local_8);
      }
   }
}

