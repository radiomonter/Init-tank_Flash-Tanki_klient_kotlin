package alternativa.tanks.service.clan
{
   import flash.events.Event;
   
   public class ClanMembersListEvent extends Event
   {
      
      public static const REMOVE_USER:String = "ClanMembersListEvent.REMOVE_USER";
      
      public static const ACCEPTED_USER:String = "ClanMembersListEvent.ACCEPTED_USER";
      
      public static const REJECT_USER:String = "ClanMembersListEvent.REJECT_USER";
      
      public static const REVOKE_USER:String = "ClanMembersListEvent.REVOKE_USER";
      
      public var userId:String;
      
      public var userUid:String;
      
      public function ClanMembersListEvent(_arg_1:String, _arg_2:String, _arg_3:String = "", _arg_4:Boolean = false, _arg_5:Boolean = false)
      {
         super(_arg_1,_arg_4,_arg_5);
         this.userId = _arg_2;
         this.userUid = _arg_3;
      }
   }
}

