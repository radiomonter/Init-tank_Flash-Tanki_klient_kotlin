package projects.tanks.clients.flash.commons.services.layout
{
   import flash.events.Event;
   import projects.tanks.client.commons.models.layout.LayoutState;
   
   public class LobbyLayoutServiceEvent extends Event
   {
      
      public static const BEGIN_LAYOUT_SWITCH:String = "LobbyLayoutServiceEvent.BEGIN_LAYOUT_SWITCH";
      
      public static const END_LAYOUT_SWITCH:String = "LobbyLayoutServiceEvent.END_LAYOUT_SWITCH";
      
      public var state:LayoutState;
      
      public function LobbyLayoutServiceEvent(_arg_1:String, _arg_2:LayoutState, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.state = _arg_2;
      }
   }
}

