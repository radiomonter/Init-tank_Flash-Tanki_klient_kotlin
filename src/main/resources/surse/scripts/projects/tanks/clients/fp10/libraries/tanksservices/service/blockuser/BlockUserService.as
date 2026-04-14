package projects.tanks.clients.fp10.libraries.tanksservices.service.blockuser
{
   import flash.net.SharedObject;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class BlockUserService implements IBlockUserService
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      private static var so:SharedObject;
      
      public function BlockUserService()
      {
         super();
      }
      
      public function getBlockList() : Array
      {
         var _local_1:Array = null;
         so = storageService.getStorage();
         _local_1 = so.data.blocklist;
         if(_local_1 == null)
         {
            _local_1 = new Array();
         }
         return _local_1;
      }
      
      public function blockUser(_arg_1:String) : void
      {
         var _local_2:Array = null;
         var _local_3:String = _arg_1;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
         }
         var _local_4:int = _local_2.indexOf(_local_3);
         if(_local_4 > -1)
         {
            _local_2.splice(_local_4,1);
         }
         _local_2.push(_local_3);
         so.data.blocklist = _local_2;
      }
      
      public function unblockUser(_arg_1:String) : void
      {
         var _local_2:Array = null;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
         }
         var _local_3:int = _local_2.indexOf(_arg_1);
         if(_local_3 > -1)
         {
            _local_2.splice(_local_3,1);
         }
         so.data.blocklist = _local_2;
      }
      
      public function unblockAll() : void
      {
         so = storageService.getStorage();
         so.data.blocklist = new Array();
      }
      
      public function isBlocked(_arg_1:String) : Boolean
      {
         var _local_2:Array = null;
         var _local_3:int = 0;
         so = storageService.getStorage();
         _local_2 = so.data.blocklist;
         if(_local_2 == null)
         {
            _local_2 = new Array();
            so.data.blocklist = _local_2;
         }
         _local_3 = _local_2.indexOf(_arg_1);
         return _local_3 > -1;
      }
   }
}

