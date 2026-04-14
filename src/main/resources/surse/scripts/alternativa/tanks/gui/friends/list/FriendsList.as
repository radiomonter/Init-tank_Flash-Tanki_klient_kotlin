package alternativa.tanks.gui.friends.list
{
   import alternativa.tanks.gui.friends.list.dataprovider.FriendsDataProvider;
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import fl.controls.List;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import forms.ConfigureScroll;
   import projects.tanks.clients.fp10.libraries.tanksservices.model.friends.FriendState;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class FriendsList extends Sprite
   {
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      protected var _dataProvider:FriendsDataProvider;
      
      protected var _list:List;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      protected var _viewed:Dictionary;
      
      public function FriendsList()
      {
         super();
      }
      
      protected function init(_arg_1:Object) : void
      {
         this._viewed = new Dictionary();
         this._list = new List();
         this._list.rowHeight = 20;
         this._list.setStyle("cellRenderer",_arg_1);
         this._list.focusEnabled = true;
         this._list.selectable = false;
         this._dataProvider = new FriendsDataProvider();
         this._list.dataProvider = this._dataProvider;
         addChild(this._list);
         ConfigureScroll.configScrollList(this._list,ScrollArrowDownGreen,ScrollArrowUpGreen,ScrollTrackGreen,ScrollThumbSkinGreen);
      }
      
      protected function isViewed(_arg_1:Object) : Boolean
      {
         return _arg_1 in this._viewed;
      }
      
      protected function setAsViewed(_arg_1:Object) : void
      {
         this._viewed[_arg_1] = true;
      }
      
      protected function fillFriendsList(_arg_1:FriendState) : void
      {
         var _local_2:String = null;
         this._dataProvider.removeAll();
         this._dataProvider.resetFilter(false);
         var _local_3:Vector.<String> = friendInfoService.getFriendsIdByState(_arg_1);
         for each(_local_2 in _local_3)
         {
            this._dataProvider.addUser(_local_2,false);
         }
         this._dataProvider.refresh();
      }
      
      protected function filterByProperty(_arg_1:String, _arg_2:String) : void
      {
         this._dataProvider.setFilter(_arg_1,_arg_2);
         this.resize(this._width,this._height);
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         this._width = _arg_1;
         this._height = _arg_2;
         var _local_3:* = this._list.maxVerticalScrollPosition > 0;
         this._list.width = !_local_3 ? Number(this._width) : Number(this._width + 6);
         this._list.height = this._height;
      }
      
      public function get dataProvider() : FriendsDataProvider
      {
         return this._dataProvider;
      }
      
      public function set dataProvider(_arg_1:FriendsDataProvider) : void
      {
         this._dataProvider = _arg_1;
      }
   }
}

