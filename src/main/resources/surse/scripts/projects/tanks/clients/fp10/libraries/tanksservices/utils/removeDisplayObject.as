package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import flash.display.DisplayObject;
   
   public function removeDisplayObject(_arg_1:DisplayObject) : void
   {
      if(_arg_1 != null && _arg_1.parent != null)
      {
         _arg_1.parent.removeChild(_arg_1);
      }
   }
}

