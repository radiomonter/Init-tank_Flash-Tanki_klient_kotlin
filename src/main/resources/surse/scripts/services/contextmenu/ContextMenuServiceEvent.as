package services.contextmenu
{
   import flash.events.Event;
   
   public class ContextMenuServiceEvent extends Event
   {
      
      public static const WRITE_IN_CHAT:String = "ContextMenuServiceEvent.WRITE_IN_CHAT";
      
      public static const REMOVE_FROM_FRIENDS:String = "ContextMenuServiceEvent.REMOVE_FROM_FRIENDS";
      
      public static const REJECT_REQUEST:String = "ContextMenuServiceEvent.REJECT_REQUEST";
      
      public static const ACCEPT_REQUEST:String = "ContextMenuServiceEvent.ACCEPT_REQUEST";
      
      public static const CANCEL_REQUEST:String = "ContextMenuServiceEvent.CANCEL_REQUEST";
      
      public static const FOCUS_ON_USER:String = "ContextMenuServiceEvent.FOCUS_ON_USER";
      
      public var userId:String;
      
      public var uid:String;
      
      public function ContextMenuServiceEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean = false, _arg_5:Boolean = false)
      {
         this.userId = _arg_2;
         this.uid = _arg_3;
         super(_arg_1,_arg_4,_arg_5);
      }
   }
}

