package alternativa.tanks.view.forms.freeuids
{
   import flash.events.Event;
   
   public class FreeUidsFormEvent extends Event
   {
      
      public static const FOCUS_OUT:String = "FreeUidsFormEvent.FOCUS_OUT";
      
      public static const CLICK_ITEM:String = "FreeUidsFormEvent.CLICK_ITEM";
      
      private var _uid:String;
      
      public function FreeUidsFormEvent(_arg_1:String, _arg_2:Boolean = false, _arg_3:Boolean = false)
      {
         super(_arg_1,_arg_2,_arg_3);
      }
      
      public function get uid() : String
      {
         return this._uid;
      }
      
      public function set uid(_arg_1:String) : void
      {
         this._uid = _arg_1;
      }
   }
}

