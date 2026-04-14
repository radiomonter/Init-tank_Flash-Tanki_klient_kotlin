package forms
{
   import fl.controls.List;
   
   public class ConfigureScroll
   {
      
      public function ConfigureScroll()
      {
         super();
      }
      
      public static function configScrollList(_arg_1:List, _arg_2:Class, _arg_3:Class, _arg_4:Class, _arg_5:Class) : void
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
   }
}

