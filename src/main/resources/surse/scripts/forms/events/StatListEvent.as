package forms.events
{
   import flash.events.Event;
   
   public class StatListEvent extends Event
   {
      
      public static const UPDATE_STAT:String = "StatListUpdate";
      
      public static const UPDATE_SORT:String = "StatListUpdateSort";
      
      public var beginPosition:int = 0;
      
      public var numRow:int = 0;
      
      public var sortField:int;
      
      public function StatListEvent(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:int = 1)
      {
         super(_arg_1,true,false);
         this.beginPosition = _arg_2;
         this.numRow = _arg_3;
         this.sortField = _arg_4;
      }
   }
}

