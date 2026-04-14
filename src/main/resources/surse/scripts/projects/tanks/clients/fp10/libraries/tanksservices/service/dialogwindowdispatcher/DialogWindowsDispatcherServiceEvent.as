package projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher
{
   import flash.events.Event;
   
   public class DialogWindowsDispatcherServiceEvent extends Event
   {
      
      public static const OPEN:String = "DialogWindowsDispatcherServiceEvent.OPEN";
      
      public static const CLOSE:String = "DialogWindowsDispatcherServiceEvent.CLOSE";
      
      public static const FORCIBLY_CLOSE:String = "DialogWindowsDispatcherServiceEvent.FORCIBLY_CLOSE";
      
      public function DialogWindowsDispatcherServiceEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

