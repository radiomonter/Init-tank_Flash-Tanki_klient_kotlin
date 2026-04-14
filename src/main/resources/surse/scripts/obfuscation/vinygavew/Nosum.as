package obfuscation.vinygavew
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import obfuscation.lucaby.Kene;
   import obfuscation.lucaby.Tezyl;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class Nosum extends Kene implements Tezyl, IObjectLoadListener
   {
      
      [Inject]
      public static var facade:IEntranceClientFacade;
      
      public function Nosum()
      {
         super();
      }
      
      public function serverHalt() : void
      {
         facade.serverHalt();
      }
      
      public function objectLoaded() : void
      {
         if(getInitParam().serverHalt)
         {
            facade.serverHalt();
         }
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloaded() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

