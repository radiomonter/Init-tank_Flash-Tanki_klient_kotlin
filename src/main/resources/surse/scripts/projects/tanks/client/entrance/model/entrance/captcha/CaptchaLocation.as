package projects.tanks.client.entrance.model.entrance.captcha
{
   public class CaptchaLocation
   {
      
      public static const LOGIN_FORM:CaptchaLocation = new CaptchaLocation(0,"LOGIN_FORM");
      
      public static const REGISTER_FORM:CaptchaLocation = new CaptchaLocation(1,"REGISTER_FORM");
      
      public static const CLIENT_STARTUP:CaptchaLocation = new CaptchaLocation(2,"CLIENT_STARTUP");
      
      public static const RESTORE_PASSWORD_FORM:CaptchaLocation = new CaptchaLocation(3,"RESTORE_PASSWORD_FORM");
      
      public static const EMAIL_CHANGE_HASH:CaptchaLocation = new CaptchaLocation(4,"EMAIL_CHANGE_HASH");
      
      public static const ACCOUNT_SETTINGS_FORM:CaptchaLocation = new CaptchaLocation(5,"ACCOUNT_SETTINGS_FORM");
      
      private var _value:int;
      
      private var _name:String;
      
      public function CaptchaLocation(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<CaptchaLocation>
      {
         var _local_1:Vector.<CaptchaLocation> = new Vector.<CaptchaLocation>();
         _local_1.push(LOGIN_FORM);
         _local_1.push(REGISTER_FORM);
         _local_1.push(CLIENT_STARTUP);
         _local_1.push(RESTORE_PASSWORD_FORM);
         _local_1.push(EMAIL_CHANGE_HASH);
         _local_1.push(ACCOUNT_SETTINGS_FORM);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "CaptchaLocation [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

