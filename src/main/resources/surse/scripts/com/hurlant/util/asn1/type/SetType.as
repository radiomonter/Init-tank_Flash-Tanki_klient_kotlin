package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class SetType extends ASN1Type
   {
      
      registerClassAlias("com.hurlant.util.asn1.SetType",SetType);
      
      public var childType:ASN1Type;
      
      public function SetType(_arg_1:ASN1Type = null)
      {
         super(ASN1Type.SET);
         this.childType = _arg_1;
      }
      
      override protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_5:Array = null;
         var _local_6:* = undefined;
         var _local_3:int = int(_arg_1.position);
         var _local_4:int = _arg_2;
         _local_5 = [];
         while(_local_4 > 0)
         {
            _local_6 = this.childType.fromDER(_arg_1,_local_4);
            if(_local_6 == null)
            {
               throw new Error("couldn\'t parse DER stream.");
            }
            _local_5.push(_local_6);
            _local_4 = _arg_2 - _arg_1.position + _local_3;
         }
         return _local_5;
      }
   }
}

