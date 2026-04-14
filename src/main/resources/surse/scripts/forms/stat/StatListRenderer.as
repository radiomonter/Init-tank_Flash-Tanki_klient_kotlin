package forms.stat
{
   import controls.Money;
   import controls.Rank;
   import controls.base.LabelBase;
   import controls.rangicons.RangIconSmall;
   import controls.statassets.StatLineBackgroundNormal;
   import controls.statassets.StatLineBackgroundSelected;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   
   public class StatListRenderer extends CellRenderer
   {
      
      protected var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      public function StatListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         var _local_2:DisplayObject = new StatLineBackgroundNormal();
         var _local_3:DisplayObject = new StatLineBackgroundSelected();
         this.nicon = this.myIcon(_data);
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_2);
         setStyle("overSkin",_local_2);
         setStyle("selectedUpSkin",_local_3);
         setStyle("selectedOverSkin",_local_3);
         setStyle("selectedDownSkin",_local_3);
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      protected function bg(_arg_1:Boolean) : DisplayObject
      {
         return new Sprite();
      }
      
      protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_3:LabelBase = null;
         var _local_4:RangIconSmall = null;
         var _local_5:LabelBase = null;
         var _local_7:LabelBase = null;
         var _local_8:String = null;
         var _local_9:TextFormat = null;
         var _local_10:int = 0;
         var _local_2:Sprite = null;
         var _local_6:LabelBase = null;
         _local_2 = new Sprite();
         _local_3 = new LabelBase();
         _local_4 = new RangIconSmall(_data.rank);
         _local_5 = new LabelBase();
         _local_6 = new LabelBase();
         _local_3.autoSize = TextFieldAutoSize.NONE;
         _local_3.align = TextFormatAlign.RIGHT;
         _local_3.width = 45;
         _local_3.text = _data.pos < 0 ? " " : _data.pos;
         _local_2.addChild(_local_3);
         if(_data.rank > 0)
         {
            _local_4.y = 3;
            _local_4.x = 53;
            _local_2.addChild(_local_4);
            _local_5.text = Rank.name(int(_data.rank));
            _local_5.x = 63;
            _local_2.addChild(_local_5);
         }
         _local_6.autoSize = TextFieldAutoSize.NONE;
         _local_6.height = 18;
         _local_6.text = _data.callsign;
         _local_6.selectable = true;
         _local_6.x = 178;
         _local_6.width = _width - 520;
         _local_2.addChild(_local_6);
         _local_10 = int(_width - 375);
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 60;
         _local_7.x = _local_10;
         _local_7.text = _data.score > -1 ? Money.numToString(_data.score,false) : " ";
         _local_2.addChild(_local_7);
         _local_10 += 60;
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 70;
         _local_7.x = _local_10;
         _local_7.text = _data.kills > -1 ? Money.numToString(_data.kills,false) : " ";
         _local_2.addChild(_local_7);
         _local_10 += 70;
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 50;
         _local_7.x = _local_10;
         _local_7.text = _data.deaths > -1 ? Money.numToString(_data.deaths,false) : " ";
         _local_2.addChild(_local_7);
         _local_10 += 50;
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 40;
         _local_7.x = _local_10;
         _local_7.text = _data.ratio > -1 ? Money.numToString(_data.ratio) : (_data.ratio == -11 ? " " : "—");
         _local_2.addChild(_local_7);
         _local_10 += 40;
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 65;
         _local_7.x = _local_10;
         _local_7.htmlText = _data.wealth > -1 ? Money.numToString(_data.wealth,false) : " ";
         _local_2.addChild(_local_7);
         _local_10 += 75;
         _local_7 = new LabelBase();
         _local_7.autoSize = TextFieldAutoSize.NONE;
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.width = 69;
         _local_7.x = _local_10;
         _local_7.text = _data.rating > -1 ? Money.numToString(_data.rating) : " ";
         _local_2.addChild(_local_7);
         return _local_2;
      }
      
      override protected function drawBackground() : void
      {
         var _local_1:String = enabled ? mouseState : "disabled";
         if(selected)
         {
            _local_1 = "selected" + _local_1.substr(0,1).toUpperCase() + _local_1.substr(1);
         }
         _local_1 += "Skin";
         var _local_2:DisplayObject = background;
         background = getDisplayObjectInstance(getStyleValue(_local_1));
         addChildAt(background,0);
         if(_local_2 != null && _local_2 != background)
         {
            removeChild(_local_2);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
      }
      
      override protected function drawIcon() : void
      {
         var _local_1:DisplayObject = icon;
         var _local_2:String = enabled ? mouseState : "disabled";
         if(selected)
         {
            _local_2 = "selected" + _local_2.substr(0,1).toUpperCase() + _local_2.substr(1);
         }
         _local_2 += "Icon";
         var _local_3:Object = getStyleValue(_local_2);
         if(_local_3 == null)
         {
            _local_3 = getStyleValue("icon");
         }
         if(_local_3 != null)
         {
            icon = getDisplayObjectInstance(_local_3);
         }
         if(icon != null)
         {
            addChildAt(icon,1);
         }
         if(_local_1 != null && _local_1 != icon && _local_1.parent == this)
         {
            removeChild(_local_1);
         }
      }
   }
}

