package alternativa.tanks.gui.skins
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.device.list.DeviceBorder;
   import alternativa.tanks.model.item.skins.MountSkin;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.types.Long;
   import base.DiscreteSprite;
   import controls.base.ThreeLineBigButton;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class SkinDescription extends DiscreteSprite implements IImageResource
   {
      
      private static const ICON_SIZE:int = 64;
      
      private static const DESCRIPTION_WIDTH:int = 200;
      
      [Inject]
      public static var itemService:ItemService = ItemService(OSGi.getInstance().getService(ItemService));
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      [Inject]
      public static var garageService:GarageService = GarageService(OSGi.getInstance().getService(GarageService));
      
      private static const defaultDeviceIconClass:Class = SkinDescription_defaultDeviceIconClass;
      
      public static const defaultDeviceIconBitmapData:BitmapData = new defaultDeviceIconClass().bitmapData;
      
      private var icon:Bitmap;
      
      public var buyButton:ThreeLineBigButton;
      
      public var mountButton:ThreeLineBigButton;
      
      private var border:DeviceBorder;
      
      private var iconResource:ImageResource;
      
      private var iconLoadListener:ImageResourceLoadingWrapper;
      
      public var skin:Object;
      
      public var item:IGameObject;
      
      public function SkinDescription(_arg_1:IGameObject, _arg_2:Object)
      {
         var _local_4:MouseDisabledLabel = null;
         this.icon = new Bitmap();
         this.buyButton = new ThreeLineBigButton();
         this.mountButton = new ThreeLineBigButton();
         super();
         this.item = _arg_1;
         this.skin = _arg_2;
         this.icon.x = 30;
         this.icon.y = 20;
         if(_arg_2 == _arg_1)
         {
            this.icon.bitmapData = defaultDeviceIconBitmapData;
         }
         else
         {
            this.iconResource = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,_arg_2.previewResourceId)));
            if(this.iconResource.isLazy && !this.iconResource.isLoaded)
            {
               this.iconLoadListener = new ImageResourceLoadingWrapper(this);
               if(!this.iconResource.isLoading)
               {
                  this.iconResource.loadLazyResource(this.iconLoadListener);
               }
               else
               {
                  this.iconResource.addLazyListener(this.iconLoadListener);
               }
            }
            else
            {
               this.icon.bitmapData = this.iconResource.data;
            }
         }
         addChild(this.icon);
         var _local_3:MouseDisabledLabel = new MouseDisabledLabel();
         _local_3.size = 18;
         _local_3.color = ColorConstants.GREEN_TEXT;
         _local_3.width = DESCRIPTION_WIDTH;
         _local_3.wordWrap = true;
         _local_3.x = this.icon.x + ICON_SIZE + 10;
         _local_3.y = 20;
         _local_3.text = _arg_2 == _arg_1 ? localeService.getText(TanksLocale.TEXT_DEVICES_STANDARD_SETTINGS) : _arg_2.name;
         addChild(_local_3);
         _local_4 = new MouseDisabledLabel();
         _local_4.color = ColorConstants.GREEN_TEXT;
         _local_4.multiline = true;
         _local_4.wordWrap = true;
         _local_4.width = DESCRIPTION_WIDTH;
         _local_4.x = _local_3.x;
         _local_4.y = _local_3.y + _local_3.height + 8;
         _local_4.text = _arg_1 == _arg_2 ? localeService.getText(TanksLocale.TEXT_DEVICES_STANDARD_SETTINGS_DESCRIPTION) : _arg_2.description;
         addChild(_local_4);
         this.border = new DeviceBorder(_local_4.y + _local_4.height + 20,true);
         this.border.x = 10;
         addChild(this.border);
         this.mountButton.x = this.border.x + this.border.width - this.mountButton.width - 20;
         this.mountButton.y = this.border.height - this.mountButton.height >> 1;
         addChild(this.mountButton);
         this.buyButton.setText(localeService.getText(TanksLocale.TEXT_GARAGE_BUY_TEXT));
         this.buyButton.x = this.mountButton.x;
         this.buyButton.y = this.mountButton.y;
         this.mountButton.addEventListener(MouseEvent.CLICK,this.onMount);
      }
      
      private function onBuy(_arg_1:MouseEvent) : void
      {
         var _local_2:IGameObject = this.item.space.getObject(Long.getLong(214,886180036));
         garageService.tolycavu().showItemInCategory(_local_2);
      }
      
      private function onMount(_arg_1:MouseEvent) : void
      {
         MountSkin(this.item.adapt(MountSkin)).mount(this.skin);
         this.update();
         dispatchEvent(new Event(Event.CHANGE));
      }
      
      public function update() : void
      {
         var _local_2:Boolean = MountSkin(this.item.adapt(MountSkin)).getMountedSkin() == this.skin;
         this.buyButton.visible = false;
         this.mountButton.visible = true;
         this.mountButton.enabled = !_local_2;
         this.mountButton.label = localeService.getText(_local_2 ? TanksLocale.TEXT_GARAGE_EQUIPPED_TEXT : TanksLocale.TEXT_GARAGE_INFO_PANEL_BUTTON_EQUIP_TEXT);
      }
      
      public function destroy() : void
      {
         if(this.iconLoadListener != null)
         {
            this.iconResource.removeLazyListener(this.iconLoadListener);
         }
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         this.icon.bitmapData = _arg_1.data;
      }
   }
}

