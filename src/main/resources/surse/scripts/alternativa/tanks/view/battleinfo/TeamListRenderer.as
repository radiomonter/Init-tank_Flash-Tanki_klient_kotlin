package alternativa.tanks.view.battleinfo
{
   import assets.cellrenderer.battlelist.CellBlue;
   import assets.cellrenderer.battlelist.CellNormalUp;
   import assets.cellrenderer.battlelist.CellRed;
   import controls.ButtonState;
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import fonts.TanksFontService;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   
   public class TeamListRenderer extends CellRenderer
   {
      
      private var format:TextFormat = TanksFontService.getTextFormat(13);
      
      private var nicon:DisplayObject;
      
      private var greenStyle:ButtonState = new CellNormalUp();
      
      private var redStyle:ButtonState = new CellRed();
      
      private var BlueStyle:ButtonState = new CellBlue();
      
      public function TeamListRenderer()
      {
         super();
         this.format.color = 16777215;
         setStyle("textFormat",this.format);
         setStyle("embedFonts",TanksFontService.isEmbedFonts());
      }
      
      override public function set data(_arg_1:Object) : void
      {
         var _local_2:ButtonState = null;
         _data = _arg_1;
         this.mouseChildren = true;
         this.buttonMode = this.useHandCursor = false;
         this.nicon = this.myIcon(_data);
         switch(_data.style)
         {
            case "green":
               _local_2 = this.greenStyle;
               break;
            case "red":
               _local_2 = this.redStyle;
               break;
            case "blue":
               _local_2 = this.BlueStyle;
         }
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_2);
         setStyle("overSkin",_local_2);
         setStyle("selectedUpSkin",_local_2);
         setStyle("selectedOverSkin",_local_2);
         setStyle("selectedDownSkin",_local_2);
      }
      
      private function myIcon(_arg_1:Object) : Sprite
      {
         var _local_5:Sprite = null;
         var _local_2:UserLabel = null;
         var _local_3:LabelBase = null;
         var _local_4:LabelBase = null;
         if(_width < 0)
         {
            _width = 20;
         }
         _local_5 = new Sprite();
         if(_arg_1.id != null)
         {
            _local_2 = new UserLabel(_arg_1.id);
            if(Boolean(_arg_1.suspicious))
            {
               _local_2.setUidColor(ColorConstants.SUSPICIOUS,true);
            }
            else
            {
               _local_2.setUidColor(ColorConstants.WHITE);
            }
            _local_2.x = -4;
            _local_2.y = 0;
            _local_5.addChild(_local_2);
            _local_3 = new LabelBase();
            _local_3.mouseEnabled = false;
            _local_3.color = 16777215;
            _local_3.autoSize = TextFieldAutoSize.NONE;
            _local_3.align = TextFormatAlign.RIGHT;
            _local_3.text = _arg_1.kills;
            _local_3.height = 20;
            _local_3.width = 120;
            _local_3.x = _width - 135;
            _local_3.y = 0;
            _local_5.addChild(_local_3);
         }
         else
         {
            _local_4 = new LabelBase();
            _local_4.text = _arg_1.noNameText;
            _local_4.alpha = 0.5;
            _local_4.x = 10;
            _local_5.addChild(_local_4);
         }
         return _local_5;
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = "";
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 4;
         background.height = height;
      }
      
      override protected function drawIcon() : void
      {
         var _local_1:DisplayObject = icon;
         var _local_2:String = !enabled ? "disabled" : mouseState;
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

