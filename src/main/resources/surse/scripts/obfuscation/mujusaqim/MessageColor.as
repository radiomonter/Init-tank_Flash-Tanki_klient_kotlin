package obfuscation.mujusaqim
{
   import obfuscation.bude.BattleTeam;
   
   public class MessageColor
   {
      
      public static const gajefo:uint = 65280;
      
      public static const vase:uint = 16776960;
      
      public static const BLUE:uint = 4691967;
      
      public static const RED:uint = 15741974;
      
      public static const DEFAULT:uint = 65280;
      
      public static const YELLOW:uint = 16776960;
      
      public static const bivyzafo:uint = 16750081;
      
      public static const WHITE:uint = 14540253;
      
      public function MessageColor()
      {
         super();
      }
      
      public static function tufytela(_arg_1:BattleTeam) : uint
      {
         switch(_arg_1)
         {
            case BattleTeam.BLUE:
               return MessageColor.BLUE;
            case BattleTeam.RED:
               return MessageColor.RED;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function sorijez(_arg_1:BattleTeam, _arg_2:Boolean) : uint
      {
         if(_arg_2)
         {
            return MessageColor.YELLOW;
         }
         switch(_arg_1)
         {
            case BattleTeam.BLUE:
               return MessageColor.BLUE;
            case BattleTeam.RED:
               return MessageColor.RED;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function kepumuwap(_arg_1:BattleTeam, _arg_2:Boolean, _arg_3:Boolean) : uint
      {
         if(!_arg_2)
         {
            return MessageColor.WHITE;
         }
         if(_arg_3)
         {
            return 16777071;
         }
         switch(_arg_1)
         {
            case BattleTeam.BLUE:
               return 10013694;
            case BattleTeam.RED:
               return 16685208;
            default:
               return MessageColor.DEFAULT;
         }
      }
      
      public static function nidebecas(_arg_1:uint) : Boolean
      {
         return _arg_1 == MessageColor.BLUE || _arg_1 == MessageColor.RED;
      }
   }
}

