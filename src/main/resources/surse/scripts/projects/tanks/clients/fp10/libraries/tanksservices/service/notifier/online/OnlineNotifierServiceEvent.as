package projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online
{
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online.ClientOnlineNotifierData;
   
   public class OnlineNotifierServiceEvent extends Event
   {
      
      public static const SET_ONLINE:String = "OnlineNotifierServiceEvent.SET_ONLINE";
      
      public var users:Vector.<ClientOnlineNotifierData>;
      
      public function OnlineNotifierServiceEvent(_arg_1:String, _arg_2:Vector.<ClientOnlineNotifierData>, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.users = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

