package projects.tanks.clients.flash.commons.services.notification
{
   import org.osflash.signals.Signal;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.network.handler.OnConnectionClosedServiceListener;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   
   public class NotificationService implements INotificationService, OnConnectionClosedServiceListener
   {
      
      private var _lobbyLayoutService:ILobbyLayoutService;
      
      private var _queue:Array;
      
      private var _showNotification:INotification;
      
      public function NotificationService(_arg_1:ILobbyLayoutService)
      {
         super();
         this._lobbyLayoutService = _arg_1;
         this.init();
      }
      
      private function init() : void
      {
         this._queue = [];
         this._lobbyLayoutService.addEventListener(LobbyLayoutServiceEvent.END_LAYOUT_SWITCH,this.onEndLayoutSwitch);
      }
      
      private function onEndLayoutSwitch(_arg_1:LobbyLayoutServiceEvent) : void
      {
         this.updateQueue();
      }
      
      public function addNotification(_arg_1:INotification, _arg_2:Boolean = false) : void
      {
         if(_arg_2)
         {
            this._queue.unshift(_arg_1);
         }
         else
         {
            this._queue.push(_arg_1);
         }
         this.updateQueue();
      }
      
      private function updateQueue() : void
      {
         var _local_1:Signal = null;
         if(this.canShow())
         {
            this._showNotification = this._queue.shift();
            _local_1 = new Signal();
            _local_1.addOnce(this.onCloseNotification);
            this._showNotification.show(_local_1);
         }
      }
      
      private function canShow() : Boolean
      {
         return !this._lobbyLayoutService.isSwitchInProgress() && this._showNotification == null && this._queue.length != 0;
      }
      
      private function onCloseNotification() : void
      {
         this._showNotification = null;
         this.updateQueue();
      }
      
      public function hasNotification(_arg_1:String, _arg_2:String) : Boolean
      {
         var _local_3:Boolean = false;
         var _local_4:INotification = null;
         var _local_6:int = 0;
         if(this.isShowNotification(_arg_1,_arg_2))
         {
            return true;
         }
         var _local_5:int = int(this._queue.length);
         while(_local_6 < _local_5)
         {
            _local_4 = this._queue[_local_6];
            if(_local_4.userId == _arg_1 && _local_4.message == _arg_2)
            {
               _local_3 = true;
               break;
            }
            _local_6++;
         }
         return _local_3;
      }
      
      private function isShowNotification(_arg_1:String, _arg_2:String) : Boolean
      {
         return this._showNotification != null && this._showNotification.userId == _arg_1 && this._showNotification.message == _arg_2;
      }
      
      public function onConnectionClosed(_arg_1:ConnectionCloseStatus) : void
      {
         if(Boolean(this._showNotification))
         {
            this._showNotification.destroy();
            this._showNotification = null;
         }
         this._queue.length = 0;
      }
   }
}

