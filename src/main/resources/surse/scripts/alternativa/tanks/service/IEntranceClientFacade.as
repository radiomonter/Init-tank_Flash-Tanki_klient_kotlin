package alternativa.tanks.service
{
   import flash.display.BitmapData;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.entrance.model.entrance.captcha.CaptchaLocation;
   import projects.tanks.client.entrance.model.entrance.emailconfirm.ConfirmEmailStatus;
   
   public interface IEntranceClientFacade
   {
      
      function set magyj(param1:BitmapData) : void;
      
      function set fef(param1:IGameObject) : void;
      
      function wrongPassword() : void;
      
      function pojelyhuj() : void;
      
      function inviteNotFound() : void;
      
      function heguqe() : void;
      
      function inviteAlreadyActivated(param1:String) : void;
      
      function goToLoginForm() : void;
      
      function ropiqybuc() : void;
      
      function cuvanosin(param1:Vector.<String>) : void;
      
      function lofoju() : void;
      
      function tykivaq() : void;
      
      function kakeroge() : void;
      
      function cowolog() : void;
      
      function cigekisuz(param1:String) : void;
      
      function setPasswordChangeResult(param1:Boolean, param2:String) : void;
      
      function gezoculir() : void;
      
      function set inviteEnabled(param1:Boolean) : void;
      
      function set registrationThroughEmail(param1:Boolean) : void;
      
      function set antiAddictionEnabled(param1:Boolean) : void;
      
      function captchaUpdated(param1:CaptchaLocation, param2:Vector.<int>) : void;
      
      function set pitycodaq(param1:Vector.<CaptchaLocation>) : void;
      
      function captchaAnswerCorrect(param1:CaptchaLocation) : void;
      
      function bobawu(param1:CaptchaLocation, param2:Vector.<int>) : void;
      
      function confirmEmailStatus(param1:ConfirmEmailStatus) : void;
      
      function visizecub(param1:String) : void;
      
      function mimycaleg(param1:String, param2:int, param3:int, param4:int) : void;
      
      function qilesyke() : void;
      
      function tyrinakis() : void;
      
      function myvypiri() : void;
      
      function nokul() : void;
      
      function komujojo() : void;
      
      function gotamure() : void;
      
      function gonele() : void;
      
      function citym(param1:String) : void;
      
      function dityv(param1:String) : void;
      
      function serverHalt() : void;
      
      function les() : void;
      
      function emailIsBusy() : void;
      
      function tujy() : void;
      
      function emailDomainIsForbidden() : void;
      
      function hedahywer(param1:String) : void;
      
      function externalLinkAlreadyExists() : void;
      
      function externalValidationFailed() : void;
   }
}

