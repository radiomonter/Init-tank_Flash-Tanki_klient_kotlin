package alternativa.tanks.models.panel.create
{
   import flash.events.Event;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class CreateClanServiceEvent extends Event
   {
      
      public static const CREATE:String = "CreateClanServiceEvent.CREATE";
      
      public static const VALIDATE_NAME:String = "CreateClanServiceEvent.VALIDATE_NAME";
      
      public static const VALIDATE_TAG:String = "CreateClanServiceEvent.VALIDATE_TAG";
      
      public static const CORRECT_NAME:String = "ValidateClanNameEvent.CORRECT_NAME";
      
      public static const INCORRECT_NAME:String = "ValidateClanNameEvent.INCORRECT_NAME";
      
      public static const CORRECT_TAG:String = "ValidateClanNameEvent.CORRECT_TAG";
      
      public static const INCORRECT_TAG:String = "ValidateClanNameEvent.INCORRECT_TAG";
      
      public static const NOT_UNIQUE_NAME:String = "ValidateClanNameEvent.NOT_UNIQUE_NAME";
      
      public static const NOT_UNIQUE_TAG:String = "ValidateClanNameEvent.NOT_UNIQUE_TAG";
      
      public static const OTHER_ERROR:String = "ValidateClanNameEvent.OTHER_ERROR";
      
      public static const ALREADY_IN_CLAN:String = "ValidateClanNameEvent.ALREADY_IN_CLAN";
      
      public var clanName:String;
      
      public var clanTag:String;
      
      public var description:String;
      
      public var clanFlag:ClanFlag;
      
      public function CreateClanServiceEvent(_arg_1:String, _arg_2:String = "", _arg_3:String = "", _arg_4:String = "", _arg_5:ClanFlag = null, _arg_6:Boolean = false, _arg_7:Boolean = false)
      {
         this.clanName = _arg_2;
         this.clanTag = _arg_3;
         this.description = _arg_4;
         this.clanFlag = _arg_5;
         super(_arg_1,_arg_6,_arg_7);
      }
   }
}

