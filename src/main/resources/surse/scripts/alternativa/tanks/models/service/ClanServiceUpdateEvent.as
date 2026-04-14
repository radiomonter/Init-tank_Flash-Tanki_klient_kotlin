package alternativa.tanks.models.service
{
   import flash.events.Event;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class ClanServiceUpdateEvent extends Event
   {
      
      public static const UPDATE:String = "CreateClanServiceEvent.UPDATE";
      
      public var description:String;
      
      public var flag:ClanFlag;
      
      public var rankIndex:int;
      
      public var incomingRequestsEnabled:Boolean;
      
      public function ClanServiceUpdateEvent(_arg_1:String, _arg_2:String, _arg_3:int, _arg_4:ClanFlag, _arg_5:Boolean, _arg_6:Boolean = false, _arg_7:Boolean = false)
      {
         this.description = _arg_2;
         this.flag = _arg_4;
         this.rankIndex = _arg_3;
         this.incomingRequestsEnabled = _arg_5;
         super(_arg_1,_arg_6,_arg_7);
      }
   }
}

