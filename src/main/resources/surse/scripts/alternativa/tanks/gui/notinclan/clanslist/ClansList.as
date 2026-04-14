package alternativa.tanks.gui.notinclan.clanslist
{
   import alternativa.tanks.models.service.ClanUserNotificationsManager;
   import alternativa.tanks.models.user.ClanUserService;
   import fl.controls.List;
   import flash.display.Sprite;
   import flash.utils.Dictionary;
   import forms.Styles;
   import utils.ScrollStyleUtils;
   
   public class ClansList extends Sprite
   {
      
      [Inject]
      public static var clanUserService:ClanUserService;
      
      protected var dataProvider:ClansDataProvider;
      
      protected var list:List;
      
      protected var viewed:Dictionary;
      
      protected var _width:Number;
      
      protected var _height:Number;
      
      private var header:ClansListHeader;
      
      public function ClansList()
      {
         super();
         this.viewed = new Dictionary();
         this.header = new ClansListHeader();
         addChild(this.header);
         this.list = new List();
         this.list.y = 20;
         this.list.rowHeight = 20;
         this.list.setStyle(Styles.CELL_RENDERER,ClansListRenderer);
         this.list.focusEnabled = true;
         this.list.selectable = false;
         ScrollStyleUtils.setGreenStyle(this.list);
         this.dataProvider = new ClansDataProvider();
         this.dataProvider.getItemAtHandler = this.markAsViewed;
         this.dataProvider.sortOn(["isNew","name"],[Array.NUMERIC | Array.DESCENDING,Array.CASEINSENSITIVE]);
         this.list.dataProvider = this.dataProvider;
         addChild(this.list);
         ScrollStyleUtils.setGreenStyle(this.list);
      }
      
      private function markAsViewed(_arg_1:Object) : void
      {
         if(!this.isViewed(_arg_1))
         {
            if(_arg_1.type == ClanListType.INCOMING)
            {
               ClanUserNotificationsManager.removeIncomingNotification(_arg_1.id);
            }
            this.setAsViewed(_arg_1);
         }
      }
      
      public function removeAllViewed() : void
      {
         var _local_1:Object = null;
         for(_local_1 in this.viewed)
         {
            ClanUserNotificationsManager.removeIncomingNotification(_local_1.id);
         }
      }
      
      public function addClan(_arg_1:String, _arg_2:String) : void
      {
         this.dataProvider.addClan(_arg_1,_arg_2);
         this.resize(this._width,this._height);
      }
      
      public function removeClan(_arg_1:String) : void
      {
         this.dataProvider.removeClan(_arg_1);
         this.dataProvider.refresh();
         this.resize(this._width,this._height);
      }
      
      protected function isViewed(_arg_1:Object) : Boolean
      {
         return _arg_1 in this.viewed;
      }
      
      protected function setAsViewed(_arg_1:Object) : void
      {
         this.viewed[_arg_1] = true;
      }
      
      public function refresh() : void
      {
         this.dataProvider.refresh();
      }
      
      public function fillClansList(_arg_1:Vector.<String>, _arg_2:String) : void
      {
         var _local_3:String = null;
         this.dataProvider.removeAll();
         this.dataProvider.resetFilter(false);
         for each(_local_3 in _arg_1)
         {
            this.dataProvider.addClan(_local_3,_arg_2,false);
         }
         this.dataProvider.refresh();
         this.resize(this._width,this._height);
      }
      
      public function filterByProperty(_arg_1:String, _arg_2:String) : void
      {
         this.dataProvider.setFilter(_arg_1,_arg_2);
         this.resize(this._width,this._height);
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         this._width = _arg_1;
         this._height = _arg_2;
         this.header.width = _arg_1;
         this.list.height = this._height - 20;
         var _local_3:Boolean = this.list.verticalScrollBar.visible;
         this.list.width = _local_3 ? this._width + 6 : this._width;
      }
   }
}

