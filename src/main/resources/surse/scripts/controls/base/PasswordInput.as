package controls.base
{
   import flash.utils.setTimeout;
   import forms.ColorConstants;
   
   public class PasswordInput extends TankInputBase
   {
      
      public function PasswordInput()
      {
         super();
      }
      
      override public function set enable(_arg_1:Boolean) : void
      {
         super.enable = _arg_1;
         setTimeout(this.setTextColor,0);
      }
      
      private function setTextColor() : void
      {
         textField.textColor = textField.selectable ? ColorConstants.WHITE : ColorConstants.INPUT_DISABLED;
      }
   }
}

