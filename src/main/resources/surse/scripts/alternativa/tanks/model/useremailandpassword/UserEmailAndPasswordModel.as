package alternativa.tanks.model.useremailandpassword
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.service.socialnetwork.ISocialNetworkPanelService;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import services.alertservice.Alert;
   
   public class UserEmailAndPasswordModel implements IUserEmailAndPassword, PasswordService
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var socialNetworkPanelService:ISocialNetworkPanelService;
      
      [Inject]
      public static var bezyvesif:ISettingsService;
      
      private var _email:String;
      
      private var unconfirmedEmail:String;
      
      private var qutevisu:Function;
      
      private var zukizarep:Function;
      
      public function UserEmailAndPasswordModel()
      {
         super();
      }
      
      public function incorrectEmail() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_EMAIL_INVALID));
      }
      
      public function emailAlreadyUsed() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_EMAIL_UNIQUE));
      }
      
      public function activateMessage(_arg_1:String) : void
      {
         panelView.showAlert(_arg_1);
         this._email = this.unconfirmedEmail;
      }
      
      public function updatePasswordError() : void
      {
         display.dialogsLayer.addChild(new Alert(Alert.ERROR_PASSWORD_CHANGE));
      }
      
      public function notifyCorrectPassword() : void
      {
         this.zycaloma(this.qutevisu,true);
      }
      
      public function notifyIncorrectPassword() : void
      {
         this.zycaloma(this.qutevisu,false);
      }
      
      public function notifyPasswordIsNotSet() : void
      {
         this.zycaloma(this.zukizarep,false);
      }
      
      public function notifyPasswordIsSet() : void
      {
         this.zycaloma(this.zukizarep,true);
      }
      
      private function zycaloma(_arg_1:Function, _arg_2:Boolean) : *
      {
         if(Boolean(_arg_1))
         {
            _arg_1(_arg_2);
         }
         _arg_1 = null;
      }
      
      public function passwordChanged() : void
      {
         socialNetworkPanelService.passwordCreated = true;
      }
      
      public function changePassword(_arg_1:String) : void
      {
      }
      
      public function changeEmail(_arg_1:String, _arg_2:String) : void
      {
         bezyvesif.nuka(_arg_1,false);
         this.unconfirmedEmail = _arg_1;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;updateEmail;" + _arg_1 + ";" + _arg_2);
      }
      
      public function getEmail() : String
      {
         return this._email;
      }
      
      public function sendChangeInstruction(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;sendPasswordAndEmailChangeInstruction;" + _arg_1);
      }
      
      public function ryk(_arg_1:Function) : void
      {
         this.zukizarep = _arg_1;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;checkPasswordIsSet");
      }
      
      public function zowipy(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;setPassword;" + _arg_1);
      }
      
      public function cem(_arg_1:String, _arg_2:Function) : void
      {
         this.qutevisu = _arg_2;
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;checkPasswordCorrectness;" + _arg_1);
      }
      
      public function updatePassword(_arg_1:String, _arg_2:String, _arg_3:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;updatePassword;" + _arg_1 + ";" + _arg_2 + ";" + _arg_3);
      }
      
      public function objectLoaded(_arg_1:String, _arg_2:Boolean) : void
      {
         this._email = _arg_1;
         bezyvesif.nuka(_arg_1,_arg_2);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

