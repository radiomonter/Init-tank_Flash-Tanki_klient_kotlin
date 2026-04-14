package alternativa.tanks.controller.events.showform
{
   import flash.events.Event;
   
   public class ShowChangeEmailAndPasswordFormEvent extends Event
   {
      
      public static const SHOW:String = "ShowChangeEmailAndPasswordFormEvent.SHOW";
      
      private var _email:String;
      
      public function ShowChangeEmailAndPasswordFormEvent(_arg_1:String)
      {
         super(SHOW);
         this._email = _arg_1;
      }
      
      public function get email() : String
      {
         return this._email;
      }
   }
}

