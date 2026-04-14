package alternativa.tanks.gui.garagelist
{
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import platform.client.fp10.core.resource.types.ImageResource;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class GarageListRenderer extends CellRenderer implements IImageResource
   {
      
      private var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      public function GarageListRenderer()
      {
         super();
         this.buttonMode = true;
         this.useHandCursor = true;
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         this.nicon = _arg_1.iconNormal;
         this.sicon = _arg_1.iconSelected;
      }
      
      override public function set listData(_arg_1:ListData) : void
      {
         this.loadLazyResource();
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
      
      private function loadLazyResource() : void
      {
         var _local_1:ImageResource = _data.preview as ImageResource;
         if(_local_1 != null && !_local_1.isLoaded)
         {
            _local_1.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
      }
      
      override protected function drawBackground() : void
      {
      }
      
      override protected function drawLayout() : void
      {
      }
      
      override protected function drawIcon() : void
      {
         var _local_1:String = null;
         var _local_2:DisplayObject = icon;
         _local_1 = !enabled ? "disabled" : mouseState;
         if(selected)
         {
            _local_1 = "selected" + _local_1.substr(0,1).toUpperCase() + _local_1.substr(1);
         }
         _local_1 += "Icon";
         var _local_3:Object = getStyleValue(_local_1);
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
         if(_local_2 != null && _local_2 != icon && _local_2.parent == this)
         {
            removeChild(_local_2);
         }
      }
   }
}

