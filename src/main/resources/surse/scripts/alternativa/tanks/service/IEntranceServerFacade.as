package alternativa.tanks.service
{
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public interface IEntranceServerFacade
   {
      
      function checkCallsign(param1:String) : void;
      
      function resetic(param1:String) : void;
      
      function qolatap(param1:String) : void;
      
      function vyfyfowom(param1:String, param2:String) : void;
      
      function login(param1:String, param2:String, param3:Boolean, param4:String) : void;
      
      function pasica(param1:String, param2:String) : void;
      
      function gikir() : void;
      
      function wepapibos(param1:String) : void;
      
      function changePasswordAndEmail(param1:String, param2:String) : void;
      
      function loginByHash(param1:String) : void;
      
      function loginBySingleUseHash(param1:String) : void;
      
      function hoji(param1:String, param2:String) : void;
      
      function set fef(param1:IGameObject) : void;
      
      function nibu(param1:String, param2:String, param3:String, param4:Boolean, param5:String, param6:String, param7:String, param8:String) : void;
      
      function tysygu(param1:String, param2:String, param3:String, param4:String, param5:String, param6:String) : void;
      
      function getNewCaptcha(param1:CaptchaLocation) : void;
      
      function checkCaptcha(param1:String, param2:CaptchaLocation) : void;
      
      function kuji(param1:String, param2:String) : void;
      
      function startExternalRegisterUser(param1:String, param2:Boolean, param3:String) : void;
      
      function startExternalLoginUser(param1:String, param2:Boolean, param3:String) : void;
      
      function finishExternalRegisterUser(param1:String, param2:String) : void;
      
      function keheruco(param1:String) : void;
      
      function wunagapu(param1:String, param2:String) : void;
      
      function kidytag(param1:String, param2:String) : void;
   }
}

