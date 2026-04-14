package controls.buttons
{
   import assets.button.button_def_DOWN_CENTER;
   import assets.button.button_def_DOWN_LEFT;
   import assets.button.button_def_DOWN_RIGHT;
   import assets.button.button_def_OVER_CENTER;
   import assets.button.button_def_OVER_LEFT;
   import assets.button.button_def_OVER_RIGHT;
   import assets.button.button_def_UP_CENTER;
   import assets.button.button_def_UP_LEFT;
   import assets.button.button_def_UP_RIGHT;
   import controls.FixedHeightRectangleSkin;
   import controls.buttons.h30px.GreenMediumButtonSkin;
   import flash.display.BitmapData;
   
   public class CategoryButtonSkin extends FixedHeightButtonSkin
   {
      
      public function CategoryButtonSkin()
      {
         super(createStateSkinByBitmaps(new button_def_UP_LEFT(1,1),new button_def_UP_CENTER(1,1),new button_def_UP_RIGHT(1,1)),createStateSkinByBitmaps(new button_def_OVER_LEFT(1,1),new button_def_OVER_CENTER(1,1),new button_def_OVER_RIGHT(1,1)),createStateSkinByBitmaps(new button_def_DOWN_LEFT(1,1),new button_def_DOWN_CENTER(1,1),new button_def_DOWN_RIGHT(1,1)),createStateSkin(GreenMediumButtonSkin.leftDownClass,GreenMediumButtonSkin.middleDownClass,GreenMediumButtonSkin.rightDownClass));
      }
      
      private static function createStateSkinByBitmaps(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:BitmapData) : FixedHeightRectangleSkin
      {
         return FixedHeightRectangleSkin.createSkin(_arg_1,_arg_2,_arg_3);
      }
      
      private static function createStateSkin(_arg_1:Class, _arg_2:Class, _arg_3:Class) : FixedHeightRectangleSkin
      {
         return new FixedHeightRectangleSkin(_arg_1,_arg_2,_arg_3);
      }
   }
}

