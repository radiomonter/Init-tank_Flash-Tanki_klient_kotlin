package utils
{
   import controls.scroller.blue.ScrollSkinBlue;
   import controls.scroller.blue.ScrollThumbSkinBlue;
   import controls.scroller.gray.ScrollSkinGray;
   import controls.scroller.gray.ScrollThumbSkinGray;
   import controls.scroller.green.ScrollSkinGreen;
   import controls.scroller.green.ScrollThumbSkinGreen;
   import controls.scroller.red.ScrollSkinRed;
   import controls.scroller.red.ScrollThumbSkinRed;
   import fl.core.UIComponent;
   
   public class ScrollStyleUtils
   {
      
      public function ScrollStyleUtils()
      {
         super();
      }
      
      public static function setStyle(_arg_1:UIComponent, _arg_2:Class, _arg_3:Class, _arg_4:Class, _arg_5:Class) : void
      {
         _arg_1.setStyle("downArrowUpSkin",_arg_2);
         _arg_1.setStyle("downArrowDownSkin",_arg_2);
         _arg_1.setStyle("downArrowOverSkin",_arg_2);
         _arg_1.setStyle("downArrowDisabledSkin",_arg_2);
         _arg_1.setStyle("upArrowUpSkin",_arg_3);
         _arg_1.setStyle("upArrowDownSkin",_arg_3);
         _arg_1.setStyle("upArrowOverSkin",_arg_3);
         _arg_1.setStyle("upArrowDisabledSkin",_arg_3);
         _arg_1.setStyle("trackUpSkin",_arg_4);
         _arg_1.setStyle("trackDownSkin",_arg_4);
         _arg_1.setStyle("trackOverSkin",_arg_4);
         _arg_1.setStyle("trackDisabledSkin",_arg_4);
         _arg_1.setStyle("thumbUpSkin",_arg_5);
         _arg_1.setStyle("thumbDownSkin",_arg_5);
         _arg_1.setStyle("thumbOverSkin",_arg_5);
         _arg_1.setStyle("thumbDisabledSkin",_arg_5);
      }
      
      public static function setGreenStyle(_arg_1:UIComponent) : void
      {
         setStyle(_arg_1,ScrollSkinGreen.trackBottom,ScrollSkinGreen.trackTop,ScrollSkinGreen.track,ScrollThumbSkinGreen);
      }
      
      public static function setGrayStyle(_arg_1:UIComponent) : void
      {
         setStyle(_arg_1,ScrollSkinGray.trackBottom,ScrollSkinGray.trackTop,ScrollSkinGray.track,ScrollThumbSkinGray);
      }
      
      public static function setBlueStyle(_arg_1:UIComponent) : void
      {
         setStyle(_arg_1,ScrollSkinBlue.trackBottom,ScrollSkinBlue.trackTop,ScrollSkinBlue.track,ScrollThumbSkinBlue);
      }
      
      public static function setRedStyle(_arg_1:UIComponent) : void
      {
         setStyle(_arg_1,ScrollSkinRed.trackBottom,ScrollSkinRed.trackTop,ScrollSkinRed.track,ScrollThumbSkinRed);
      }
   }
}

