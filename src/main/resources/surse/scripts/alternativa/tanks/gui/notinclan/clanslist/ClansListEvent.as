package alternativa.tanks.gui.notinclan.clanslist
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class ClansListEvent extends Event
   {
      
      private static var dispatcher:EventDispatcher;
      
      public static const REMOVE:String = "ClansListEvent.REMOVE";
      
      public static const ADD:String = "ClansListEvent.ADD";
      
      public static const INCOMING:String = "ClansListEvent.INCOMING";
      
      public static const OUTGOING:String = "ClansListEvent.OUTGOING";
      
      public var clanId:String;
      
      public function ClansListEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         super(_arg_1,_arg_3,_arg_4);
         this.clanId = _arg_2;
      }
      
      public static function getDispatcher() : EventDispatcher
      {
         if(dispatcher == null)
         {
            dispatcher = new EventDispatcher();
         }
         return dispatcher;
      }
   }
}

