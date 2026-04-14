package alternativa.tanks.models.tank
{
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import obfuscation.bude.BattleTeam;
   
   public class Qemigofa
   {
      
      public static var teamType:BattleTeam = BattleTeam.NONE;
      
      private static const qutagij:EncryptedInt = new EncryptedIntImpl();
      
      public function Qemigofa()
      {
         super();
      }
      
      public static function javocu(_arg_1:int) : void
      {
         qutagij.setInt(_arg_1);
      }
      
      public static function liwalycir() : int
      {
         return qutagij.getInt();
      }
   }
}

