package alternativa.tanks.models.service
{
   import flash.events.Event;
   
   public class ClanServiceEvent extends Event
   {
      
      public static const CLAN_LOADING:String = "CreateClanServiceEvent.CLAN_LOADING";
      
      public static const CLAN_BLOCK:String = "CreateClanServiceEvent.CLAN_BLOCK";
      
      public var reasonBlock:String;
      
      public function ClanServiceEvent(_arg_1:String, _arg_2:String = "", _arg_3:Boolean = false, _arg_4:Boolean = false)
      {
         this.reasonBlock = _arg_2;
         super(_arg_1,_arg_3,_arg_4);
      }
   }
}

