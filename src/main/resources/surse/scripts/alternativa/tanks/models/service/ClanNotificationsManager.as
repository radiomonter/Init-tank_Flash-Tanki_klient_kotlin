package alternativa.tanks.models.service
{
   import alternativa.tanks.gui.IClanNotificationListener;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   
   public class ClanNotificationsManager
   {
      
      private static var incomingIndicators:Vector.<IClanNotificationListener> = new Vector.<IClanNotificationListener>();
      
      private static var acceptedIndicators:Vector.<IClanNotificationListener> = new Vector.<IClanNotificationListener>();
      
      private static var incomingNotifications:Dictionary = new Dictionary();
      
      private static var acceptedNotifications:Dictionary = new Dictionary();
      
      private static var _incomingNotificationsCount:int = 0;
      
      private static var _acceptedNotificationsCount:int = 0;
      
      public static var dispatcher:EventDispatcher = new EventDispatcher();
      
      public function ClanNotificationsManager()
      {
         super();
      }
      
      public static function clearListeners() : void
      {
         incomingIndicators = new Vector.<IClanNotificationListener>();
         acceptedIndicators = new Vector.<IClanNotificationListener>();
      }
      
      public static function incomingNotificationsCount() : int
      {
         return _incomingNotificationsCount;
      }
      
      public static function acceptedNotificationsCount() : int
      {
         return _acceptedNotificationsCount;
      }
      
      public static function onIncomingNotification(_arg_1:String) : void
      {
         ++_incomingNotificationsCount;
         incomingNotifications[_arg_1] = true;
         updateAllIndicators(incomingIndicators);
      }
      
      public static function onRemoveIncomingNotification(_arg_1:String) : void
      {
         if(_arg_1 in incomingNotifications)
         {
            --_incomingNotificationsCount;
            delete incomingNotifications[_arg_1];
            updateAllIndicators(incomingIndicators);
         }
      }
      
      public static function onAcceptedNotification(_arg_1:String) : void
      {
         ++_acceptedNotificationsCount;
         acceptedNotifications[_arg_1] = true;
         updateAllIndicators(acceptedIndicators);
      }
      
      public static function onRemoveAcceptedNotification(_arg_1:String) : void
      {
         if(_arg_1 in acceptedNotifications)
         {
            --_acceptedNotificationsCount;
            delete acceptedNotifications[_arg_1];
            updateAllIndicators(acceptedIndicators);
         }
      }
      
      public static function userInIncomingNotifications(_arg_1:String) : Boolean
      {
         return _arg_1 in incomingNotifications;
      }
      
      public static function userInAcceptedNotifications(_arg_1:String) : Boolean
      {
         return _arg_1 in acceptedNotifications;
      }
      
      public static function removeAcceptedNotification(_arg_1:String) : void
      {
         if(userInAcceptedNotifications(_arg_1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_ACCEPTED_NOTIFICATION,_arg_1));
         }
      }
      
      public static function removeIncomingNotification(_arg_1:String) : void
      {
         if(userInIncomingNotifications(_arg_1))
         {
            dispatcher.dispatchEvent(new ClanNotificationEvent(ClanNotificationEvent.REMOVE_INCOMING_NOTIFICATION,_arg_1));
         }
      }
      
      public static function addIncomingIndicatorListener(_arg_1:IClanNotificationListener) : void
      {
         incomingIndicators.push(_arg_1);
      }
      
      public static function addAcceptedIndicatorListener(_arg_1:IClanNotificationListener) : void
      {
         acceptedIndicators.push(_arg_1);
      }
      
      private static function updateAllIndicators(_arg_1:Vector.<IClanNotificationListener>) : void
      {
         var _local_2:IClanNotificationListener = null;
         for each(_local_2 in _arg_1)
         {
            _local_2.updateNotifications();
         }
      }
      
      public static function initializeIncomingNotifications(_arg_1:Vector.<String>) : void
      {
         var _local_2:Long = null;
         _incomingNotificationsCount = 0;
         for each(_local_2 in _arg_1)
         {
            ++_incomingNotificationsCount;
            incomingNotifications[_local_2] = true;
         }
         updateAllIndicators(incomingIndicators);
      }
      
      public static function initializeAcceptedNotifications(_arg_1:Vector.<String>) : void
      {
         var _local_2:Long = null;
         _acceptedNotificationsCount = 0;
         for each(_local_2 in _arg_1)
         {
            ++_acceptedNotificationsCount;
            acceptedNotifications[_local_2] = true;
         }
         updateAllIndicators(acceptedIndicators);
      }
      
      public static function acceptedAndIncomingCount() : int
      {
         return acceptedNotificationsCount() + incomingNotificationsCount();
      }
   }
}

