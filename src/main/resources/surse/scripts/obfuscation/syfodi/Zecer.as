package obfuscation.syfodi
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.servermodels.captcha.IServerCaptcha;
   import alternativa.tanks.servermodels.login.ILogin;
   import alternativa.tanks.servermodels.loginbyhash.ILoginByHash;
   import alternativa.tanks.servermodels.registartion.password.IPasswordRegistration;
   import alternativa.tanks.servermodels.socialnetwork.IExternalEntranceModel;
   import alternativa.tanks.service.IEntranceServerFacade;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import org.robotlegs.mvcs.Actor;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public class Zecer extends Actor implements IEntranceServerFacade
   {
      
      private var _gameObject:IGameObject;
      
      public function Zecer()
      {
         super();
      }
      
      public function checkCallsign(_arg_1:String) : void
      {
         IPasswordRegistration(OSGi.getInstance().getService(IPasswordRegistration)).checkCallsign(_arg_1);
      }
      
      public function resetic(_arg_1:String) : void
      {
      }
      
      public function qolatap(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("system;activateInvite;" + _arg_1);
      }
      
      public function vyfyfowom(_arg_1:String, _arg_2:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("restore;recovery_account;" + _arg_1 + ";" + _arg_2);
      }
      
      public function login(_arg_1:String, _arg_2:String, _arg_3:Boolean, _arg_4:String) : void
      {
         ILogin(OSGi.getInstance().getService(ILogin)).login(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      public function pasica(_arg_1:String, _arg_2:String) : void
      {
         IExternalEntranceModel(OSGi.getInstance().getService(IExternalEntranceModel)).login(_arg_1,_arg_2);
      }
      
      public function gikir() : void
      {
      }
      
      public function wepapibos(_arg_1:String) : void
      {
      }
      
      public function loginByHash(_arg_1:String) : void
      {
         ILoginByHash(OSGi.getInstance().getService(ILoginByHash)).loginByHash(_arg_1);
      }
      
      public function loginBySingleUseHash(_arg_1:String) : void
      {
      }
      
      public function hoji(_arg_1:String, _arg_2:String) : void
      {
      }
      
      public function set fef(_arg_1:IGameObject) : void
      {
         this._gameObject = _arg_1;
      }
      
      public function nibu(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:String, _arg_6:String, _arg_7:String, _arg_8:String) : void
      {
         (OSGi.getInstance().getService(IPasswordRegistration) as IPasswordRegistration).register(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7,_arg_8);
      }
      
      public function tysygu(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:String) : void
      {
      }
      
      public function getNewCaptcha(_arg_1:CaptchaLocation) : void
      {
         (OSGi.getInstance().getService(IServerCaptcha) as IServerCaptcha).getNewCaptcha(_arg_1);
      }
      
      public function checkCaptcha(_arg_1:String, _arg_2:CaptchaLocation) : void
      {
      }
      
      public function changePasswordAndEmail(_arg_1:String, _arg_2:String) : void
      {
      }
      
      public function kuji(_arg_1:String, _arg_2:String) : void
      {
      }
      
      public function startExternalRegisterUser(_arg_1:String, _arg_2:Boolean, _arg_3:String) : void
      {
         IExternalEntranceModel(OSGi.getInstance().getService(IExternalEntranceModel)).startExternalRegisterUser(_arg_1,_arg_2,_arg_3);
      }
      
      public function startExternalLoginUser(_arg_1:String, _arg_2:Boolean, _arg_3:String) : void
      {
         IExternalEntranceModel(OSGi.getInstance().getService(IExternalEntranceModel)).startExternalLoginUser(_arg_1,_arg_2,_arg_3);
      }
      
      public function finishExternalRegisterUser(_arg_1:String, _arg_2:String) : void
      {
         IExternalEntranceModel(OSGi.getInstance().getService(IExternalEntranceModel)).finishExternalRegisterUser(_arg_1,_arg_2);
      }
      
      public function keheruco(_arg_1:String) : void
      {
      }
      
      public function wunagapu(_arg_1:String, _arg_2:String) : void
      {
      }
      
      public function kidytag(_arg_1:String, _arg_2:String) : void
      {
      }
   }
}

