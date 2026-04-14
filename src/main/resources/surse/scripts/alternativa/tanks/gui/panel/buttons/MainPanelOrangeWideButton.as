package alternativa.tanks.gui.panel.buttons
{
   import flash.display.Bitmap;
   
   public class MainPanelOrangeWideButton extends MainPanelWideButton
   {
      
      private static const buttonNormal:Class = MainPanelOrangeWideButton_buttonNormal;
      
      private static const buttonNormalBitmap:Bitmap = new buttonNormal();
      
      private static const buttonOver:Class = MainPanelOrangeWideButton_buttonOver;
      
      private static const buttonOverBitmap:Bitmap = new buttonOver();
      
      public function MainPanelOrangeWideButton(_arg_1:Bitmap, _arg_2:int, _arg_3:int)
      {
         super(_arg_1,_arg_2,_arg_3,buttonOverBitmap,buttonNormalBitmap);
      }
   }
}

