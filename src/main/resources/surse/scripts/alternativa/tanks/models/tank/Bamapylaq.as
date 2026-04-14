package alternativa.tanks.models.tank
{
   import projects.tanks.client.users.services.chatmoderator.ChatModeratorLevel;
   
   public class Bamapylaq
   {
      
      public var name:String;
      
      public var rank:int;
      
      public var isLocal:Boolean;
      
      public var chatModeratorLevel:ChatModeratorLevel;
      
      public function Bamapylaq(_arg_1:String, _arg_2:int, _arg_3:Boolean, _arg_4:ChatModeratorLevel)
      {
         super();
         this.name = _arg_1;
         this.rank = _arg_2;
         this.isLocal = _arg_3;
         this.chatModeratorLevel = _arg_4;
      }
   }
}

