package projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices
{
   import flash.events.Event;
   
   public class AlertServiceEvent extends Event
   {
      
      public static const ALERT_BUTTON_PRESSED:String = "AlertServiceEvent.ALERT_BUTTON_PRESSED";
      
      public var typeButton:String;
      
      public function AlertServiceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.typeButton = _arg_2;
      }
   }
}

