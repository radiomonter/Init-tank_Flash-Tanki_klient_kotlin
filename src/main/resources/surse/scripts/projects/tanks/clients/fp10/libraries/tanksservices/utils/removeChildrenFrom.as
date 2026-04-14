package projects.tanks.clients.fp10.libraries.tanksservices.utils
{
   import flash.display.DisplayObjectContainer;
   
   public function removeChildrenFrom(_arg_1:DisplayObjectContainer) : void
   {
      while(_arg_1.numChildren > 0)
      {
         _arg_1.removeChildAt(_arg_1.numChildren - 1);
      }
   }
}

