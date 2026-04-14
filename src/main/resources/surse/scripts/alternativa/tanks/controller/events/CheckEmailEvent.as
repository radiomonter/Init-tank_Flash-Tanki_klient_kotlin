package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class CheckEmailEvent extends Event
   {
      
      public static const CHECK_EMAIL:String = "CheckEmailEvent.CHECK_EMAIL";
      
      private var _email:String;
      
      public function CheckEmailEvent(_arg_1:String)
      {
         super(CHECK_EMAIL);
         this._email = _arg_1;
      }
      
      public function get email() : String
      {
         return this._email;
      }
      
      override public function clone() : Event
      {
         return new CheckEmailEvent(this.email);
      }
   }
}

