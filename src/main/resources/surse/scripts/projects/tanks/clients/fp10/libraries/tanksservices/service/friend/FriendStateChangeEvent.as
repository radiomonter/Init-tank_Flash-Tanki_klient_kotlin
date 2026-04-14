package projects.tanks.clients.fp10.libraries.tanksservices.service.friend
{
   import flash.events.Event;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   
   public class FriendStateChangeEvent extends Event
   {
      
      public static const CHANGE:String = "FriendsStateChangeEvent.CHANGE";
      
      public var userId:String;
      
      public var state:FriendState;
      
      public var prevState:FriendState;
      
      public function FriendStateChangeEvent(_arg_1:String, _arg_2:String, _arg_3:FriendState, _arg_4:FriendState, _arg_5:Boolean = false, _arg_6:Boolean = false)
      {
         this.userId = _arg_2;
         this.state = _arg_3;
         this.prevState = _arg_4;
         super(_arg_1,_arg_5,_arg_6);
      }
   }
}

