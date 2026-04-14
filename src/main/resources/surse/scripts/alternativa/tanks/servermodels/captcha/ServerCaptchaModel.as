package alternativa.tanks.servermodels.captcha
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.service.IEntranceClientFacade;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class ServerCaptchaModel implements IServerCaptcha
   {
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      public function ServerCaptchaModel()
      {
         super();
      }
      
      public function showCaptcha(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         clientFacade.captchaUpdated(_arg_1,_arg_2);
      }
      
      public function captchaCorrect(_arg_1:CaptchaLocation) : void
      {
         clientFacade.captchaAnswerCorrect(_arg_1);
      }
      
      public function captchaFailed(_arg_1:CaptchaLocation, _arg_2:Vector.<int>) : void
      {
         clientFacade.bobawu(_arg_1,_arg_2);
      }
      
      public function checkCaptcha(_arg_1:String, _arg_2:CaptchaLocation) : void
      {
      }
      
      public function getNewCaptcha(_arg_1:CaptchaLocation) : void
      {
         switch(_arg_1)
         {
            case CaptchaLocation.LOGIN_FORM:
               Network(OSGi.getInstance().getService(INetworker)).send("auth;refresh_captcha");
               return;
            case CaptchaLocation.REGISTER_FORM:
               Network(OSGi.getInstance().getService(INetworker)).send("registration;refresh_captcha");
               return;
            case CaptchaLocation.RESTORE_PASSWORD_FORM:
               Network(OSGi.getInstance().getService(INetworker)).send("restore;refresh_captcha");
               return;
            case CaptchaLocation.ACCOUNT_SETTINGS_FORM:
               Network(OSGi.getInstance().getService(INetworker)).send("lobby;refresh_captcha");
               return;
            default:
               return;
         }
      }
      
      public function objectLoaded() : void
      {
         clientFacade.pitycodaq = new Vector.<CaptchaLocation>([CaptchaLocation.LOGIN_FORM,CaptchaLocation.REGISTER_FORM,CaptchaLocation.RESTORE_PASSWORD_FORM]);
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

