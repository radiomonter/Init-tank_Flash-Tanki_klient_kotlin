package projects.tanks.clients.fp10.libraries.tanksservices.service.blur
{
   import flash.events.Event;
   
   public class BlurServiceEvent extends Event
   {
      
      public static const CLICK_OVERLAY_BATTLE_CONTENT:String = "BlurServiceEvent.CLICK_OVERLAY_BATTLE_CONTENT";
      
      public function BlurServiceEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
   }
}

