package services.buttonbar
{
   import flash.events.EventDispatcher;
   import forms.events.MainButtonBarEvents;
   
   public class ButtonBarService extends EventDispatcher implements IButtonBarService
   {
      
      public function ButtonBarService()
      {
         super();
      }
      
      public function change(_arg_1:int) : void
      {
         dispatchEvent(new MainButtonBarEvents(_arg_1));
      }
   }
}

