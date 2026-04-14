package alternativa.tanks.utils.thirdparty
{
   import flash.utils.ByteArray;
   
   public class URIEncodingBitmap extends ByteArray
   {
      
      public function URIEncodingBitmap(_arg_1:String)
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         super();
         var _local_5:ByteArray = new ByteArray();
         _local_2 = 0;
         while(_local_2 < 16)
         {
            this.writeByte(0);
            _local_2++;
         }
         _local_5.writeUTFBytes(_arg_1);
         _local_5.position = 0;
         while(Boolean(_local_5.bytesAvailable))
         {
            _local_3 = _local_5.readByte();
            if(_local_3 <= 127)
            {
               this.position = _local_3 >> 3;
               _local_4 = this.readByte();
               _local_4 |= 1 << (_local_3 & 7);
               this.position = _local_3 >> 3;
               this.writeByte(_local_4);
            }
         }
      }
      
      public function ShouldEscape(_arg_1:String) : int
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:ByteArray = new ByteArray();
         _local_4.writeUTFBytes(_arg_1);
         _local_4.position = 0;
         _local_2 = _local_4.readByte();
         if(Boolean(_local_2 & 0x80))
         {
            return 0;
         }
         if(_local_2 < 31 || _local_2 == 127)
         {
            return _local_2;
         }
         this.position = _local_2 >> 3;
         _local_3 = this.readByte();
         if(Boolean(_local_3 & 1 << (_local_2 & 7)))
         {
            return _local_2;
         }
         return 0;
      }
   }
}

