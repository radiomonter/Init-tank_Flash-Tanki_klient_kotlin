package alternativa.tanks.services
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import flash.events.EventDispatcher;
   import projects.tanks.client.chat.models.news.showing.NewsItemData;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class NewsServiceImpl extends EventDispatcher implements NewsService
   {
      
      [Inject]
      public static var storageService:IStorageService = IStorageService(OSGi.getInstance().getService(IStorageService));
      
      private static const READ_NEWS:String = "NEWS_SERVICE_READ_NEWS";
      
      private var newsItems:Vector.<NewsItemData>;
      
      private var newsItemsAddingCallback:Function;
      
      private var hasUnreadNewsCallback:Function;
      
      public function NewsServiceImpl()
      {
         super();
      }
      
      public function setInitialNewsItems(_arg_1:Vector.<NewsItemData>) : void
      {
         this.newsItems = _arg_1.concat();
         if(this.newsItemsAddingCallback != null)
         {
            this.newsItemsAddingCallback(_arg_1);
         }
         if(this.hasUnreadNewsCallback != null && this.hasUnreadNews())
         {
            this.hasUnreadNewsCallback();
         }
      }
      
      public function addNewsItem(_arg_1:NewsItemData) : void
      {
         var _local_2:NewsServiceEvent = null;
         if(this.newsItems == null)
         {
            this.newsItems = new Vector.<NewsItemData>();
         }
         this.newsItems.unshift(_arg_1);
         if(this.newsItemsAddingCallback != null)
         {
            _local_2 = new NewsServiceEvent(NewsServiceEvent.NEWS_ITEM_IS_SENT);
            _local_2.setNewsItem(_arg_1);
            dispatchEvent(_local_2);
         }
      }
      
      public function setIsViewed(_arg_1:Long) : void
      {
         var _local_2:Object = storageService.getStorage().data[READ_NEWS];
         if(_local_2 == null)
         {
            _local_2 = {};
         }
         _local_2[_arg_1.toString()] = "";
         storageService.getStorage().data[READ_NEWS] = _local_2;
      }
      
      public function removeNewsItem(_arg_1:Long) : void
      {
         var _local_2:NewsServiceEvent = new NewsServiceEvent(NewsServiceEvent.NEWS_ITEM_IS_REMOVED);
         _local_2.setNewsId(_arg_1);
         dispatchEvent(_local_2);
      }
      
      public function setNewsAddingCallback(_arg_1:Function) : void
      {
         if(this.newsItems != null)
         {
            _arg_1(this.newsItems);
         }
         else
         {
            this.newsItemsAddingCallback = _arg_1;
         }
      }
      
      public function setHasUnreadNewsCallback(_arg_1:Function) : void
      {
         if(this.newsItems == null)
         {
            this.hasUnreadNewsCallback = _arg_1;
         }
         else if(this.hasUnreadNews())
         {
            _arg_1();
         }
      }
      
      private function hasUnreadNews() : Boolean
      {
         var _local_1:NewsItemData = null;
         for each(_local_1 in this.newsItems)
         {
            if(!this.isViewed(_local_1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function isViewed(_arg_1:NewsItemData) : Boolean
      {
         var _local_2:Object = storageService.getStorage().data[READ_NEWS];
         if(!_local_2)
         {
            return false;
         }
         return _local_2.hasOwnProperty(_arg_1.id.toString());
      }
      
      public function clearExpiredReadNews() : void
      {
         var _local_4:NewsItemData = null;
         var _local_3:* = undefined;
         var _local_1:Object = storageService.getStorage().data[READ_NEWS];
         if(!_local_1)
         {
            return;
         }
         var _local_2:Object = {};
         for(_local_3 in _local_1)
         {
            for each(_local_4 in this.newsItems)
            {
               if(_local_3 == _local_4.id.toString())
               {
                  _local_2[_local_3] = "";
                  break;
               }
            }
         }
         storageService.getStorage().data[READ_NEWS] = _local_2;
      }
      
      public function resetNewsAddingCallback() : void
      {
         this.newsItemsAddingCallback = null;
      }
      
      public function resetHasUnreadNewsCallback() : void
      {
         this.hasUnreadNewsCallback = null;
      }
      
      public function cleanup() : void
      {
         this.newsItems = null;
      }
      
      public function getUnreadNewsItems() : Vector.<NewsItemData>
      {
         var _local_3:NewsItemData = null;
         var _local_1:Object = storageService.getStorage().data[READ_NEWS];
         if(_local_1 == null)
         {
            return this.newsItems;
         }
         var _local_2:Vector.<NewsItemData> = new Vector.<NewsItemData>();
         for each(_local_3 in this.newsItems)
         {
            if(!this.isNewsAlreadyRead(_local_1,_local_3))
            {
               _local_2.push(_local_3);
            }
         }
         return _local_2;
      }
      
      private function isNewsAlreadyRead(_arg_1:Object, _arg_2:NewsItemData) : Boolean
      {
         return _arg_1.hasOwnProperty(_arg_2.id.toString());
      }
   }
}

