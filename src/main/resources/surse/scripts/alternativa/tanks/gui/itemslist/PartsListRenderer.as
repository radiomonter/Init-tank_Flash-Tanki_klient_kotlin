package alternativa.tanks.gui.itemslist
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import fl.controls.listClasses.CellRenderer;
   import fl.controls.listClasses.ListData;
   import flash.display.DisplayObject;
   import platform.client.fp10.core.resource.IResourceLoadingListener;
   import platform.client.fp10.core.resource.Resource;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class PartsListRenderer extends CellRenderer implements IResourceLoadingListener
   {
      
      [Inject]
      public static var clientLog:IClientLog;
      
      private static var defaultStyles:Object = {
         "upSkin":null,
         "downSkin":null,
         "overSkin":null,
         "disabledSkin":null,
         "selectedDisabledSkin":null,
         "selectedUpSkin":null,
         "selectedDownSkin":null,
         "selectedOverSkin":null,
         "textFormat":null,
         "disabledTextFormat":null,
         "embedFonts":null,
         "textPadding":5
      };
      
      private var nicon:DisplayObject;
      
      private var sicon:DisplayObject;
      
      public function PartsListRenderer()
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
         var _local_2:ImageResource = _data.dat.preview as ImageResource;
         if(_local_2 != null)
         {
            if(_local_2.data == null)
            {
               _local_2.loadLazyResource(this);
            }
         }
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
      
      public function onResourceLoadingStart(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingProgress(_arg_1:Resource, _arg_2:int) : void
      {
      }
      
      public function onResourceLoadingComplete(_arg_1:Resource) : void
      {
      }
      
      public function onResourceLoadingError(_arg_1:Resource, _arg_2:String) : void
      {
      }
      
      public function onResourceLoadingFatalError(_arg_1:Resource, _arg_2:String) : void
      {
      }
   }
}

