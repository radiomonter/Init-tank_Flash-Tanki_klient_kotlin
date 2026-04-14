package alternativa.tanks.controller.events
{
   import flash.events.Event;
   
   public class SetPasswordChangeResultEvent extends Event
   {
      
      public static const SET:String = "SetPasswordChangeResultEvent.SET";
      
      public var error:String;
      
      public var success:Boolean;
      
      public function SetPasswordChangeResultEvent(_arg_1:Boolean, _arg_2:String)
      {
         this.success = _arg_1;
         this.error = _arg_2;
         super(SET);
      }
   }
}

