package alternativa.utils
{
   import flash.display.DisplayObjectContainer;
   
   public function removeDisplayObjectChildren(_arg_1:DisplayObjectContainer) : void
   {
      while(_arg_1.numChildren > 0)
      {
         _arg_1.removeChildAt(_arg_1.numChildren - 1);
      }
   }
}

