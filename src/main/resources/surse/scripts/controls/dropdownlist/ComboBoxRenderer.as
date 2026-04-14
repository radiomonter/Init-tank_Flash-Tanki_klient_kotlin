package controls.dropdownlist
{
   import assets.combo.ComboListOverState;
   import controls.base.LabelBase;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class ComboBoxRenderer extends CellRenderer
   {
      
      private var nicon:DisplayObject;
      
      private var normalStyle:Bitmap;
      
      private var overStyle:ComboListOverState = new ComboListOverState();
      
      public function ComboBoxRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         this.normalStyle = new Bitmap(new BitmapData(1,1,true,0));
         _data = _arg_1;
         setStyle("upSkin",this.normalStyle);
         setStyle("downSkin",this.overStyle);
         setStyle("overSkin",this.overStyle);
         setStyle("selectedUpSkin",this.normalStyle);
         setStyle("selectedOverSkin",this.overStyle);
         setStyle("selectedDownSkin",this.overStyle);
      }
      
      protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_2:Sprite = null;
         var _local_3:LabelBase = null;
         _local_2 = null;
         _local_3 = null;
         _local_2 = new Sprite();
         _local_3 = new LabelBase();
         _local_3.autoSize = TextFieldAutoSize.NONE;
         _local_3.color = 16777215;
         _local_3.alpha = 1;
         _local_3.text = _arg_1.gameName;
         _local_3.height = 20;
         _local_3.width = _width - 20;
         _local_3.x = -3;
         _local_3.y = 0;
         _local_2.addChild(_local_3);
         return _local_2;
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = "";
         this.nicon = this.myIcon(_data);
         if(this.nicon != null)
         {
            setStyle("icon",this.nicon);
         }
      }
      
      override protected function drawLayout() : void
      {
         super.drawLayout();
         background.width = width - 6;
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

