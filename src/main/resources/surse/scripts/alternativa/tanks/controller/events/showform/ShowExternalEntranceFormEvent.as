package alternativa.tanks.controller.events.showform
{
   import flash.events.Event;
   
   public class ShowExternalEntranceFormEvent extends Event
   {
      
      public static const REGISTRATION_FORM:String = "ShowExternalEntranceFormEvent.REGISTRATION_FORM";
      
      public static const LOGIN_FORM:String = "ShowExternalEntranceFormEvent.LOGIN_FORM";
      
      public var loginCaptchaEnabled:Boolean;
      
      public var presetCallsign:String;
      
      public var socialNetworkId:String;
      
      public function ShowExternalEntranceFormEvent(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean)
      {
         this.socialNetworkId = _arg_2;
         this.presetCallsign = _arg_3;
         this.loginCaptchaEnabled = _arg_4;
         super(_arg_1);
      }
      
      override public function clone() : Event
      {
         return new ShowExternalEntranceFormEvent(type,this.socialNetworkId,this.presetCallsign,this.loginCaptchaEnabled);
      }
   }
}

