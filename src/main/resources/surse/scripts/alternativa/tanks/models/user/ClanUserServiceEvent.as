package alternativa.tanks.models.user
{
   import flash.events.Event;
   
   public class ClanUserServiceEvent extends Event
   {
      
      public static const HIDE_CLAN_WINDOW:String = "ClanUserServiceEvent.HIDE_CLAN_WINDOW";
      
      public function ClanUserServiceEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

