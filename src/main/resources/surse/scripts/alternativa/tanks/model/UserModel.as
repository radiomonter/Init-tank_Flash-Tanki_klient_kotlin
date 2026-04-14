package alternativa.tanks.model
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.service.IAddressService;
   import alternativa.tanks.gui.ChangePasswordAndEmailEvent;
   import alternativa.tanks.gui.InviteWindow;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.servermodels.EntranceModel;
   import alternativa.tanks.servermodels.blockvalidator.BlockValidatorModel;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.captcha.ServerCaptchaModel;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.login.LoginModel;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.loginbyhash.LoginByHashModel;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.registartion.password.PasswordRegistrationModel;
   import alternativa.types.Long;
   import com.alternativaplatform.client.models.core.users.model.entrance.ConfirmEmailStatus;
   import com.alternativaplatform.client.models.core.users.model.entrance.EntranceModelBase;
   import com.alternativaplatform.client.models.core.users.model.entrance.IEntranceModelBase;
   import com.alternativaplatform.client.models.core.users.model.entrance.RegisterStatusEnum;
   import com.alternativaplatform.client.models.core.users.model.entrance.RestorePasswordStatusEnum;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.net.SharedObject;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.utils.Dictionary;
   import flash.utils.Timer;
   import fominskiy.gui.ConfirmEmailCode;
   import fominskiy.gui.RecoveryWindow;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import forms.events.AlertEvent;
   import forms.events.LoginFormEvent;
   import obfuscation.vinygavew.Nosum;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class UserModel extends EntranceModelBase implements IEntranceModelBase, INetworkListener
   {
      
      public static var display:IDisplay = OSGi.getInstance().getService(IDisplay) as IDisplay;
      
      private const inputShortDelay:int = 250;
      
      private const inputLongDelay:int = 3000;
      
      private const STATE_LOGIN:int = 1;
      
      private const STATE_REGISTER:int = 2;
      
      private const STATE_RESTORE_PASSWORD:int = 3;
      
      private const checkCallsignDelay:int = 500;
      
      private var addressService:IAddressService;
      
      private var clientObject:ClientObject;
      
      private var layer:DisplayObjectContainer;
      
      private var errorWindow:Alert;
      
      private var confirmAlert:Alert;
      
      private var changeEmailAndPasswordWindow:RecoveryWindow;
      
      private var inputShortInt:int = -1;
      
      private var inputLongInt:int = -1;
      
      private var state:int = 0;
      
      private var not1stSimbols:String = "-_.";
      
      private var hash:String;
      
      private var login:String;
      
      private var up:String;
      
      private var emailConfirmHash:String;
      
      private var email:String;
      
      private var emailChangeHash:String;
      
      private var inviteWindow:InviteWindow;
      
      private var inviteEnabled:Boolean;
      
      private var antiAddictionEnabled:Boolean;
      
      private var params:Dictionary;
      
      private var checkCallsignTimer:Timer;
      
      private var localeService:ILocaleService;
      
      private var network:Network;
      
      private var blockValidator:BlockValidatorModel;
      
      private var mosowamul:EntranceModel;
      
      private var isUnique:Boolean;
      
      public function UserModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(IEntranceModelBase);
         _interfaces.push(IObjectLoadListener);
         this.localeService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         this.layer = IDisplay(OSGi.getInstance().getService(IDisplay)).contentUILayer;
         this.inviteWindow = new InviteWindow();
         this.addressService = OSGi.getInstance().getService(IAddressService) as IAddressService;
         this.blockValidator = new BlockValidatorModel();
         ServerCaptchaModel(OSGi.getInstance().getService(IServerCaptcha)).objectLoaded();
      }
      
      public function initObject(_arg_1:Boolean, _arg_2:Boolean) : void
      {
         this.mosowamul = new EntranceModel();
         this.mosowamul.objectLoadedPost();
         this.inviteEnabled = _arg_2;
         this.antiAddictionEnabled = _arg_1;
      }
      
      public function objectLoaded() : void
      {
         var _local_2:String = null;
         var _local_3:Array = null;
         var _local_4:int = 0;
         var _local_5:Array = null;
         var _local_6:ILoaderWindowService = null;
         var _local_7:ILoaderWindowService = null;
         var _local_1:SharedObject = IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage();
         this.network = OSGi.getInstance().getService(INetworker) as Network;
         this.network.addListener(this);
         if(this.addressService != null)
         {
            _local_2 = this.addressService.getValue();
            _local_3 = _local_2.split("&");
            this.params = new Dictionary();
            _local_4 = 0;
            while(_local_4 < _local_3.length)
            {
               _local_5 = (_local_3[_local_4] as String).split("=");
               this.params[_local_5[0]] = _local_5[1];
               _local_4++;
            }
            this.hash = this.params["hash"];
            this.emailConfirmHash = this.params["emailConfirmHash"];
            this.email = this.params["userEmail"];
            this.emailChangeHash = this.params["emailChangeHash"];
         }
         if(this.email != null && this.email != "")
         {
            _local_1.data.userEmail = this.email;
         }
         else
         {
            this.email = _local_1.data.userEmail;
         }
         this.login = _local_1.data.userName;
         this.up = _local_1.data.up;
         if(this.emailConfirmHash != null)
         {
            _local_6 = OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService;
            _local_6.hideLoaderWindow();
            _local_6.lockLoaderWindow();
            this.confirmAlert = new Alert(Alert.ALERT_CONFIRM_EMAIL);
            this.layer.addChild(this.confirmAlert);
            this.confirmAlert.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onAlertButtonPressed);
         }
         else if(this.emailChangeHash != null)
         {
            _local_7 = OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService;
            _local_7.hideLoaderWindow();
            _local_7.lockLoaderWindow();
         }
      }
      
      public function onData(_arg_1:Command) : void
      {
         var _local_2:Object = null;
         var _local_3:Vector.<String> = null;
         var _local_4:* = undefined;
         var _local_5:String = null;
         var _local_6:Vector.<int> = null;
         var _local_7:Alert = null;
         if(_arg_1.type == Type.REGISTRATON)
         {
            switch(_arg_1.args[0])
            {
               case "check_name_result":
                  if(_arg_1.args[1] == "not_exist")
                  {
                     PasswordRegistrationModel(OSGi.getInstance().getService(IPasswordRegistration)).enteredUidIsFree();
                  }
                  else if(_arg_1.args[1] == "incorrect")
                  {
                     PasswordRegistrationModel(OSGi.getInstance().getService(IPasswordRegistration)).enteredUidIsIncorrect();
                  }
                  else if(_arg_1.args[1] == "nickname_exist")
                  {
                     _local_2 = JSON.parse(_arg_1.args[2]);
                     _local_3 = new Vector.<String>();
                     for each(_local_4 in _local_2.free_nicknames)
                     {
                        _local_3.push(_local_4);
                     }
                     PasswordRegistrationModel(OSGi.getInstance().getService(IPasswordRegistration)).enteredUidIsBusy(_local_3);
                  }
            }
         }
         else if(_arg_1.type == Type.AUTH)
         {
            switch(_arg_1.args[0])
            {
               case "serverHalt":
                  Nosum(ModelRegistry(OSGi.getInstance().getService(ModelRegistry)).getModel(Long.getLong(0,300020028))).serverHalt();
                  break;
               case "accept":
                  this.objectUnloaded(this.clientObject);
                  ILobbyLayoutService(OSGi.getInstance().getService(ILobbyLayoutService)).layoutSwitchPredicted();
                  new Lobby().rycuzo();
                  this.mosowamul.objectUnloadedPost();
                  break;
               case "set_entrance_hash":
                  LoginByHashModel(OSGi.getInstance().getService(ILoginByHash)).rememberAccount(_arg_1.args[1] == "null" ? null : _arg_1.args[1]);
                  break;
               case "login_by_hash_failed":
                  LoginByHashModel(OSGi.getInstance().getService(ILoginByHash)).loginByHashFailed();
                  break;
               case "denied":
                  LoginModel(OSGi.getInstance().getService(ILogin)).wrongPassword();
                  break;
               case "not_exist":
                  this.passwdLoginFailed(null);
                  break;
               case "ban":
                  this.blockValidator.youAreBlocked(_arg_1.args[1]);
                  break;
               case "kick":
                  this.blockValidator.youWereKicked(_arg_1.args[1],parseInt(_arg_1.args[2]),parseInt(_arg_1.args[3]),parseInt(_arg_1.args[4]));
                  break;
               case "wrong_captcha":
                  _local_6 = new Vector.<int>();
                  for each(_local_5 in String(_arg_1.args[2]).split(","))
                  {
                     _local_6.push(parseInt(_local_5));
                  }
                  ServerCaptchaModel(OSGi.getInstance().getService(IServerCaptcha)).captchaFailed(this.getCaptchaLocation(_arg_1.args[1]),_local_6);
                  break;
               case "enable_captcha":
                  break;
               case "update_captcha":
                  _local_6 = new Vector.<int>();
                  for each(_local_5 in String(_arg_1.args[2]).split(","))
                  {
                     _local_6.push(parseInt(_local_5));
                  }
                  ServerCaptchaModel(OSGi.getInstance().getService(IServerCaptcha)).showCaptcha(this.getCaptchaLocation(_arg_1.args[1]),_local_6);
                  break;
               case "recovery_account":
                  if(_arg_1.args[1] == "false")
                  {
                     this.setPasswordChangeResult(null,false,this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ERROR));
                  }
                  else
                  {
                     this.setPasswordChangeResult(null,true,this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_PASSWORD_CHANGED));
                  }
            }
         }
         else if(_arg_1.type == Type.RESTORE)
         {
            switch(_arg_1.args[0])
            {
               case "recovery_account_done":
                  display.cursorLayer.addChild(new ConfirmEmailCode(this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ENTER_CODE),this.onEnterConfirmCode));
                  return;
               case "recovery_account_result":
                  if(_arg_1.args[1] == "false")
                  {
                     this.setPasswordChangeResult(null,false,this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_ERROR));
                  }
                  return;
               case "recovery_account_code":
                  if(_arg_1.args[1] == "true")
                  {
                     this.restorePasswordStatus(null,RestorePasswordStatusEnum.OK);
                     this.changeEmailHashIsOk(null,_arg_1.args[2]);
                  }
                  else
                  {
                     _local_7 = new Alert();
                     _local_7.showAlert(this.localeService.getText(TextConst.ACCOUNT_RECOVERY_FORM_WRONG_CODE),Vector.<String>([AlertAnswer.OK]));
                     this.layer.addChild(_local_7);
                  }
                  return;
            }
         }
      }
      
      private function getCaptchaLocation(_arg_1:String) : CaptchaLocation
      {
         switch(_arg_1)
         {
            case "registration":
               return CaptchaLocation.REGISTER_FORM;
            case "AUTH":
               return CaptchaLocation.LOGIN_FORM;
            default:
               return CaptchaLocation.REGISTER_FORM;
         }
      }
      
      private function onEnterConfirmCode(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("restore;confirm_email_code;" + _arg_1);
      }
      
      public function changeEmailHashIsOk(_arg_1:ClientObject, _arg_2:String) : void
      {
         this.changeEmailAndPasswordWindow = new RecoveryWindow(null,_arg_2);
         this.changeEmailAndPasswordWindow.addEventListener(ChangePasswordAndEmailEvent.CHANGE_PRESSED,this.onChangePassAndEmailPressed);
         this.changeEmailAndPasswordWindow.addEventListener(ChangePasswordAndEmailEvent.CANCEL_PRESSED,this.onCancelPassAndEmailPressed);
         display.stage.addEventListener(Event.RESIZE,this.allignChangeEmailAndPasswordWindow);
      }
      
      public function changeEmailHashIsWrong(_arg_1:ClientObject) : void
      {
         var _local_2:Alert = new Alert();
         _local_2.showAlert(this.localeService.getText(TextConst.SETTINGS_CHANGE_PASSWORD_WRONG_LINK_TEXT),Vector.<String>([AlertAnswer.OK]));
         this.layer.addChild(_local_2);
         _local_2.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onWrongChangePasswordAlertButtonPressed);
      }
      
      private function onWrongChangePasswordAlertButtonPressed(_arg_1:AlertEvent) : void
      {
         this.enter();
      }
      
      private function enter() : void
      {
         if(this.inviteEnabled)
         {
            this.showInviteWindow();
         }
         else
         {
            this.afterInviteEnter();
         }
      }
      
      private function afterInviteEnter() : void
      {
         this.showWindow();
      }
      
      private function onAlertButtonPressed(_arg_1:AlertEvent) : void
      {
      }
      
      public function confirmEmailStatus(_arg_1:ClientObject, _arg_2:ConfirmEmailStatus) : void
      {
         switch(_arg_2)
         {
            case ConfirmEmailStatus.ERROR:
               this.enter();
               return;
            case ConfirmEmailStatus.OK:
               this.enter();
               return;
            case ConfirmEmailStatus.OK_EXISTS:
               this.goToPortal();
               return;
            default:
               return;
         }
      }
      
      private function goToPortal(_arg_1:AlertEvent = null) : void
      {
         navigateToURL(new URLRequest("http://alternativaplatform.com/ru/"),"_self");
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
      }
      
      public function hashLoginFailed(_arg_1:ClientObject) : void
      {
         var _local_2:ILoaderWindowService = OSGi.getInstance().getService(ILoaderWindowService) as ILoaderWindowService;
         _local_2.hideLoaderWindow();
         _local_2.lockLoaderWindow();
         if(this.inviteEnabled)
         {
            this.showInviteWindow();
         }
         else
         {
            this.afterInviteEnter();
         }
      }
      
      public function wrongCaptcha(_arg_1:ClientObject) : void
      {
         this.showErrorWindow(Alert.CAPTCHA_INCORRECT);
      }
      
      public function passwdLoginFailed(_arg_1:ClientObject) : void
      {
      }
      
      public function registerStatus(_arg_1:ClientObject, _arg_2:RegisterStatusEnum) : void
      {
         switch(_arg_2)
         {
            case RegisterStatusEnum.EMAIL_LDAP_UNIQUE:
               this.showErrorWindow(Alert.ERROR_EMAIL_UNIQUE);
               return;
            case RegisterStatusEnum.EMAIL_NOT_VALID:
               this.showErrorWindow(Alert.ERROR_EMAIL_INVALID);
               return;
            case RegisterStatusEnum.UID_LDAP_UNIQUE:
               this.showErrorWindow(Alert.ERROR_CALLSIGN_UNIQUE);
               return;
            default:
               return;
         }
      }
      
      public function setHash(_arg_1:ClientObject, _arg_2:String) : void
      {
      }
      
      public function restorePasswordStatus(_arg_1:ClientObject, _arg_2:RestorePasswordStatusEnum) : void
      {
         switch(_arg_2)
         {
            case RestorePasswordStatusEnum.OK:
               this.state = this.STATE_LOGIN;
               return;
            case RestorePasswordStatusEnum.MAIL_NOT_FOUND:
               this.showErrorWindow(Alert.ERROR_EMAIL_NOTFOUND);
               return;
            case RestorePasswordStatusEnum.MAIL_NOT_SEND:
               this.showErrorWindow(Alert.ERROR_EMAIL_NOTSENDED);
               return;
            default:
               return;
         }
      }
      
      public function inviteFree(_arg_1:ClientObject) : void
      {
         this.hideInviteWindow();
         this.afterInviteEnter();
      }
      
      public function inviteAlreadyActivated(_arg_1:ClientObject, _arg_2:String) : void
      {
         this.hideInviteWindow();
         var _local_3:SharedObject = IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage();
         this.showWindow();
         this.state = this.STATE_LOGIN;
         if(Boolean(_local_3.data.rememberUserFlag))
         {
         }
      }
      
      public function inviteNotFound(_arg_1:ClientObject) : void
      {
         this.inviteWindow.showInviteError();
      }
      
      public function nameUnique(_arg_1:ClientObject, _arg_2:Boolean) : void
      {
         this.isUnique = _arg_2;
      }
      
      private function showWindow() : void
      {
      }
      
      private function hideWindow() : void
      {
      }
      
      private function onCallsignChanged(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function onCallsignCheckTimerComplete(_arg_1:TimerEvent) : void
      {
      }
      
      private function showErrorWindow(_arg_1:int) : void
      {
         this.errorWindow = new Alert(_arg_1);
         if(!this.layer.contains(this.errorWindow))
         {
            this.layer.addChild(this.errorWindow);
            display.stage.focus = this.errorWindow.closeButton;
         }
      }
      
      public function showBanWindow(_arg_1:String, _arg_2:Boolean) : void
      {
      }
      
      private function showInviteWindow() : void
      {
         if(!this.layer.contains(this.inviteWindow))
         {
            this.layer.addChild(this.inviteWindow);
            this.alignInviteWindow();
            display.stage.addEventListener(Event.RESIZE,this.alignInviteWindow);
            this.inviteWindow.addEventListener(Event.COMPLETE,this.onInviteWindowComplete);
         }
      }
      
      private function hideInviteWindow() : void
      {
         if(this.layer.contains(this.inviteWindow))
         {
            this.layer.removeChild(this.inviteWindow);
            display.stage.removeEventListener(Event.RESIZE,this.alignInviteWindow);
            this.inviteWindow.removeEventListener(Event.COMPLETE,this.onInviteWindowComplete);
         }
      }
      
      private function alignInviteWindow(_arg_1:Event = null) : void
      {
         this.inviteWindow.x = Math.round((display.stage.stageWidth - this.inviteWindow.width) * 0.5);
         this.inviteWindow.y = Math.round((display.stage.stageHeight - this.inviteWindow.height) * 0.5);
      }
      
      private function onInviteWindowComplete(_arg_1:Event) : void
      {
      }
      
      private function onPlayPressed(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function loginByName(_arg_1:String, _arg_2:String, _arg_3:Boolean, _arg_4:String) : void
      {
      }
      
      private function registerUser(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:Boolean, _arg_6:String) : void
      {
      }
      
      private function onStateChanged(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function onShowTermsPressed(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function onShowRulesPressed(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function onRestoreClick(_arg_1:MouseEvent) : void
      {
      }
      
      private function onLoginRestore(_arg_1:LoginFormEvent) : void
      {
      }
      
      private function restorePassword(_arg_1:String) : void
      {
      }
      
      private function onCancelPassAndEmailPressed(_arg_1:ChangePasswordAndEmailEvent) : void
      {
         this.changeEmailAndPasswordWindow.removeEventListener(ChangePasswordAndEmailEvent.CANCEL_PRESSED,this.onCancelPassAndEmailPressed);
         this.changeEmailAndPasswordWindow.removeEventListener(ChangePasswordAndEmailEvent.CHANGE_PRESSED,this.onChangePassAndEmailPressed);
         this.changeEmailAndPasswordWindow.close();
         this.enter();
      }
      
      private function onChangePassAndEmailPressed(_arg_1:ChangePasswordAndEmailEvent) : void
      {
         this.changePasswordAndEmail(this.changeEmailAndPasswordWindow.pyqegyny(),this.changeEmailAndPasswordWindow.getEmail());
      }
      
      private function changePasswordAndEmail(_arg_1:String, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("restore;change_pass_email;" + _arg_1 + ";" + _arg_2);
      }
      
      private function allignChangeEmailAndPasswordWindow(_arg_1:Event) : void
      {
         this.changeEmailAndPasswordWindow.x = Math.round((display.stage.stageWidth - this.changeEmailAndPasswordWindow.width) * 0.5);
         this.changeEmailAndPasswordWindow.y = Math.round((display.stage.stageHeight - this.changeEmailAndPasswordWindow.height) * 0.5) - 10;
      }
      
      public function setPasswordChangeResult(_arg_1:ClientObject, _arg_2:Boolean, _arg_3:String) : void
      {
         var _local_4:Alert = null;
         var _local_5:Alert = null;
         if(_arg_2 == true)
         {
            if(this.layer.contains(this.changeEmailAndPasswordWindow))
            {
               this.changeEmailAndPasswordWindow.removeEventListener(ChangePasswordAndEmailEvent.CANCEL_PRESSED,this.onCancelPassAndEmailPressed);
               this.changeEmailAndPasswordWindow.removeEventListener(ChangePasswordAndEmailEvent.CHANGE_PRESSED,this.onChangePassAndEmailPressed);
               this.layer.removeChild(this.changeEmailAndPasswordWindow);
               _local_4 = new Alert();
               _local_4.showAlert(_arg_3,Vector.<String>([AlertAnswer.OK]));
               this.layer.addChild(_local_4);
               _local_4.addEventListener(AlertEvent.ALERT_BUTTON_PRESSED,this.onChangePasswordAndEmailAlertPressed);
            }
         }
         else
         {
            _local_5 = new Alert();
            _local_5.showAlert(_arg_3,Vector.<String>([AlertAnswer.OK]));
            this.layer.addChild(_local_5);
         }
      }
      
      private function onChangePasswordAndEmailAlertPressed(_arg_1:Event) : void
      {
         this.enter();
      }
      
      public function serverIsRestarting(_arg_1:ClientObject) : void
      {
      }
      
      public function youWereKicked(_arg_1:ClientObject) : void
      {
      }
   }
}

