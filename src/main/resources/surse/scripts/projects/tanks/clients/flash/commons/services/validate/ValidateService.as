package projects.tanks.clients.flash.commons.services.validate
{
   public class ValidateService implements IValidateService
   {
      
      public static const EMAIL_PATTERN:RegExp = /^[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9\*]+)*@[a-zA-Z0-9]([\-\_\.]?[a-zA-Z0-9*]+)*\.[a-zA-Z]{2,}$/i;
      
      public static const UID_PATTERN:RegExp = /^[a-z0-9](([\.\-\w](?!(-|_|\.){2,}))*[a-z0-9])?$/i;
      
      public static const NOT_ALLOWED_PATTERN_FOR_REGISTRATION:RegExp = /[^0-9a-zA-Z\.\-\_]/gi;
      
      public static const NOT_ALLOWED_PATTERN_FOR_LOGIN:RegExp = /[^0-9a-zA-Z@\.\-\_]/gi;
      
      private const CHINA_NAME_PATTERN:RegExp = /^[一-龥]+$/;
      
      public function ValidateService()
      {
         super();
      }
      
      public function isUidValid(_arg_1:String) : Boolean
      {
         return _arg_1.match(UID_PATTERN) != null && _arg_1.length >= 2;
      }
      
      public function isEmailValid(_arg_1:String) : Boolean
      {
         return _arg_1.match(EMAIL_PATTERN) != null;
      }
      
      public function isValidIdentificationStringForRegistration(_arg_1:String) : Boolean
      {
         return _arg_1.match(NOT_ALLOWED_PATTERN_FOR_REGISTRATION).length == 0;
      }
      
      public function isValidIdentificationStringForLogin(_arg_1:String) : Boolean
      {
         return _arg_1.match(NOT_ALLOWED_PATTERN_FOR_LOGIN).length == 0;
      }
      
      public function isChinaCardIdValid(_arg_1:String) : Boolean
      {
         return ChinaCardIdValidator.isValidIdNumber(_arg_1);
      }
      
      public function isChinaNameValid(_arg_1:String) : Boolean
      {
         return _arg_1.match(this.CHINA_NAME_PATTERN) != null;
      }
   }
}

