package com.hurlant.util.asn1.type
{
   import flash.net.registerClassAlias;
   import flash.utils.ByteArray;
   
   public class ASN1Type
   {
      
      public static const CHOICE:int = -2;
      
      public static const ANY:int = -1;
      
      public static const RESERVED:int = 0;
      
      public static const BOOLEAN:int = 1;
      
      public static const INTEGER:int = 2;
      
      public static const BIT_STRING:int = 3;
      
      public static const OCTET_STRING:int = 4;
      
      public static const NULL:int = 5;
      
      public static const OID:int = 6;
      
      public static const ODT:int = 7;
      
      public static const EXTERNAL:int = 8;
      
      public static const REAL:int = 9;
      
      public static const ENUMERATED:int = 10;
      
      public static const EMBEDDED:int = 11;
      
      public static const UTF8STRING:int = 12;
      
      public static const ROID:int = 13;
      
      public static const SEQUENCE:int = 16;
      
      public static const SET:int = 17;
      
      public static const NUMERIC_STRING:int = 18;
      
      public static const PRINTABLE_STRING:int = 19;
      
      public static const TELETEX_STRING:int = 20;
      
      public static const VIDEOTEX_STRING:int = 21;
      
      public static const IA5_STRING:int = 22;
      
      public static const UTC_TIME:int = 23;
      
      public static const GENERALIZED_TIME:int = 24;
      
      public static const GRAPHIC_STRING:int = 25;
      
      public static const VISIBLE_STRING:int = 26;
      
      public static const GENERAL_STRING:int = 27;
      
      public static const UNIVERSAL_STRING:int = 28;
      
      public static const BMP_STRING:int = 30;
      
      public static const UNSTRUCTURED_NAME:int = 31;
      
      public static const UNIVERSAL:int = 0;
      
      public static const APPLICATION:int = 1;
      
      public static const CONTEXT:int = 2;
      
      public static const PRIVATE:int = 3;
      
      registerClassAlias("com.hurlant.util.asn1.ASN1Type",ASN1Type);
      
      public var optional:Boolean = false;
      
      public var implicitTag:Number = NaN;
      
      public var implicitClass:int = 0;
      
      public var explicitTag:Number = NaN;
      
      public var explicitClass:int = 0;
      
      public var defaultValue:* = null;
      
      public var extract:Boolean = false;
      
      public var defaultTag:Number;
      
      public var parsedTag:Number;
      
      public function ASN1Type(_arg_1:int)
      {
         super();
         this.defaultTag = _arg_1;
      }
      
      public function matches(_arg_1:int, _arg_2:int, _arg_3:int) : Boolean
      {
         return false;
      }
      
      public function clone() : ASN1Type
      {
         var _local_1:ByteArray = new ByteArray();
         _local_1.writeObject(this);
         _local_1.position = 0;
         return _local_1.readObject();
      }
      
      public function fromDER(_arg_1:ByteArray, _arg_2:int) : *
      {
         var _local_4:int = 0;
         var _local_5:* = undefined;
         var _local_6:int = 0;
         var _local_3:int = int(_arg_1.position);
         while(true)
         {
            if(!isNaN(this.explicitTag))
            {
               _local_6 = this.readDERTag(_arg_1,this.explicitClass,true);
               if(_local_6 != this.explicitTag)
               {
                  break;
               }
               _local_4 = this.readDERLength(_arg_1);
            }
            if(!isNaN(this.implicitTag))
            {
               _local_6 = this.readDERTag(_arg_1,this.implicitClass);
               if(_local_6 != this.implicitTag)
               {
                  break;
               }
            }
            else
            {
               _local_6 = this.readDERTag(_arg_1);
               if(this.defaultTag == ANY)
               {
                  this.parsedTag = _local_6;
               }
               else if(_local_6 != this.defaultTag)
               {
                  break;
               }
            }
            _local_4 = this.readDERLength(_arg_1);
            _local_5 = this.fromDERContent(_arg_1,_local_4);
            if(_local_5 != null)
            {
               return _local_5;
            }
            break;
         }
         _arg_1.position = _local_3;
         if(this.defaultValue != null)
         {
            return this.fromDefaultValue();
         }
         return null;
      }
      
      protected function fromDefaultValue() : *
      {
         return this.defaultValue;
      }
      
      protected function fromDERContent(_arg_1:ByteArray, _arg_2:int) : *
      {
         throw new Error("pure virtual function call: fromDERContent");
      }
      
      protected function readDERTag(_arg_1:ByteArray, _arg_2:int = 0, _arg_3:Boolean = false, _arg_4:Boolean = false) : int
      {
         var _local_8:int = 0;
         var _local_9:int = 0;
         var _local_5:int = int(_arg_1.readUnsignedByte());
         var _local_6:* = (_local_5 & 0x20) != 0;
         var _local_7:* = (_local_5 & 0xC0) >> 6;
         _local_5 &= 31;
         if(_local_5 == 31)
         {
            _local_5 = 0;
            do
            {
               _local_8 = int(_arg_1.readUnsignedByte());
               _local_9 = _local_8 & 0x7F;
               _local_5 = (_local_5 << 7) + _local_9;
            }
            while((_local_8 & 0x80) != 0);
         }
         if(_arg_2 != _local_7)
         {
         }
         return _local_5;
      }
      
      protected function readDERLength(_arg_1:ByteArray) : int
      {
         var _local_3:int = 0;
         var _local_2:int = int(_arg_1.readUnsignedByte());
         if(_local_2 >= 128)
         {
            _local_3 = _local_2 & 0x7F;
            _local_2 = 0;
            while(_local_3 > 0)
            {
               _local_2 = _local_2 << 8 | _arg_1.readUnsignedByte();
               _local_3--;
            }
         }
         return _local_2;
      }
   }
}

