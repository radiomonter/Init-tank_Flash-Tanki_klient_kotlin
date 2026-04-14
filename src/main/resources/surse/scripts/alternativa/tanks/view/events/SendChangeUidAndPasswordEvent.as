package alternativa.tanks.view.events
{
   import flash.events.Event;
   
   public class SendChangeUidAndPasswordEvent extends Event
   {
      
      public static const EVENT_TYPE:String = "SendChangeUidAndPasswordEvent.EVENT_TYPE";
      
      private var _uid:String;
      
      private var _password:String;
      
      public function SendChangeUidAndPasswordEvent(_arg_1:String, _arg_2:String)
      {
         super(EVENT_TYPE);
         this._uid = _arg_1;
         this._password = _arg_2;
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      override public function clone() : Event
      {
         return new SendChangeUidAndPasswordEvent(this._uid,this._password);
      }
   }
}

