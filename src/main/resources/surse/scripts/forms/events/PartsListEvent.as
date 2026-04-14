package forms.events
{
   import flash.events.Event;
   
   public class PartsListEvent extends Event
   {
      
      public static const SELECT_PARTS_LIST_ITEM:String = "SelectPartsListItem";
      
      public static const ITEM_CLICK:String = "PartsListItemClick";
      
      public static const ITEM_DOUBLE_CLICK:String = "PartsListItemDoubleClick";
      
      public function PartsListEvent(_arg_1:String)
      {
         super(_arg_1,true,false);
      }
   }
}

