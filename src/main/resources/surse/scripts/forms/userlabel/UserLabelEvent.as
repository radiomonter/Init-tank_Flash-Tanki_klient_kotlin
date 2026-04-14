package forms.userlabel
{
   import flash.events.Event;
   
   public class UserLabelEvent extends Event
   {
      
      public static const CLICK_WITH_CTRL:String = "UserLabelEvent.CLICK_WITH_CTRL";
      
      public var uid:String;
      
      public function UserLabelEvent(_arg_1:String, _arg_2:String, _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.uid = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

