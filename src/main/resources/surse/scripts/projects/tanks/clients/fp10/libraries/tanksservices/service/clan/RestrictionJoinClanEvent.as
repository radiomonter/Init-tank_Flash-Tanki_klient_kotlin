package projects.tanks.clients.fp10.libraries.tanksservices.service.clan
{
   import flash.events.Event;
   
   public class RestrictionJoinClanEvent extends Event
   {
      
      public static const UPDATE:String = "RestrictionJoinClanEvent.UPDATE";
      
      public function RestrictionJoinClanEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

