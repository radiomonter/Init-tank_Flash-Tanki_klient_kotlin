package alternativa.tanks.controller.events.socialnetwork
{
   import flash.events.Event;
   
   public class StartExternalEntranceEvent extends Event
   {
      
      public static const START_REGISTRATION:String = "StartExternalEntranceEvent.START_REGISTRATION";
      
      public static const START_LOGIN:String = "StartExternalEntranceEvent.START_LOGIN";
      
      public var rememberMe:Boolean;
      
      public var socialNetworkId:String;
      
      public function StartExternalEntranceEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean)
      {
         this.socialNetworkId = _arg_2;
         this.rememberMe = _arg_3;
         super(_arg_1);
      }
      
      override public function clone() : Event
      {
         return new StartExternalEntranceEvent(type,this.socialNetworkId,this.rememberMe);
      }
   }
}

