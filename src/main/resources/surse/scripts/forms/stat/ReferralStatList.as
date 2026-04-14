package forms.stat
{
   import assets.scroller.color.ScrollThumbSkinGreen;
   import assets.scroller.color.ScrollTrackGreen;
   import controls.statassets.ReferalStatLineBackgroundNormal;
   import controls.statassets.ReferalStatLineBackgroundSelected;
   import controls.statassets.ReferralStatHeader;
   import controls.statassets.StatLineBase;
   import controls.statassets.StatLineNormal;
   import controls.statassets.StatLineNormalActive;
   import controls.statassets.StatLineSelected;
   import controls.statassets.StatLineSelectedActive;
   import fl.controls.List;
   import fl.data.DataProvider;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.utils.Timer;
   import forms.events.StatListEvent;
   
   public class ReferralStatList extends Sprite
   {
      
      private var header:ReferralStatHeader = new ReferralStatHeader();
      
      protected var list:List = new List();
      
      protected var dp:DataProvider = new DataProvider();
      
      protected var currentSort:int = 1;
      
      protected var nr:DisplayObject;
      
      protected var sl:DisplayObject;
      
      protected var timer:Timer = null;
      
      protected var _width:int = 100;
      
      private var _height:int = 100;
      
      public function ReferralStatList()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.ConfigUI);
      }
      
      public static function setBackground(_arg_1:int, _arg_2:int, _arg_3:Boolean) : BitmapData
      {
         var _local_5:StatLineBase = null;
         var _local_7:int = 0;
         var _local_4:Sprite = new Sprite();
         var _local_6:Array = [0,_arg_1 - 120,_arg_1 - 1];
         var _local_8:BitmapData = new BitmapData(_arg_1,20,true,0);
         _local_7 = 0;
         while(_local_7 < 2)
         {
            if(_arg_2 == _local_7)
            {
               if(_arg_3)
               {
                  _local_5 = new StatLineSelectedActive();
               }
               else
               {
                  _local_5 = new StatLineNormalActive();
               }
            }
            else if(_arg_3)
            {
               _local_5 = new StatLineSelected();
            }
            else
            {
               _local_5 = new StatLineNormal();
            }
            _local_5.width = _local_6[_local_7 + 1] - _local_6[_local_7] - 2;
            _local_5.height = 18;
            _local_5.x = _local_6[_local_7];
            _local_4.addChild(_local_5);
            _local_7++;
         }
         _local_8.draw(_local_4);
         return _local_8;
      }
      
      protected function ConfigUI(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.ConfigUI);
         this.currentSort = 1;
         this.list.rowHeight = 20;
         this.list.setStyle("cellRenderer",ReferralStatListRenderer);
         this.list.dataProvider = this.dp;
         this.confSkin();
         addChild(this.header);
         addChild(this.list);
         this.list.y = 20;
         this.header.addEventListener(StatListEvent.UPDATE_SORT,this.changeSort);
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = int(_arg_1);
         this.list.height = this._height - 20;
      }
      
      public function clear() : void
      {
         var _local_2:int = 0;
         var _local_1:Object = new Object();
         while(_local_2 < this.dp.length)
         {
            _local_1 = this.dp.getItemAt(_local_2);
            _local_1.sort = this.currentSort;
            this.dp.replaceItemAt(_local_1,_local_2);
            _local_2++;
         }
         this.sort();
      }
      
      public function addReferrals(_arg_1:Array) : void
      {
         var _local_2:Object = null;
         var _local_3:Object = null;
         for each(_local_3 in _arg_1)
         {
            _local_2 = new Object();
            _local_2.rank = _local_3.rank;
            _local_2.callsign = _local_3.callsign;
            _local_2.income = _local_3.income;
            _local_2.sort = this.currentSort;
            this.dp.addItem(_local_2);
         }
         this.sort();
      }
      
      private function sort() : void
      {
         if(this.currentSort == 0)
         {
            this.dp.sortOn("callsign");
         }
         else
         {
            this.dp.sortOn("income",Array.NUMERIC | Array.DESCENDING);
         }
         this.dp.invalidate();
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = int(_arg_1);
         var _local_2:* = this.list.maxVerticalScrollPosition > 0;
         var _local_3:int = Boolean(_local_2) ? int(this._width + 6) : this._width;
         this.list.width = _local_3;
         this.header.width = Boolean(_local_2) ? _local_3 - 15 : _local_3;
         ReferalStatLineBackgroundNormal.bg = new Bitmap(setBackground(Boolean(_local_2) ? int(_local_3 - 15) : _local_3,this.currentSort,false));
         ReferalStatLineBackgroundSelected.bg = new Bitmap(setBackground(Boolean(_local_2) ? int(_local_3 - 15) : _local_3,this.currentSort,true));
         this.dp.invalidate();
      }
      
      protected function changeSort(_arg_1:StatListEvent) : void
      {
         this.currentSort = _arg_1.sortField;
         this.clear();
         this.width = this._width;
      }
      
      protected function confSkin() : void
      {
         this.list.setStyle("downArrowUpSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDownSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowOverSkin",ScrollArrowDownGreen);
         this.list.setStyle("downArrowDisabledSkin",ScrollArrowDownGreen);
         this.list.setStyle("upArrowUpSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDownSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowOverSkin",ScrollArrowUpGreen);
         this.list.setStyle("upArrowDisabledSkin",ScrollArrowUpGreen);
         this.list.setStyle("trackUpSkin",ScrollTrackGreen);
         this.list.setStyle("trackDownSkin",ScrollTrackGreen);
         this.list.setStyle("trackOverSkin",ScrollTrackGreen);
         this.list.setStyle("trackDisabledSkin",ScrollTrackGreen);
         this.list.setStyle("thumbUpSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDownSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbOverSkin",ScrollThumbSkinGreen);
         this.list.setStyle("thumbDisabledSkin",ScrollThumbSkinGreen);
      }
   }
}

