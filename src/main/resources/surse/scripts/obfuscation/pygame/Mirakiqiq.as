package obfuscation.pygame
{
   import alternativa.tanks.service.IEntranceClientFacade;
   import obfuscation.pipis.Kefij;
   import obfuscation.pipis.Tynozodin;
   import platform.client.fp10.core.model.IObjectLoadListener;
   
   public class Mirakiqiq extends Tynozodin implements Kefij, Meca, IObjectLoadListener
   {
      
      [Inject]
      public static var clientFacade:IEntranceClientFacade;
      
      public function Mirakiqiq()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         clientFacade.inviteEnabled = getInitParam().enabled;
      }
      
      public function inviteNotFound() : void
      {
         clientFacade.inviteNotFound();
      }
      
      public function inviteFree() : void
      {
         clientFacade.heguqe();
      }
      
      public function inviteAlreadyActivated(_arg_1:String) : void
      {
         clientFacade.inviteAlreadyActivated(_arg_1);
      }
      
      public function damik(_arg_1:String) : void
      {
         server.vihynupyv(_arg_1);
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

