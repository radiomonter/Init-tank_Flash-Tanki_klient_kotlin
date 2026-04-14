package alternativa.tanks.gui.friends
{
   import controls.base.DefaultButtonBase;
   
   public class FriendWindowButton extends DefaultButtonBase
   {
      
      private static const LABEL_MARGIN:int = 26;
      
      public function FriendWindowButton()
      {
         super();
      }
      
      override public function set width(_arg_1:Number) : void
      {
         var _local_2:int = Math.ceil(_label.textWidth) + LABEL_MARGIN;
         if(_local_2 > _arg_1)
         {
            super.width = _local_2;
         }
         else
         {
            super.width = _arg_1;
         }
      }
      
      override public function get width() : Number
      {
         return _width;
      }
   }
}

