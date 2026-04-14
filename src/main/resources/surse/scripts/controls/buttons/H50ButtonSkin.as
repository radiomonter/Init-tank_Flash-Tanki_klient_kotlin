package controls.buttons
{
   import controls.FixedHeightRectangleSkin;
   
   public class H50ButtonSkin extends FixedHeightButtonSkin
   {
      
      private static const leftClass:Class = H50ButtonSkin_leftClass;
      
      private static const rightClass:Class = H50ButtonSkin_rightClass;
      
      private static const middleClass:Class = H50ButtonSkin_middleClass;
      
      private static const fixedHeightRectangleSkin:FixedHeightRectangleSkin = new FixedHeightRectangleSkin(leftClass,middleClass,rightClass);
      
      public function H50ButtonSkin(_arg_1:FixedHeightRectangleSkin, _arg_2:FixedHeightRectangleSkin, _arg_3:FixedHeightRectangleSkin)
      {
         super(_arg_1,_arg_2,_arg_3,fixedHeightRectangleSkin);
      }
   }
}

