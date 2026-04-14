package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import flash.display.BitmapData;
   
   public function disposeBitmapsData(_arg_1:Array) : void
   {
      var _local_2:BitmapData = null;
      var _local_3:int = 0;
      var _local_4:int = 0;
      if(_arg_1 != null)
      {
         _local_3 = int(_arg_1.length);
         _local_4 = 0;
         while(_local_4 < _local_3)
         {
            _local_2 = _arg_1[_local_4];
            _local_2.dispose();
            _local_4++;
         }
         _arg_1 = null;
      }
   }
}

