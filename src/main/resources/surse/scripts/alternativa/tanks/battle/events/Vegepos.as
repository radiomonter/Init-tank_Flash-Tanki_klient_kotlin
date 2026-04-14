package alternativa.tanks.battle.events
{
   public class Vegepos
   {
      
      public static const nugeve:Vegepos = new Vegepos(false);
      
      public static const figahe:Vegepos = new Vegepos(true);
      
      private var luh:Boolean;
      
      public function Vegepos(_arg_1:Boolean)
      {
         super();
         this.luh = _arg_1;
      }
      
      public function get kum() : Boolean
      {
         return this.luh;
      }
   }
}

