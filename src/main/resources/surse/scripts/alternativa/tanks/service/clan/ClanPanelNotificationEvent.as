package alternativa.tanks.service.clan
{
   import flash.events.Event;
   
   public class ClanPanelNotificationEvent extends Event
   {
      
      public static const UPDATE:String = "ClanPanelNotificationEvent.UPDATE";
      
      private var _notification:int;
      
      public function ClanPanelNotificationEvent(_arg_1:String, _arg_2:int, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this._notification = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
      
      public function get notification() : int
      {
         return this._notification;
      }
      
      public function set notification(_arg_1:int) : void
      {
         this._notification = _arg_1;
      }
   }
}

