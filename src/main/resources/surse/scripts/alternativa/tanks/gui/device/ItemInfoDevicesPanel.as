package alternativa.tanks.gui.device
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.shop.components.itemscategory.ItemsCategoryViewGrid;
   import alternativa.tanks.gui.skins.ItemSkinsWindow;
   import alternativa.tanks.loader.ILoaderWindowService;
   import alternativa.tanks.model.item.skins.AvailableSkins;
   import alternativa.tanks.model.item.skins.MountSkin;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.types.Long;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import forms.ColorConstants;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.commons.services.layout.LobbyLayoutService;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.blur.IBlurService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.layout.ILobbyLayoutService;
   import utils.preview.IImageResource;
   import utils.preview.ImageResourceLoadingWrapper;
   
   public class ItemInfoDevicesPanel extends Sprite implements IImageResource
   {
      
      private static const NUMBER_OF_DEVICES:int = 1;
      
      [Inject]
      public static var lobbyLayoutService:LobbyLayoutService = LobbyLayoutService(OSGi.getInstance().getService(ILobbyLayoutService));
      
      [Inject]
      public static var battleInfoService:IBattleInfoService = IBattleInfoService(OSGi.getInstance().getService(IBattleInfoService));
      
      [Inject]
      public static var loaderWindowService:ILoaderWindowService = ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService));
      
      [Inject]
      public static var blurService:IBlurService = IBlurService(OSGi.getInstance().getService(IBlurService));
      
      [Inject]
      public static var itemService:ItemService = ItemService(OSGi.getInstance().getService(ItemService));
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      private var deviceButtons:Vector.<DeviceButton>;
      
      private var imageResources:Vector.<ImageResource>;
      
      private var loadListeners:Vector.<ImageResourceLoadingWrapper>;
      
      private var targetItem:IGameObject;
      
      private var gradeToShow:int;
      
      private var panel:ItemsCategoryViewGrid;
      
      private var skinsWindow:ItemSkinsWindow = null;
      
      public function ItemInfoDevicesPanel()
      {
         var _local_3:DeviceButton = null;
         var _local_1:LabelBase = null;
         var _local_2:int = 0;
         this.deviceButtons = new Vector.<DeviceButton>(NUMBER_OF_DEVICES,true);
         this.imageResources = new Vector.<ImageResource>(NUMBER_OF_DEVICES,true);
         this.loadListeners = new Vector.<ImageResourceLoadingWrapper>(NUMBER_OF_DEVICES,true);
         this.panel = new ItemsCategoryViewGrid();
         super();
         _local_1 = new LabelBase();
         _local_1.text = localeService.getText(TanksLocale.TEXT_DEVICES);
         _local_1.size = 18;
         _local_1.color = ColorConstants.GREEN_TEXT;
         _local_1.x = -3;
         addChild(_local_1);
         this.panel.y = _local_1.y + _local_1.height + 4;
         this.panel.columnCount = NUMBER_OF_DEVICES;
         this.panel.horizontalSpacing = 8;
         while(_local_2 < this.deviceButtons.length)
         {
            _local_3 = new DeviceButton();
            this.deviceButtons[_local_2] = _local_3;
            this.panel.addItem(_local_3);
            _local_2++;
         }
         addChild(this.panel);
         this.panel.render();
      }
      
      public function init(_arg_1:IGameObject) : void
      {
         this.removeListeners();
         this.targetItem = _arg_1;
         this.updateButtons();
      }
      
      private function updateButtons() : void
      {
         var _local_1:int = 0;
         var _local_2:int = 0;
         _local_1 = 0;
         while(_local_1 < this.deviceButtons.length)
         {
            this.updateGradeButton(_local_1);
            this.deviceButtons[_local_1].visible = true;
            _local_1++;
         }
      }
      
      private function updateGradeButton(_arg_1:int) : void
      {
         var _local_2:DeviceButton = null;
         this.removeLazyListener(_arg_1);
         if(_arg_1 == 0)
         {
            _local_2 = this.deviceButtons[0];
            if(AvailableSkins(this.targetItem.adapt(AvailableSkins)).getSkins().length > 0)
            {
               _local_2.setClickable();
               _local_2.addEventListener(MouseEvent.CLICK,this.onDeviceButtonClick);
               this.setDeviceButtonImage(0);
            }
         }
         this.setDeviceButtonImage(_arg_1);
      }
      
      private function setDeviceButtonImage(_arg_1:int) : void
      {
         var _local_2:ImageResource = null;
         var _local_3:Object = null;
         if(_arg_1 == 0)
         {
            _local_3 = MountSkin(this.targetItem.adapt(MountSkin)).getMountedSkin();
            _local_2 = ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,_local_3.previewResourceId)));
         }
         if(_local_2.isLazy && !_local_2.isLoaded)
         {
            this.imageResources[_arg_1] = _local_2;
            this.loadListeners[_arg_1] = new ImageResourceLoadingWrapper(this);
            if(!_local_2.isLoading)
            {
               _local_2.loadLazyResource(this.loadListeners[_arg_1]);
            }
            else
            {
               _local_2.addLazyListener(this.loadListeners[_arg_1]);
            }
         }
         else
         {
            this.deviceButtons[_arg_1].setDeviceImage(_local_2.data);
         }
      }
      
      private function onDeviceButtonClick(event:MouseEvent) : void
      {
         var grade:int = this.deviceButtons.indexOf(event.target);
         if(grade == 0)
         {
            this.skinsWindow = new ItemSkinsWindow(this.targetItem,function():void
            {
               skinsWindow.removeEventListener(Event.CHANGE,onDeviceChanged);
               skinsWindow = null;
            });
            this.skinsWindow.addEventListener(Event.CHANGE,this.onDeviceChanged);
            return;
         }
      }
      
      public function destroy() : void
      {
         this.removeListeners();
         this.deviceButtons = null;
         this.imageResources = null;
         this.loadListeners = null;
         this.targetItem = null;
         if(this.skinsWindow != null)
         {
            this.skinsWindow.close();
         }
      }
      
      private function removeListeners() : void
      {
         var _local_1:DeviceButton = null;
         for each(_local_1 in this.deviceButtons)
         {
            _local_1.removeEventListener(MouseEvent.CLICK,this.onDeviceButtonClick);
         }
         this.removeLazyListeners();
      }
      
      private function removeLazyListeners() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.deviceButtons.length)
         {
            this.removeLazyListener(_local_1);
            _local_1++;
         }
      }
      
      private function removeLazyListener(_arg_1:int) : void
      {
         if(this.imageResources[_arg_1] != null && this.loadListeners[_arg_1] != null)
         {
            this.imageResources[_arg_1].removeLazyListener(this.loadListeners[_arg_1]);
         }
      }
      
      private function onDeviceChanged(_arg_1:Event) : void
      {
         this.updateButtons();
      }
      
      public function setPreviewResource(_arg_1:ImageResource) : void
      {
         var _local_2:int = this.imageResources.indexOf(_arg_1);
         this.deviceButtons[_local_2].setDeviceImage(_arg_1.data);
      }
   }
}

