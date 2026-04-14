package alternativa.tanks.model.settings
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.settings.SettingsWindow;
   import alternativa.tanks.gui.settings.SettingsWindowEvent;
   import alternativa.tanks.model.antiaddiction.IAntiAddictionAlert;
   import alternativa.tanks.model.useremailandpassword.IUserEmailAndPassword;
   import alternativa.tanks.model.useremailandpassword.PasswordService;
   import alternativa.tanks.servermodels.captcha.CaptchaParser;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.view.events.RefreshCaptchaClickedEvent;
   import flash.display.Bitmap;
   import flash.events.Event;
   import forms.events.MainButtonBarEvents;
   import obfuscation.gomavik.ReceivePersonalMessagesSettingEvent;
   import obfuscation.lumygaw.Myzu;
   import obfuscation.lumygaw.Pelijabo;
   import obfuscation.muc.Nuwyzogi;
   import obfuscation.pyp.Hafot;
   import obfuscation.pyp.Mibagu;
   import obfuscation.pyp.Pywytadu;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.battleinvite.IBattleInviteService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.fullscreen.FullscreenService;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class SettingsModel extends Pywytadu implements Hafot, ObjectLoadPostListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var battleInviteService:IBattleInviteService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      [Inject]
      public static var fullscreenService:FullscreenService;
      
      [Inject]
      public static var bogeluquh:PasswordService;
      
      private var settingsWindow:SettingsWindow;
      
      private var emailConfirmed:Boolean;
      
      private var mykarifuw:Boolean;
      
      public function SettingsModel()
      {
         super();
      }
      
      public function openAntiAddictionSettings(_arg_1:Nuwyzogi, _arg_2:String, _arg_3:String) : void
      {
         this.openSettingsWindow(_arg_1,true,_arg_2,_arg_3);
      }
      
      public function openSettings(_arg_1:Nuwyzogi) : void
      {
         this.openSettingsWindow(_arg_1,false,"","");
      }
      
      private function openSettingsWindow(_arg_1:Nuwyzogi, _arg_2:Boolean, _arg_3:String, _arg_4:String) : void
      {
         this.emailConfirmed = settingsService.cegediv();
         if(this.settingsWindow != null)
         {
            return;
         }
         this.mykarifuw = _arg_1 == Nuwyzogi.FRIENDS_ONLY;
         this.settingsWindow = new SettingsWindow(settingsService.getEmail(),this.emailConfirmed,this.mykarifuw,_arg_2,_arg_3,_arg_4);
         if(!this.emailConfirmed)
         {
            this.settingsWindow.addEventListener(Pelijabo.SET_EMAIL,this.qodajy);
            this.settingsWindow.addEventListener(Pelijabo.CHANGE_PASSWORD,this.qutevisu);
         }
         this.settingsWindow.addEventListener(SettingsWindowEvent.jike,this.mehyfaluq);
         this.settingsWindow.addEventListener(Pelijabo.luvijy,this.pitydiji);
         this.settingsWindow.addEventListener(Pelijabo.sovof,this.vupuwuv);
         this.settingsWindow.addEventListener(Pelijabo.jihyf,this.rirebyqug);
         this.settingsWindow.addEventListener(ReceivePersonalMessagesSettingEvent.zido,this.feciv);
         panelView.unlock();
         if(!settingsService.rahununo)
         {
            bogeluquh.ryk(this.rowezalim);
         }
         else
         {
            this.settingsWindow.show();
         }
         var _local_5:Myzu = this.settingsWindow.sipywu();
         if(Boolean(_local_5))
         {
            _local_5.addEventListener(RefreshCaptchaClickedEvent.CLICKED,this.onRefreshCaptcha);
            this.getNewCaptcha();
         }
      }
      
      private function vupuwuv(_arg_1:Pelijabo) : void
      {
         bogeluquh.cem(this.settingsWindow.sipywu().mopamowu(),this.qutevisu);
      }
      
      private function rirebyqug(_arg_1:Pelijabo) : void
      {
         var _local_2:Myzu = this.settingsWindow.sipywu();
         if(_local_2.initialRealName != _local_2.realName || _local_2.idNumber != _local_2.initialIDNumber)
         {
            IAntiAddictionAlert(object.adapt(IAntiAddictionAlert)).setIdNumberAndRealName(_local_2.realName,_local_2.idNumber);
         }
      }
      
      private function rebosaja() : void
      {
         if(!this.emailConfirmed)
         {
            this.settingsWindow.removeEventListener(Pelijabo.SET_EMAIL,this.qodajy);
            this.settingsWindow.removeEventListener(Pelijabo.CHANGE_PASSWORD,this.qutevisu);
         }
         this.settingsWindow.removeEventListener(SettingsWindowEvent.jike,this.mehyfaluq);
         this.settingsWindow.removeEventListener(Pelijabo.luvijy,this.pitydiji);
         this.settingsWindow.removeEventListener(Pelijabo.sovof,this.vupuwuv);
         this.settingsWindow.removeEventListener(ReceivePersonalMessagesSettingEvent.zido,this.feciv);
         this.settingsWindow.removeEventListener(Pelijabo.jihyf,this.rirebyqug);
         panelView.getPanel().buttonBar.settingsButton.enable = true;
         this.henyki();
         this.settingsWindow.destroy();
         this.settingsWindow = null;
      }
      
      private function pitydiji(_arg_1:Pelijabo) : void
      {
         var _local_2:Myzu = null;
         _local_2 = null;
         _local_2 = this.settingsWindow.sipywu();
         if(this.emailConfirmed)
         {
            IUserEmailAndPassword(OSGi.getInstance().getService(PasswordService)).sendChangeInstruction(_local_2.jitet());
         }
      }
      
      public function mehyfaluq(_arg_1:Event = null) : void
      {
         if(this.settingsWindow != null)
         {
            this.rebosaja();
         }
      }
      
      private function qodajy(_arg_1:Event = null) : void
      {
         var _local_2:Myzu = null;
         if(!this.emailConfirmed)
         {
            _local_2 = this.settingsWindow.sipywu();
            if(Boolean(_local_2.email))
            {
               IUserEmailAndPassword(OSGi.getInstance().getService(PasswordService)).changeEmail(_local_2.email,_local_2.jitet());
            }
         }
      }
      
      private function qutevisu(_arg_1:Boolean) : void
      {
         var _local_2:Myzu = null;
         if(_arg_1)
         {
            _local_2 = this.settingsWindow.sipywu();
            if(!this.emailConfirmed && _local_2.password != "")
            {
               this.vubew();
            }
         }
         else
         {
            this.settingsWindow.sipywu().vyguqibyn();
         }
      }
      
      private function vubew() : void
      {
         var _local_1:Myzu = this.settingsWindow.sipywu();
         if(_local_1.mopamowu() == "")
         {
            bogeluquh.zowipy(_local_1.password);
         }
         else
         {
            bogeluquh.updatePassword(_local_1.mopamowu(),_local_1.password,_local_1.jitet());
         }
      }
      
      private function feciv(_arg_1:ReceivePersonalMessagesSettingEvent) : void
      {
      }
      
      public function objectLoadedPost() : void
      {
         panelView.getPanel().buttonBar.soundOn = !settingsService.muteSound;
         settingsService.nimupyj();
         panelView.getPanel().buttonBar.addEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         var _local_1:String = IUserEmailAndPassword(OSGi.getInstance().getService(PasswordService)).getEmail();
         this.henyki();
      }
      
      private function henyki() : void
      {
         var _local_1:Mibagu = new Mibagu();
         _local_1.hetosaz = settingsService.showDamage;
         server.qomyhuq(_local_1);
      }
      
      private function onButtonBarButtonClick(_arg_1:MainButtonBarEvents) : void
      {
         switch(_arg_1.typeButton)
         {
            case MainButtonBarEvents.SOUND:
               this.toggleSoundMute();
               return;
            case MainButtonBarEvents.SETTINGS:
               server.showSettings();
         }
      }
      
      public function objectUnloaded() : void
      {
         if(panelView.getPanel() != null)
         {
            panelView.getPanel().buttonBar.removeEventListener(MainButtonBarEvents.PANEL_BUTTON_PRESSED,this.onButtonBarButtonClick);
         }
      }
      
      private function toggleSoundMute() : void
      {
         settingsService.muteSound = !settingsService.muteSound;
         panelView.unlock();
      }
      
      public function rowezalim(_arg_1:Boolean) : void
      {
         if(_arg_1)
         {
            settingsService.rahununo = true;
         }
         else
         {
            this.settingsWindow.sipywu().pyzysy();
         }
         this.settingsWindow.show();
      }
      
      public function captchaUpdated(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         CaptchaParser.parse(_arg_2,this.turigec,_arg_1);
      }
      
      private function turigec(_arg_1:Bitmap, _arg_2:CaptchaLocation) : void
      {
         var _local_3:Myzu = null;
         if(_arg_2 == CaptchaLocation.ACCOUNT_SETTINGS_FORM)
         {
            _local_3 = this.settingsWindow.sipywu();
            _local_3.qosa(_arg_1);
         }
      }
      
      public function ravinomi(_arg_1:Vector.<CaptchaLocation>) : void
      {
      }
      
      public function captchaAnswerCorrect(_arg_1:CaptchaLocation) : void
      {
         var _local_2:Myzu = this.settingsWindow.sipywu();
         if(this.emailConfirmed)
         {
            _local_2.fajan();
            alertService.showAlert(localeService.getText(TanksLocale.TEXT_SETTINGS_CHANGE_PASSWORD_CONFIRMATION_SENT_TEXT),Vector.<String>([AlertAnswer.OK]));
         }
      }
      
      public function bobawu(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         alertService.showAlertById(Alert.CAPTCHA_INCORRECT);
      }
      
      private function onRefreshCaptcha(_arg_1:RefreshCaptchaClickedEvent) : void
      {
         this.getNewCaptcha();
      }
      
      private function getNewCaptcha() : void
      {
         IServerCaptcha(OSGi.getInstance().getService(IServerCaptcha)).getNewCaptcha(CaptchaLocation.ACCOUNT_SETTINGS_FORM);
      }
   }
}

