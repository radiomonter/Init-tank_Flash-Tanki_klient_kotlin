package obfuscation.rabygi
{
   import flash.events.Event;
   import obfuscation.pejug.Magyp;
   
   public class Jabehi extends Event
   {
      
      public static const DAILY_QUEST_CHANGE:String = "DailyQuestChange";
      
      public var puw:Magyp;
      
      public function Jabehi(_arg_1:String, _arg_2:Magyp)
      {
         super(_arg_1,true);
         this.puw = _arg_2;
      }
   }
}

