package alternativa.tanks.servermodels.captcha
{
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   
   public interface IServerCaptcha
   {
      
      function checkCaptcha(param1:String, param2:CaptchaLocation) : void;
      
      function getNewCaptcha(param1:CaptchaLocation) : void;
   }
}

