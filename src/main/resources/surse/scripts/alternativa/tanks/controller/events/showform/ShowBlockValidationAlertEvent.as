package alternativa.tanks.controller.events.showform
{
   import flash.events.Event;
   
   public class ShowBlockValidationAlertEvent extends Event
   {
      
      public static const YOU_WERE_BLOCKED:String = "ShowBlockValidationAlertEvent.YOU_WERE_BLOCKED";
      
      public static const YOU_WERE_KICKED:String = "ShowBlockValidationAlertEvent.YOU_WERE_KICKED";
      
      public var reason:String;
      
      public var minutes:int;
      
      public var hours:int;
      
      public var days:int;
      
      public function ShowBlockValidationAlertEvent(_arg_1:String, _arg_2:String, _arg_3:int = 0, _arg_4:int = 0, _arg_5:int = 0)
      {
         super(_arg_1);
         this.reason = _arg_2;
         this.minutes = _arg_3;
         this.hours = _arg_4;
         this.days = _arg_5;
      }
      
      override public function clone() : Event
      {
         return new ShowBlockValidationAlertEvent(type,this.reason,this.minutes,this.hours,this.days);
      }
   }
}

