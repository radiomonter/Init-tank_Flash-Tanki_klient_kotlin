package fominskiy.networking.commands
{
   public class Type
   {
      
      public static var AUTH:Type = new Type("AUTH");
      
      public static var REGISTRATON:Type = new Type("REGISTRATON");
      
      public static var CHAT:Type = new Type("CHAT");
      
      public static var GARAGE:Type = new Type("GARAGE");
      
      public static var LOBBY:Type = new Type("LOBBY");
      
      public static var BATTLE:Type = new Type("BATTLE");
      
      public static var PING:Type = new Type("PING");
      
      public static var LOBBY_CHAT:Type = new Type("LOBBY_CHAT");
      
      public static var SYSTEM:Type = new Type("SYSTEM");
      
      public static var RESTORE:Type = new Type("RESTORE");
      
      public static var BATTLE_SELECT:Type = new Type("BATTLE_SELECT");
      
      public static var CLAN:Type = new Type("CLAN");
      
      public static var UNKNOWN:Type = new Type("UNKNOWN");
      
      private var name:String;
      
      public function Type(_arg_1:String = null)
      {
         super();
         this.name = _arg_1;
      }
      
      public function toString() : String
      {
         return this.name;
      }
   }
}

