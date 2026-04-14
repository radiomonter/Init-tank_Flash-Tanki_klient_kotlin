package obfuscation.joni
{
   import obfuscation.bude.BattleTeam;
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class ShortUserInfo
   {
      
      public var userId:String;
      
      public var uid:String;
      
      public var rank:int;
      
      public var suspicious:Boolean;
      
      public var teamType:BattleTeam;
      
      public var chatModeratorLevel:ChatModeratorLevel;
      
      public function ShortUserInfo()
      {
         super();
      }
   }
}

