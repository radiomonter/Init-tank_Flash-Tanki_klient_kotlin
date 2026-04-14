package projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties
{
   import flash.events.Event;
   
   public class UserPropertiesServiceEvent extends Event
   {
      
      public static const UPDATE_RANK:String = "UserPropertiesServiceEvent.UPDATE_RANK";
      
      public static const UPDATE_SCORE:String = "UserPropertiesServiceEvent.UPDATE_SCORE";
      
      public var userProperties:UserProperties;
      
      public function UserPropertiesServiceEvent(_arg_1:String, _arg_2:UserProperties, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.userProperties = _arg_2;
      }
   }
}

