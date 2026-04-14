package alternativa.tanks.gui.clanmanagement
{
   import alternativa.osgi.service.command.CommandService;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.ClanWindow;
   import alternativa.tanks.gui.TabPanel;
   import alternativa.tanks.gui.components.button.ClanUsersButton;
   import alternativa.tanks.models.service.ClanInfoUpdateEvent;
   import alternativa.tanks.models.service.ClanNotificationsManager;
   import alternativa.tanks.models.service.ClanService;
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import alternativa.tanks.service.clan.ClanFriendsService;
   import flash.events.Event;
   import forms.TankWindowWithHeader;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   
   public class ClanManagementPanel extends ClanWindow
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var clanService:ClanService;
      
      [Inject]
      public static var clanFriendsService:ClanFriendsService;
      
      [Inject]
      public static var commandService:CommandService;
      
      private static const BUTTON_HEIGHT:int = 30;
      
      private static const MARGIN:int = 11;
      
      private static const FRAME:int = 7;
      
      private var clanObject:IGameObject;
      
      private var tabWindows:TabPanel = new TabPanel();
      
      private var clanUsersWindows:ClanUsersWindow;
      
      public var usersButton:ClanUsersButton;
      
      public var topPanel:ClanTopManagementPanel;
      
      private var clanProfileWindow:ClanProfileWindow;
      
      public function ClanManagementPanel(_arg_1:IGameObject)
      {
         super();
         _window = TankWindowWithHeader.createWindow("SYSTEM_MESSAGE");
         this.clanObject = _arg_1;
         addChild(_window);
         this.init();
      }
      
      private function init() : void
      {
         _window.addChild(this.tabWindows);
         this.topPanel = new ClanTopManagementPanel(this.clanObject);
         _window.addChild(this.topPanel);
         this.clanUsersWindows = new ClanUsersWindow(this.clanObject);
         this.clanProfileWindow = new ClanProfileWindow(this.clanObject);
         this.tabWindows.addTab(localeService.getText(TanksLocale.TEXT_CLAN_BUTTON_PROFILE),this.clanProfileWindow,ClanStateButton);
         this.usersButton = ClanUsersButton(this.tabWindows.addTab(localeService.getText(TanksLocale.TEXT_CLAN_MEMBERS),this.clanUsersWindows,ClanUsersButton));
         ClanNotificationsManager.addAcceptedIndicatorListener(this.usersButton);
         ClanNotificationsManager.addIncomingIndicatorListener(this.usersButton);
         addEventListener(ClanInfoUpdateEvent.UPDATE,this.onClanInfoUpdate);
         this.usersButton.updateNotifications();
         this.tabWindows.select(0);
         this.onResize();
      }
      
      private function onClanInfoUpdate(_arg_1:ClanInfoUpdateEvent) : void
      {
         this.clanProfileWindow.setInfo(_arg_1);
         this.topPanel.setFlag(_arg_1.clanFlag);
      }
      
      override public function onResize(_arg_1:Event = null) : void
      {
         super.onResize(_arg_1);
         _window.height = BUTTON_HEIGHT + 2 * MARGIN + FRAME + this.topPanel.height;
         this.topPanel.x = MARGIN;
         this.topPanel.y = FRAME + MARGIN + BUTTON_HEIGHT;
         this.topPanel.width = width - 2 * MARGIN;
         this.tabWindows.width = width;
         this.tabWindows.height = height;
         this.tabWindows.onResize();
      }
      
      public function addingAcceptedUser(_arg_1:String) : void
      {
         clanService.clanMembers.push(_arg_1);
         this.clanUsersWindows.addUser(_arg_1);
         this.topPanel.userAdded();
         this.clanProfileWindow.userAdded();
      }
      
      public function removeAcceptedUser(_arg_1:String) : void
      {
         var _local_2:int = clanService.clanMembers.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            clanService.clanMembers.splice(_local_2,1);
            this.clanUsersWindows.removeUser(_arg_1);
            this.topPanel.userRemoved();
            this.clanProfileWindow.userRemoved();
         }
      }
      
      override public function destroy() : void
      {
         ClanNotificationsManager.clearListeners();
         ClanUserNotificationsManager.resetManager();
         ClanPermissionsManager.removeListeners();
         ClanActionsManager.removeListeners();
         if(_window != null)
         {
            _window.removeChild(this.tabWindows);
            this.tabWindows.destroy();
            this.tabWindows = null;
         }
         super.destroy();
      }
      
      public function maxMembers() : void
      {
         this.clanUsersWindows.maxMembers();
      }
   }
}

