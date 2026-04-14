package alternativa.tanks.view.battlelist.forms
{
   import alternativa.tanks.view.battlelist.battleitem.renderer.full.CellRendererFullUp;
   import alternativa.tanks.view.battlelist.battleitem.renderer.full.CellRendererFullUpSelected;
   import alternativa.tanks.view.battlelist.battleitem.renderer.normal.CellNormalSelected;
   import alternativa.tanks.view.battlelist.battleitem.renderer.unavailable.CellUnavailableSelected;
   import controls.cellrenderer.CellNormal;
   import controls.cellrenderer.CellUnavailable;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   
   public class BattleListRenderer extends CellRenderer
   {
      
      private var access:Boolean = true;
      
      private var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      private var isFull:Boolean;
      
      public function BattleListRenderer()
      {
         super();
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         this.access = _arg_1.accessible;
         this.nicon = _arg_1.iconNormal;
         this.sicon = _arg_1.iconSelected;
         this.isFull = _arg_1.isFull;
         this.setupBackgroundStyles();
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         _listData = _arg_1;
         label = _listData.label;
         if(this.nicon != null && this.sicon != null)
         {
            setStyle("icon",this.nicon);
            setStyle("selectedUpIcon",this.sicon);
            setStyle("selectedOverIcon",this.sicon);
            setStyle("selectedDownIcon",this.sicon);
         }
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
         background.width = width - 4;
         background.height = height;
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
      
      private function setupBackgroundStyles() : void
      {
         if(this.access)
         {
            if(this.isFull)
            {
               setStyle("upSkin",CellRendererFullUp);
               setStyle("overSkin",CellRendererFullUp);
               setStyle("downSkin",CellRendererFullUp);
               setStyle("selectedUpSkin",CellRendererFullUpSelected);
               setStyle("selectedOverSkin",CellRendererFullUpSelected);
               setStyle("selectedDownSkin",CellRendererFullUpSelected);
            }
            else
            {
               setStyle("upSkin",CellNormal);
               setStyle("overSkin",CellNormal);
               setStyle("downSkin",CellNormal);
               setStyle("selectedUpSkin",CellNormalSelected);
               setStyle("selectedOverSkin",CellNormalSelected);
               setStyle("selectedDownSkin",CellNormalSelected);
            }
         }
         else
         {
            setStyle("upSkin",CellUnavailable);
            setStyle("overSkin",CellUnavailable);
            setStyle("downSkin",CellUnavailable);
            setStyle("selectedUpSkin",CellUnavailableSelected);
            setStyle("selectedOverSkin",CellUnavailableSelected);
            setStyle("selectedDownSkin",CellUnavailableSelected);
         }
      }
   }
}

