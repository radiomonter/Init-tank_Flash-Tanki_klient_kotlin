package obfuscation.syfodi
{
   import alternativa.tanks.service.AccountService;
   import org.robotlegs.mvcs.Actor;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class Fylyqyge extends Actor implements AccountService
   {
      
      [Inject]
      public var storageService:IStorageService;
      
      public function Fylyqyge()
      {
         super();
      }
      
      public function get bylige() : Boolean
      {
         return this.storageService.getStorage().data.alreadyPlayedTanks != null ? Boolean(this.storageService.getStorage().data.alreadyPlayedTanks) : Boolean(false);
      }
      
      public function set bylige(_arg_1:Boolean) : void
      {
         this.storageService.getStorage().data.alreadyPlayedTanks = true;
      }
      
      public function get bylitef() : String
      {
         return this.storageService.getStorage().data.userName;
      }
      
      public function set bylitef(_arg_1:String) : void
      {
         this.storageService.getStorage().data.userName = _arg_1;
      }
      
      public function get entranceHash() : String
      {
         return this.storageService.getStorage().data.userHash;
      }
   }
}

