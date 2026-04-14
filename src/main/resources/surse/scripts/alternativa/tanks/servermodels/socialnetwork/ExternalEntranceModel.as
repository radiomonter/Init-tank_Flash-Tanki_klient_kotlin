package alternativa.tanks.servermodels.socialnetwork
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.service.IEntranceClientFacade;
   import flash.external.ExternalInterface;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import fominskiy.networking.INetworkListener;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import fominskiy.networking.commands.Command;
   import fominskiy.networking.commands.Type;
   import projects.tanks.client.entrance.model.entrance.externalentrance.SocialNetworkEntranceParams;
   import projects.tanks.clients.flash.commons.services.nameutils.SocialNetworkNameUtils;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.alertservices.IAlertService;
   import services.alertservice.AlertAnswer;
   
   public class ExternalEntranceModel implements IExternalEntranceModel, INetworkListener
   {
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var alertService:IAlertService;
      
      public var data:SocialNetworkEntranceParams = new SocialNetworkEntranceParams();
      
      private var isSendStartRegisterFacade:Boolean;
      
      private var isSendStartLoginFacade:Boolean;
      
      private var _socialNetworkId:String;
      
      public function ExternalEntranceModel()
      {
         super();
      }
      
      private static function goToURL(_arg_1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("newPopup",_arg_1);
         }
         else
         {
            navigateToURL(new URLRequest(_arg_1));
         }
      }
      
      public function onData(_arg_1:Command) : void
      {
         if(_arg_1.type == Type.AUTH)
         {
            switch(_arg_1.args[0])
            {
               case "init_external_model":
                  this.data.authorizationUrl = _arg_1.args[1];
                  this.data.snId = _arg_1.args[2];
                  return;
               case "external_model_validation_success":
                  this.validationSuccess();
                  return;
            }
         }
      }
      
      public function login(_arg_1:String, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("auth;external_create_link_for_existing_user;" + _arg_1 + ";" + _arg_2);
      }
      
      public function startExternalRegisterUser(_arg_1:String, _arg_2:Boolean, _arg_3:String) : void
      {
         this.isSendStartRegisterFacade = true;
         this.startExternalEnter(_arg_1,_arg_2,_arg_3);
      }
      
      public function startExternalLoginUser(_arg_1:String, _arg_2:Boolean, _arg_3:String) : void
      {
         this.isSendStartLoginFacade = true;
         this.startExternalEnter(_arg_1,_arg_2,_arg_3);
      }
      
      private function startExternalEnter(_arg_1:String, _arg_2:Boolean, _arg_3:String) : void
      {
         this._socialNetworkId = _arg_1;
         Network(OSGi.getInstance().getService(INetworker)).send("auth;set_login_data;" + _arg_2);
         goToURL(this.getAuthorizationUrl(_arg_1));
      }
      
      private function getAuthorizationUrl(_arg_1:String) : String
      {
         var _local_2:SocialNetworkEntranceParams = this.data;
         if(_local_2.snId == _arg_1)
         {
            return _local_2.authorizationUrl;
         }
         return null;
      }
      
      public function finishExternalRegisterUser(_arg_1:String, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("registration;register_via_discord;" + _arg_1);
      }
      
      public function objectLoaded() : void
      {
      }
      
      public function validationSuccess() : void
      {
         if(this.isSendStartRegisterFacade)
         {
            this.isSendStartRegisterFacade = false;
            clientFacade.citym("vkontakte");
         }
         if(this.isSendStartLoginFacade)
         {
            this.isSendStartLoginFacade = false;
            clientFacade.dityv("vkontakte");
         }
      }
      
      public function wrongPassword() : void
      {
         clientFacade.pojelyhuj();
      }
      
      public function validationFailed() : void
      {
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_ERROR_EXTERNAL_ENTER),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
         clientFacade.externalValidationFailed();
      }
      
      public function linkAlreadyExists() : void
      {
         alertService.showAlert(localeService.getText(TextConst.STRING_ALERT_GAME_ACCOUNT_ALREADY_LINKED,SocialNetworkNameUtils.makeSocialNetworkNameFromId("vkontakte")),Vector.<String>([localeService.getText(AlertAnswer.OK)]));
         clientFacade.externalLinkAlreadyExists();
      }
   }
}

