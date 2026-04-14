package alternativa.tanks.services.spectatorservice
{
   public class Hyhyjac implements SpectatorService
   {
      
      private var hine:Boolean;
      
      public function Hyhyjac()
      {
         super();
      }
      
      public function jocytaruj() : Boolean
      {
         return this.hine;
      }
      
      public function ganiciq(_arg_1:Boolean) : void
      {
         this.hine = _arg_1;
      }
   }
}

