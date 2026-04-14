package services.contextmenu
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import flash.events.EventDispatcher;
   import forms.contextmenu.ContextMenu;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.AlertServiceEvent;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   
   public class ContextMenuService extends EventDispatcher implements IContextMenuService
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var blurService:IBlurService;
      
      [Inject]
      public static var friendsActionService:IFriendActionService;
      
      [Inject]
      public static var dialogWindowsDispatcherService:IDialogWindowsDispatcherService;
      
      private var _contextMenu:ContextMenu;
      
      private var _removeFromFriendsUserId:String;
      
      private var _removeFromFriendsUid:String;
      
      public function ContextMenuService()
      {
         super();
         this._contextMenu = new ContextMenu();
      }
      
      public function show(_arg_1:int, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:String, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean = false, _arg_14:Boolean = true) : void
      {
         this._contextMenu.show(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8,_arg_9,_arg_10,_arg_11,_arg_12,_arg_13,_arg_14);
      }
      
      public function writeInChat(_arg_1:String, _arg_2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.WRITE_IN_CHAT,_arg_1,_arg_2));
      }
      
      public function removeFromFriends(_arg_1:String, _arg_2:String) : void
      {
         this._removeFromFriendsUserId = _arg_1;
         this._removeFromFriendsUid = _arg_2;
         var _local_3:String = localeService.getText(TextConst.STRING_FRIENDS_REMOVE_USER).replace("%USERNAME%",_arg_2);
         alertService.showAlert(_local_3,Vector.<String>([localeService.getText(TextConst.STRING_FRIENDS_YES),localeService.getText(TextConst.STRING_FRIENDS_NO)]));
         alertService.addEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRemoveFromFriends);
      }
      
      private function onConfirmRemoveFromFriends(_arg_1:AlertServiceEvent) : void
      {
         alertService.removeEventListener(AlertServiceEvent.ALERT_BUTTON_PRESSED,this.onConfirmRemoveFromFriends);
         if(_arg_1.typeButton == localeService.getText(TextConst.STRING_FRIENDS_YES))
         {
            friendsActionService.breakItOff(this._removeFromFriendsUserId);
            dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.REMOVE_FROM_FRIENDS,this._removeFromFriendsUserId,this._removeFromFriendsUid));
         }
      }
      
      public function rejectRequest(_arg_1:String, _arg_2:String) : void
      {
         friendsActionService.reject(_arg_1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.REJECT_REQUEST,_arg_1,_arg_2));
      }
      
      public function acceptRequest(_arg_1:String, _arg_2:String) : void
      {
         friendsActionService.accept(_arg_1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.ACCEPT_REQUEST,_arg_1,_arg_2));
      }
      
      public function cancelRequest(_arg_1:String, _arg_2:String) : void
      {
         friendsActionService.revoke(_arg_1);
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.CANCEL_REQUEST,_arg_1,_arg_2));
      }
      
      public function addToFriend(_arg_1:String) : void
      {
         friendsActionService.add(_arg_1);
      }
      
      public function focusOnUser(_arg_1:String, _arg_2:String) : void
      {
         dispatchEvent(new ContextMenuServiceEvent(ContextMenuServiceEvent.FOCUS_ON_USER,_arg_1,_arg_2));
      }
   }
}

