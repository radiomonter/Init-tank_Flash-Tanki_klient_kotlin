package forms.events
{
   import flash.events.Event;
   
   public class FormEvent extends Event
   {
      
      public static const FORM_DESTOY:String = "FormEventFormDestoy";
      
      public function FormEvent(_arg_1:String)
      {
         super(_arg_1,false,false);
      }
   }
}

