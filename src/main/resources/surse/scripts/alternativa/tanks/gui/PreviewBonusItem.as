package alternativa.tanks.gui
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import platform.client.fp10.core.resource.types.ImageResource;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class PreviewBonusItem extends Sprite implements IImageResource
   {
      
      private var _imageResource:ImageResource;
      
      private var _preview:Bitmap;
      
      private var _componentWidth:Number;
      
      private var _componentHeight:Number;
      
      public function PreviewBonusItem(_arg_1:ImageResource, _arg_2:Number, _arg_3:Number)
      {
         super();
         this._imageResource = _arg_1;
         this._componentWidth = _arg_2;
         this._componentHeight = _arg_3;
         this.init();
      }
      
      private function init() : void
      {
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,this._componentWidth,this._componentHeight);
         graphics.endFill();
         if(this._imageResource.isLazy && !this._imageResource.isLoaded)
         {
            this._imageResource.loadLazyResource(new ImageResourceLoadingWrapper(this));
         }
         else
         {
            this.setPreview(this._imageResource.data);
         }
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         if(this._imageResource.id == _arg_1.id)
         {
            this.setPreview(this._imageResource.data);
         }
      }
      
      private function setPreview(_arg_1:BitmapData) : void
      {
         if(this._preview != null && this.contains(this._preview))
         {
            removeChild(this._preview);
         }
         this._preview = new Bitmap(_arg_1);
         addChild(this._preview);
         this._preview.x = this._componentWidth - this._preview.width >> 1;
         this._preview.y = this._componentHeight - this._preview.height >> 1;
      }
   }
}

