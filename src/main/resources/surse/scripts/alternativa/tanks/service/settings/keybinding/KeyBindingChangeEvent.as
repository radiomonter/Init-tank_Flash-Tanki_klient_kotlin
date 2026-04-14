package alternativa.tanks.service.settings.keybinding
{
   import flash.events.Event;
   
   public class KeyBindingChangeEvent extends Event
   {
      
      public static const qici:String = "action changed: ";
      
      private var vaf:GameActionEnum;
      
      public function KeyBindingChangeEvent(_arg_1:String, _arg_2:GameActionEnum)
      {
         super(_arg_1,true,false);
         this.vaf = _arg_2;
      }
      
      public function vabofopeh() : GameActionEnum
      {
         return this.vaf;
      }
   }
}

