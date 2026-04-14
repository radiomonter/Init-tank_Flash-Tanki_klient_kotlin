package alternativa.tanks.gui.settings
{
   import alternativa.tanks.AbstractEnum;
   
   public class Juteqisyt extends AbstractEnum
   {
      
      private static var tep:Vector.<Juteqisyt>;
      
      public static const GRAPHIC:Juteqisyt = new Juteqisyt(0,"GRAPHIC");
      
      public static const ACCOUNT:Juteqisyt = new Juteqisyt(1,"ACCOUNT");
      
      public static const SOUND:Juteqisyt = new Juteqisyt(2,"SOUND");
      
      public static const GAME:Juteqisyt = new Juteqisyt(3,"GAME");
      
      public static const CONTROL:Juteqisyt = new Juteqisyt(4,"CONTROL");
      
      public function Juteqisyt(_arg_1:int, _arg_2:String)
      {
         super(_arg_1,_arg_2);
      }
      
      public static function get values() : Vector.<Juteqisyt>
      {
         if(!tep)
         {
            tep = new Vector.<Juteqisyt>(5,true);
            tep[GRAPHIC.value] = GRAPHIC;
            tep[ACCOUNT.value] = ACCOUNT;
            tep[SOUND.value] = SOUND;
            tep[GAME.value] = GAME;
            tep[CONTROL.value] = CONTROL;
         }
         return tep;
      }
   }
}

