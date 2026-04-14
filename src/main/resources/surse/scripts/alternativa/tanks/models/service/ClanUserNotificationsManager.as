package alternativa.tanks.models.service
{
   import alternativa.tanks.gui.IClanNotificationListener;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class ClanUserNotificationsManager
   {
      
      private static var count:int;
      
      private static var incomingIndicators:Vector.<IClanNotificationListener> = new Vector.<IClanNotificationListener>();
      
      private static var incomingNotifications:Dictionary = new Dictionary();
      
      public static var dispatcher:EventDispatcher = new EventDispatcher();
      
      public function ClanUserNotificationsManager()
      {
         super();
      }
      
      public static function resetManager() : void
      {
         incomingIndicators = new Vector.<IClanNotificationListener>();
         incomingNotifications = new Dictionary();
         count = 0;
      }
      
      public static function addIncomingIndicatorListener(_arg_1:IClanNotificationListener) : void
      {
         incomingIndicators.push(_arg_1);
         _arg_1.updateNotifications();
      }
      
      public static function removeIncomingIndicatorListener(_arg_1:IClanNotificationListener) : void
      {
         var _local_2:Number = incomingIndicators.indexOf(_arg_1);
         if(_local_2 > 0)
         {
            incomingIndicators.splice(_local_2,1);
         }
      }
      
      public static function removeIncomingNotification(_arg_1:String) : void
      {
         if(clanInIncomingNotifications(_arg_1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,_arg_1));
         }
      }
      
      public static function clanInIncomingNotifications(_arg_1:String) : Boolean
      {
         return _arg_1 in incomingNotifications;
      }
      
      public static function initializeIncomingNotifications(_arg_1:Vector.<String>) : void
      {
         var _local_2:Long = null;
         count = 0;
         for each(_local_2 in _arg_1)
         {
            ++count;
            incomingNotifications[_local_2] = true;
         }
         updateAllIndicators(incomingIndicators);
      }
      
      public static function onIncomingNotification(_arg_1:String) : void
      {
         if(!(_arg_1 in incomingNotifications))
         {
            ++count;
            incomingNotifications[_arg_1] = true;
            updateAllIndicators(incomingIndicators);
         }
      }
      
      public static function onRemoveIncomingNotification(_arg_1:String) : void
      {
         if(_arg_1 in incomingNotifications)
         {
            --count;
            delete incomingNotifications[_arg_1];
            updateAllIndicators(incomingIndicators);
         }
      }
      
      public static function getIncomingNotificationsCount() : int
      {
         return count;
      }
      
      private static function updateAllIndicators(_arg_1:Vector.<IClanNotificationListener>) : void
      {
         var _local_2:IClanNotificationListener = null;
         for each(_local_2 in _arg_1)
         {
            _local_2.updateNotifications();
         }
      }
   }
}

