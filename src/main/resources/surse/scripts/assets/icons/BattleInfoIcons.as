package assets.icons
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol476")]
   public class BattleInfoIcons extends MovieClip
   {
      
      public static const TIME_LIMIT:int = 1;
      
      public static const KILL_LIMIT:int = 2;
      
      public static const FRIENDLY_FIRE:int = 3;
      
      public static const AUTO_BALANCE:int = 4;
      
      public static const MONEY:int = 5;
      
      public static const PLAYERS:int = 6;
      
      public static const CTF:int = 7;
      
      public static const PAYD:int = 8;
      
      public static const INVENTORY:int = 9;
      
      public function BattleInfoIcons()
      {
         super();
         this.type = TIME_LIMIT;
      }
      
      public function set type(param1:int) : void
      {
         gotoAndStop(param1);
      }
   }
}

