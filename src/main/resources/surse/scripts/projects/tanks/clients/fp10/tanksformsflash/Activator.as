package projects.tanks.clients.fp10.tanksformsflash
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.bundle.IBundleActivator;
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.servers.ServersDropDownList;
   import controls.PlayerInfo;
   import controls.Rank;
   import controls.dropdownlist.AccountsList;
   import controls.dropdownlist.DropDownList;
   import controls.friends.NewRequestIndicator;
   import controls.friends.RequestCountIndicator;
   import controls.panel.UpdateRankNotice;
   import forms.ButtonBar;
   import forms.ChangeTeamAlert;
   import forms.MainPanel;
   import forms.ServerStopAlert;
   import forms.TankWindowWithHeader;
   import forms.contextmenu.ContextMenu;
   import forms.registration.bubbles.EmailInvalidBubble;
   import forms.registration.bubbles.NameIsIncorrectBubble;
   import forms.registration.bubbles.NameIsNotUniqueBubble;
   import forms.registration.bubbles.PasswordIsTooEasyBubble;
   import forms.registration.bubbles.PasswordsDoNotMatchBubble;
   import forms.userlabel.UserLabel;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser.IBlockUserService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogwindowdispatcher.IDialogWindowsDispatcherService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendActionService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.notifier.online.IOnlineNotifierService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.reconnect.ReconnectService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   import services.alertservice.AlertService;
   import services.buttonbar.IButtonBarService;
   import services.contextmenu.ContextMenuService;
   import services.contextmenu.IContextMenuService;
   
   public class Activator implements IBundleActivator
   {
      
      public static var osgi:OSGi;
      
      public function Activator()
      {
         super();
      }
      
      public function start(param1:OSGi) : void
      {
         var _osgi:OSGi = param1;
         osgi = _osgi;
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ContextMenu.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ContextMenu.display;
         });
         osgi.injectService(IBattleInviteService,function(_arg_1:Object):void
         {
            ContextMenu.battleInviteService = IBattleInviteService(_arg_1);
         },function():IBattleInviteService
         {
            return ContextMenu.battleInviteService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            ContextMenu.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return ContextMenu.contextMenuService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ContextMenu.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ContextMenu.localeService;
         });
         osgi.injectService(IOnlineNotifierService,function(_arg_1:Object):void
         {
            ContextMenu.onlineNotifierService = IOnlineNotifierService(_arg_1);
         },function():IOnlineNotifierService
         {
            return ContextMenu.onlineNotifierService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            ContextMenu.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return ContextMenu.userInfoService;
         });
         osgi.injectService(IBattleInfoService,function(_arg_1:Object):void
         {
            ContextMenu.battleInfoService = IBattleInfoService(_arg_1);
         },function():IBattleInfoService
         {
            return ContextMenu.battleInfoService;
         });
         osgi.injectService(IFriendActionService,function(_arg_1:Object):void
         {
            ContextMenu.friendsActionService = IFriendActionService(_arg_1);
         },function():IFriendActionService
         {
            return ContextMenu.friendsActionService;
         });
         osgi.injectService(IBlockUserService,function(_arg_1:Object):void
         {
            ContextMenu.blockUserService = IBlockUserService(_arg_1);
         },function():IBlockUserService
         {
            return ContextMenu.blockUserService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ContextMenu.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ContextMenu.userPropertiesService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            UpdateRankNotice.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return UpdateRankNotice.localeService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            UpdateRankNotice.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return UpdateRankNotice.premiumService;
         });
         osgi.injectService(IUserInfoService,function(_arg_1:Object):void
         {
            UserLabel.userInfoService = IUserInfoService(_arg_1);
         },function():IUserInfoService
         {
            return UserLabel.userInfoService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            UserLabel.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return UserLabel.friendInfoService;
         });
         osgi.injectService(IContextMenuService,function(_arg_1:Object):void
         {
            UserLabel.contextMenuService = IContextMenuService(_arg_1);
         },function():IContextMenuService
         {
            return UserLabel.contextMenuService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            UserLabel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return UserLabel.display;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            UserLabel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return UserLabel.userPropertiesService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            UserLabel.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return UserLabel.premiumService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PlayerInfo.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PlayerInfo.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ContextMenuService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ContextMenuService.localeService;
         });
         osgi.injectService(IAlertService,function(_arg_1:Object):void
         {
            ContextMenuService.alertService = IAlertService(_arg_1);
         },function():IAlertService
         {
            return ContextMenuService.alertService;
         });
         osgi.injectService(IFriendActionService,function(_arg_1:Object):void
         {
            ContextMenuService.friendsActionService = IFriendActionService(_arg_1);
         },function():IFriendActionService
         {
            return ContextMenuService.friendsActionService;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            ContextMenuService.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return ContextMenuService.blurService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            ContextMenuService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return ContextMenuService.dialogWindowsDispatcherService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            AlertService.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return AlertService.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            AlertService.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return AlertService.display;
         });
         osgi.injectService(IBlurService,function(_arg_1:Object):void
         {
            AlertService.blurService = IBlurService(_arg_1);
         },function():IBlurService
         {
            return AlertService.blurService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            AlertService.dialogWindowsDispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return AlertService.dialogWindowsDispatcherService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            DropDownList.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return DropDownList.display;
         });
         osgi.injectService(IStorageService,function(_arg_1:Object):void
         {
            AccountsList.storageService = IStorageService(_arg_1);
         },function():IStorageService
         {
            return AccountsList.storageService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            EmailInvalidBubble.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return EmailInvalidBubble.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PasswordIsTooEasyBubble.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PasswordIsTooEasyBubble.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            NameIsIncorrectBubble.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return NameIsIncorrectBubble.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            PasswordsDoNotMatchBubble.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return PasswordsDoNotMatchBubble.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            NameIsNotUniqueBubble.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return NameIsNotUniqueBubble.localeService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ButtonBar.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ButtonBar.localeService;
         });
         osgi.injectService(ReconnectService,function(_arg_1:Object):void
         {
            ButtonBar.reconnectService = ReconnectService(_arg_1);
         },function():ReconnectService
         {
            return ButtonBar.reconnectService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ChangeTeamAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ChangeTeamAlert.localeService;
         });
         osgi.injectService(IClientLog,function(_arg_1:Object):void
         {
            ButtonBar.clientLog = IClientLog(_arg_1);
         },function():IClientLog
         {
            return ButtonBar.clientLog;
         });
         osgi.injectService(IButtonBarService,function(_arg_1:Object):void
         {
            ButtonBar.buttonBarService = IButtonBarService(_arg_1);
         },function():IButtonBarService
         {
            return ButtonBar.buttonBarService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            ButtonBar.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return ButtonBar.userPropertiesService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            MainPanel.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return MainPanel.display;
         });
         osgi.injectService(ReconnectService,function(_arg_1:Object):void
         {
            MainPanel.reconnectService = ReconnectService(_arg_1);
         },function():ReconnectService
         {
            return MainPanel.reconnectService;
         });
         osgi.injectService(IUserPropertiesService,function(_arg_1:Object):void
         {
            MainPanel.userPropertiesService = IUserPropertiesService(_arg_1);
         },function():IUserPropertiesService
         {
            return MainPanel.userPropertiesService;
         });
         osgi.injectService(PremiumService,function(_arg_1:Object):void
         {
            MainPanel.premiumService = PremiumService(_arg_1);
         },function():PremiumService
         {
            return MainPanel.premiumService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            NewRequestIndicator.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return NewRequestIndicator.friendInfoService;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            Rank.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return Rank.localeService;
         });
         osgi.injectService(IFriendInfoService,function(_arg_1:Object):void
         {
            RequestCountIndicator.friendInfoService = IFriendInfoService(_arg_1);
         },function():IFriendInfoService
         {
            return RequestCountIndicator.friendInfoService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            RequestCountIndicator.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return RequestCountIndicator.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            ServerStopAlert.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return ServerStopAlert.localeService;
         });
         osgi.injectService(IDisplay,function(_arg_1:Object):void
         {
            ServerStopAlert.display = IDisplay(_arg_1);
         },function():IDisplay
         {
            return ServerStopAlert.display;
         });
         osgi.injectService(ILocaleService,function(_arg_1:Object):void
         {
            TankWindowWithHeader.localeService = ILocaleService(_arg_1);
         },function():ILocaleService
         {
            return TankWindowWithHeader.localeService;
         });
         osgi.injectService(IDialogWindowsDispatcherService,function(_arg_1:Object):void
         {
            ServersDropDownList.dispatcherService = IDialogWindowsDispatcherService(_arg_1);
         },function():IDialogWindowsDispatcherService
         {
            return ServersDropDownList.dispatcherService;
         });
      }
      
      public function stop(_arg_1:OSGi) : void
      {
      }
   }
}

