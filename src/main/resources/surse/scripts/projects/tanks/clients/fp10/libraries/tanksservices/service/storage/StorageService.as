package projects.tanks.clients.fp10.libraries.tanksservices.service.storage
{
   import flash.net.SharedObject;
   
   public class StorageService implements IStorageService
   {
      
      private var storage:SharedObject;
      
      private var accountsStorage:SharedObject;
      
      public function StorageService(_arg_1:SharedObject, _arg_2:SharedObject)
      {
         super();
         this.storage = _arg_1;
         this.accountsStorage = _arg_2;
      }
      
      public function getStorage() : SharedObject
      {
         return this.storage;
      }
      
      public function getAccountsStorage() : SharedObject
      {
         return this.accountsStorage;
      }
   }
}

