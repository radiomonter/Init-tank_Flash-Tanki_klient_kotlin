package alternativa.tanks.gui.clanmanagement.clanmemberlist.members
{
   import alternativa.tanks.gui.clanmanagement.clanmemberlist.list.ClanMembersDataProvider;
   import alternativa.tanks.models.clan.membersdata.ClanMembersDataService;
   import base.DiscreteSprite;
   import fl.controls.List;
   import flash.events.Event;
   import flash.utils.Dictionary;
   import forms.Styles;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   import utils.ScrollStyleUtils;
   
   public class ClanMembersList extends DiscreteSprite
   {
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var clanMembersData:ClanMembersDataService;
      
      private var dataProvider:ClanMembersDataProvider = new ClanMembersDataProvider();
      
      private var list:List = new List();
      
      protected var viewed:Dictionary = new Dictionary();
      
      private var _width:int;
      
      private var _height:int;
      
      private var header:HeaderClanMemberList = new HeaderClanMemberList();
      
      public function ClanMembersList()
      {
         super();
         addChild(this.header);
         this.list.y = 20;
         this.list.rowHeight = 20;
         this.list.setStyle(Styles.CELL_RENDERER,ClanMembersListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.dataProvider.getItemAtHandler = this.markAsViewed;
         this.list.dataProvider = this.dataProvider;
         addChild(this.list);
         ScrollStyleUtils.setGreenStyle(this.list);
         addEventListener(Event.ADDED_TO_STAGE,this.addResizeListener);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function markAsViewed(_arg_1:Object) : void
      {
         if(!this.isViewed(_arg_1))
         {
            this.setAsViewed(_arg_1);
         }
      }
      
      protected function setAsViewed(_arg_1:Object) : void
      {
         this.viewed[_arg_1] = true;
      }
      
      protected function isViewed(_arg_1:Object) : Boolean
      {
         return _arg_1 in this.viewed;
      }
      
      public function fillData(_arg_1:Vector.<Object>) : void
      {
         var _local_2:Object = null;
         this.dataProvider.removeAll();
         for each(_local_2 in _arg_1)
         {
            this.dataProvider.addItem(_local_2);
         }
         this.update();
      }
      
      private function sort() : void
      {
         this.dataProvider.sortOn(["permissionIndex","date"],[Array.NUMERIC,Array.NUMERIC | Array.DESCENDING]);
      }
      
      public function removeUser(_arg_1:String) : void
      {
         var _local_2:int = this.dataProvider.getItemIndexById(_arg_1);
         if(_local_2 >= 0)
         {
            this.dataProvider.removeItemAt(_local_2);
         }
         this.update();
      }
      
      public function addUser(_arg_1:Object) : void
      {
         this.dataProvider.addItem(_arg_1);
         this.update(_arg_1);
      }
      
      private function update(_arg_1:Object = null) : void
      {
         if(_arg_1 != null)
         {
            this.markAsViewed(_arg_1);
         }
         this.sort();
         this.onResize();
      }
      
      private function addResizeListener(_arg_1:Event) : void
      {
         stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         this.list.height = this._height - 20;
         var _local_2:Boolean = this.list.maxVerticalScrollPosition > 0;
         this.header.width = this._width;
         this.list.width = _local_2 ? this._width + 8 : this._width;
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         var _local_3:Object = null;
         var _local_2:int = 0;
         stage.removeEventListener(Event.RESIZE,this.onResize);
         while(_local_2 < this.dataProvider.length)
         {
            _local_3 = this.dataProvider.getItemAt(_local_2);
            _local_3.isNew = false;
            _local_2++;
         }
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.onResize();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = _arg_1;
         this.onResize();
      }
   }
}

