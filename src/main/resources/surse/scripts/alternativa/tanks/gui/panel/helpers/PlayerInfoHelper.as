package alternativa.tanks.gui.panel.helpers
{
   import controls.Label;
   import utils.FontParamsUtil;
   
   public class PlayerInfoHelper
   {
      
      public function PlayerInfoHelper()
      {
         super();
      }
      
      public static function setDefaultSharpnessAndThickness(_arg_1:Label) : void
      {
         _arg_1.sharpness = FontParamsUtil.SHARPNESS_LABEL_BASE;
         _arg_1.thickness = FontParamsUtil.THICKNESS_LABEL_BASE;
      }
   }
}

