package alternativa.tanks.gui.panel.buttons
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class DailyQuestsButton extends MainPanelSmallButton
   {
      
      private static const startIconClass:Class = DailyQuestsButton_startIconClass;
      
      private static const starIcon:BitmapData = Bitmap(new startIconClass()).bitmapData;
      
      private static const INDICATOR_X_OFFSET:int = 10;
      
      private static const INDICATOR_Y_OFFSET:int = -4;
      
      public function DailyQuestsButton()
      {
         super(starIcon,3,4);
      }
   }
}

