package alternativa.tanks.controller.events.socialnetwork
{
   import flash.events.Event;
   
   public class FinishExternalRegisterEvent extends Event
   {
      
      public static const FINISH_REGISTRATION:String = "FinishExternalRegisterEvent.FINISH_REGISTRATION";
      
      public var uid:String;
      
      public function FinishExternalRegisterEvent(_arg_1:String)
      {
         super(FINISH_REGISTRATION);
         this.uid = _arg_1;
      }
      
      override public function clone() : Event
      {
         return new FinishExternalRegisterEvent(this.uid);
      }
   }
}

