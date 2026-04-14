package alternativa.utils
{
   import flash.utils.Dictionary;
   
   public function clearDictionary(_arg_1:Dictionary) : void
   {
      var _local_2:* = undefined;
      for(_local_2 in _arg_1)
      {
         delete _arg_1[_local_2];
      }
   }
}

