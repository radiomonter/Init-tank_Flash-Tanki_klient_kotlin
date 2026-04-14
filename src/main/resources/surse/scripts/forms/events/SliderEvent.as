package forms.events
{
   import flash.events.Event;
   
   public class SliderEvent extends Event
   {
      
      public static const CHANGE_VALUE:String = "SliderChangeValue";
      
      public var currentValue:Number;
      
      public function SliderEvent(_arg_1:Number)
      {
         this.currentValue = _arg_1;
         super(CHANGE_VALUE,true,false);
      }
   }
}

