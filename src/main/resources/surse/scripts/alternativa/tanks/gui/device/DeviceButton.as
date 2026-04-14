package alternativa.tanks.gui.device
{
   import alternativa.tanks.gui.shop.components.item.base.ShopButton;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class DeviceButton extends ShopButton
   {
      
      private static const iconAvailableClass:Class = DeviceButton_iconAvailableClass;
      
      protected static const iconAvailableBitmap:BitmapData = new iconAvailableClass().bitmapData;
      
      private static const lockedIconClass:Class = DeviceButton_lockedIconClass;
      
      private static const lockedIcon:BitmapData = new lockedIconClass().bitmapData;
      
      protected var deviceImage:Bitmap;
      
      public function DeviceButton()
      {
         super(new DeviceButtonSkin());
         this.setUnclickable();
      }
      
      public function setUnclickable() : void
      {
         this.setDevicesLockedIcon();
         buttonMode = false;
         super.removeEvents();
      }
      
      public function setClickable() : void
      {
         this.setDevicesAvailableIcon();
         super.init();
      }
      
      public function setDeviceImage(_arg_1:BitmapData) : void
      {
         if(this.deviceImage != null)
         {
            removeChild(this.deviceImage);
         }
         this.deviceImage = new Bitmap(_arg_1);
         this.deviceImage.x = width - this.deviceImage.width >> 1;
         this.deviceImage.y = height - this.deviceImage.height >> 1;
         addChildAt(this.deviceImage,2);
      }
      
      public function setDevicesAvailableIcon() : void
      {
         this.setDeviceImage(iconAvailableBitmap);
      }
      
      public function setDevicesLockedIcon() : void
      {
         this.setDeviceImage(lockedIcon);
      }
      
      public function setSale(_arg_1:Boolean) : void
      {
      }
   }
}

