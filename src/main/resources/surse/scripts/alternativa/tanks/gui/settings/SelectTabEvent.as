package alternativa.tanks.gui.settings
{
   import flash.events.Event;
   
   public class SelectTabEvent extends Event
   {
      
      public static var dajivak:String = "SelectTabEvent";
      
      private var selectedCategory:Juteqisyt;
      
      public function SelectTabEvent(_arg_1:Juteqisyt)
      {
         super(dajivak);
         this.selectedCategory = _arg_1;
      }
      
      public function getSelectedCategory() : Juteqisyt
      {
         return this.selectedCategory;
      }
   }
}

