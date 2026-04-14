package alternativa.tanks.services.ping
{
   public class Jorytydek implements PingService
   {
      
      private var ping:Number = 0;
      
      public function Jorytydek()
      {
         super();
      }
      
      public function sategyny() : Number
      {
         return this.ping;
      }
      
      public function suz(_arg_1:Number) : void
      {
         this.ping = _arg_1;
      }
   }
}

