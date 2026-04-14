package alternativa.tanks.gui.presents
{
   import flash.events.Event;
   
   public class NewPresentsAlertEvent extends Event
   {
      
      public static const ACCEPT:String = "NewPresentsAlertEvent.Accept";
      
      public static const CANCEL:String = "NewPresentsAlertEvent.Cancel";
      
      public function NewPresentsAlertEvent(_arg_1:String)
      {
         super(_arg_1);
      }
   }
}

