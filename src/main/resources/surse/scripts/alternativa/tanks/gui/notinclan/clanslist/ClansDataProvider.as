package alternativa.tanks.gui.notinclan.clanslist
{
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import alternativa.tanks.models.user.ClanUserService;
   import fl.data.DataProvider;
   import flash.utils.Dictionary;
   
   public class ClansDataProvider extends DataProvider
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      private static var _escapePattern:RegExp = /\-|\./;
      
      private static var _globSearchPattern:RegExp = /\*/g;
      
      private var _getItemAtHandler:Function;
      
      private var _store:Dictionary = new Dictionary();
      
      private var _filterString:String = "";
      
      private var _sortFields:Object = ["id"];
      
      private var _sortFieldsProperties:Object = null;
      
      private var _filterPropertyName:String;
      
      private var _filterPattern:RegExp;
      
      public function ClansDataProvider()
      {
         super();
      }
      
      private static function prepareSearchPattern(_arg_1:String) : RegExp
      {
         _arg_1 = _arg_1.replace(_escapePattern,"\\$&").replace(_globSearchPattern,".*");
         _arg_1 = "^" + _arg_1;
         return new RegExp(_arg_1,"i");
      }
      
      public function addClan(_arg_1:String, _arg_2:String, _arg_3:Boolean = true) : Object
      {
         var _local_4:Object = {};
         _local_4.id = _arg_1;
         _local_4.type = _arg_2;
         _local_4.name = this.getClanName(_arg_1);
         _local_4.isNew = ClanUserNotificationsManager.clanInIncomingNotifications(_arg_1);
         this._store[_arg_1] = _local_4;
         super.addItem(this._store[_arg_1]);
         if(_arg_3)
         {
            this.refresh();
         }
         return this._store[_arg_1];
      }
      
      private function getClanName(_arg_1:String) : String
      {
         return _arg_1;
      }
      
      public function get getItemAtHandler() : Function
      {
         return this._getItemAtHandler;
      }
      
      public function set getItemAtHandler(_arg_1:Function) : void
      {
         this._getItemAtHandler = _arg_1;
      }
      
      override public function getItemAt(_arg_1:uint) : Object
      {
         var _local_2:Object = super.getItemAt(_arg_1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_local_2);
         }
         return _local_2;
      }
      
      public function removeClan(_arg_1:String) : void
      {
         if(_arg_1 in this._store)
         {
            super.removeItem(this._store[_arg_1]);
            delete this._store[_arg_1];
         }
      }
      
      public function resetFilter(_arg_1:Boolean = true) : void
      {
         var _local_2:Object = null;
         this._filterString = "";
         if(!_arg_1)
         {
            return;
         }
         super.removeAll();
         for each(_local_2 in this._store)
         {
            super.addItem(_local_2);
         }
         this.reSort();
      }
      
      override public function sortOn(_arg_1:Object, _arg_2:Object = null) : *
      {
         this._sortFields = _arg_1;
         this._sortFieldsProperties = _arg_2;
         super.sortOn(this._sortFields,this._sortFieldsProperties);
      }
      
      public function reSort() : void
      {
         super.sortOn(this._sortFields,this._sortFieldsProperties);
      }
      
      public function filter() : void
      {
         var _local_1:Object = null;
         if(this._filterString != "")
         {
            super.removeAll();
            for each(_local_1 in this._store)
            {
               if(this.isFilteredItem(_local_1))
               {
                  super.addItem(_local_1);
               }
            }
         }
         this.reSort();
      }
      
      public function setFilter(_arg_1:String, _arg_2:String) : void
      {
         if(_arg_2 == "" && this._filterString != "")
         {
            this.resetFilter();
            return;
         }
         this._filterPropertyName = _arg_1;
         this._filterString = _arg_2;
         this._filterPattern = prepareSearchPattern(this._filterString);
         this.filter();
      }
      
      private function isFilteredItem(_arg_1:Object) : Boolean
      {
         return _arg_1.hasOwnProperty(this._filterPropertyName) && _arg_1[this._filterPropertyName].search(this._filterPattern) != -1;
      }
      
      public function refresh() : void
      {
         this.filter();
      }
   }
}

