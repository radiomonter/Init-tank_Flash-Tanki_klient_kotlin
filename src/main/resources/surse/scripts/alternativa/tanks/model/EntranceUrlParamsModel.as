package alternativa.tanks.model
{
   import org.robotlegs.mvcs.Actor;
   
   public class EntranceUrlParamsModel extends Actor
   {
      
      private var _entranceHash:String;
      
      private var _singleUseHash:String;
      
      private var _domain:String;
      
      private var _passedCallsign:String;
      
      private var _passedPassword:String;
      
      private var _emailConfirmHash:String;
      
      private var _emailChangeHash:String;
      
      private var _email:String;
      
      private var _referralHash:String;
      
      private var _ifengUserName:String;
      
      private var _ifengServerRegion:String;
      
      private var _ifengTime:String;
      
      private var _ifengFlag:String;
      
      private var _ifengCm:String;
      
      private var _tutorialHash:String;
      
      public function EntranceUrlParamsModel()
      {
         super();
      }
      
      public function get entranceHash() : String
      {
         return this._entranceHash;
      }
      
      public function get domain() : String
      {
         return this._domain;
      }
      
      public function get passedCallsign() : String
      {
         return this._passedCallsign;
      }
      
      public function get emailConfirmHash() : String
      {
         return this._emailConfirmHash;
      }
      
      public function get emailChangeHash() : String
      {
         return this._emailChangeHash;
      }
      
      public function get email() : String
      {
         return this._email;
      }
      
      public function get referralHash() : String
      {
         return this._referralHash;
      }
      
      public function get ifengUserName() : String
      {
         return this._ifengUserName;
      }
      
      public function get singleUseHash() : String
      {
         return this._singleUseHash;
      }
      
      public function set entranceHash(_arg_1:String) : void
      {
         this._entranceHash = _arg_1;
      }
      
      public function set domain(_arg_1:String) : void
      {
         this._domain = _arg_1;
      }
      
      public function set passedCallsign(_arg_1:String) : void
      {
         this._passedCallsign = _arg_1;
      }
      
      public function set emailConfirmHash(_arg_1:String) : void
      {
         this._emailConfirmHash = _arg_1;
      }
      
      public function set emailChangeHash(_arg_1:String) : void
      {
         this._emailChangeHash = _arg_1;
      }
      
      public function set email(_arg_1:String) : void
      {
         this._email = _arg_1;
      }
      
      public function set referralHash(_arg_1:String) : void
      {
         this._referralHash = _arg_1;
      }
      
      public function set ifengUserName(_arg_1:String) : void
      {
         this._ifengUserName = _arg_1;
      }
      
      public function set singleUseHash(_arg_1:String) : void
      {
         this._singleUseHash = _arg_1;
      }
      
      public function set ifengServerRegion(_arg_1:String) : void
      {
         this._ifengServerRegion = _arg_1;
      }
      
      public function set ifengTime(_arg_1:String) : void
      {
         this._ifengTime = _arg_1;
      }
      
      public function set ifengFlag(_arg_1:String) : void
      {
         this._ifengFlag = _arg_1;
      }
      
      public function set ifengCm(_arg_1:String) : void
      {
         this._ifengCm = _arg_1;
      }
      
      public function get ifengServerRegion() : String
      {
         return this._ifengServerRegion;
      }
      
      public function get ifengTime() : String
      {
         return this._ifengTime;
      }
      
      public function get ifengFlag() : String
      {
         return this._ifengFlag;
      }
      
      public function get ifengCm() : String
      {
         return this._ifengCm;
      }
      
      public function get tutorialHash() : String
      {
         return this._tutorialHash;
      }
      
      public function set tutorialHash(_arg_1:String) : void
      {
         this._tutorialHash = _arg_1;
      }
      
      public function get passedPassword() : String
      {
         return this._passedPassword;
      }
      
      public function set passedPassword(_arg_1:String) : void
      {
         this._passedPassword = _arg_1;
      }
   }
}

