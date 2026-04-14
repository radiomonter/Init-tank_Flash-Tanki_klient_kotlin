package obfuscation.jykyliv
{
   import controls.base.LabelBase;
   import flash.events.FocusEvent;
   import flash.text.TextField;
   import forms.ColorConstants;
   
   public class Jikipus extends LabelBase
   {
      
      private var input:TextField;
      
      public function Jikipus(_arg_1:TextField)
      {
         super();
         this.input = _arg_1;
         _arg_1.addEventListener(FocusEvent.FOCUS_IN,this.fafo);
         _arg_1.addEventListener(FocusEvent.FOCUS_OUT,this.roqepuj);
         mouseEnabled = false;
         color = ColorConstants.LIST_LABEL_HINT;
      }
      
      private function fafo(_arg_1:FocusEvent) : void
      {
         visible = false;
      }
      
      private function roqepuj(_arg_1:FocusEvent) : void
      {
         if(this.input.text.length == 0)
         {
            visible = true;
         }
      }
   }
}

