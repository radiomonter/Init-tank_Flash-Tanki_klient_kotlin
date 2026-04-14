package alternativa.tanks.view.battlelist.help
{
   import alternativa.tanks.help.BubbleHelper;
   import alternativa.tanks.help.HelperAlign;
   
   public class LockedMapsHelper extends BubbleHelper
   {
      
      public function LockedMapsHelper(_arg_1:String, _arg_2:int)
      {
         super();
         text = _arg_1;
         arrowLehgth = _arg_2;
         arrowAlign = HelperAlign.MIDDLE_LEFT;
         _showLimit = 5;
      }
   }
}

