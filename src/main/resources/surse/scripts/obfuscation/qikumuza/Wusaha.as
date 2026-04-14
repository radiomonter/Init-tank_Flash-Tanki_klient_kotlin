package obfuscation.qikumuza
{
   import obfuscation.fidyha.Bideri;
   import obfuscation.fidyha.Hihik;
   
   public class Wusaha extends Bideri implements Hihik, Dot
   {
      
      public function Wusaha()
      {
         super();
      }
      
      public function getClanName() : String
      {
         return getInitParam() != null ? getInitParam().clanName : null;
      }
      
      public function getClanLink() : String
      {
         return getInitParam() != null ? getInitParam().clanLink : null;
      }
   }
}

