package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import assets.icons.GarageItemBackground;
   import controls.TankWindow;
   import controls.TankWindowHeader;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.client.panel.model.garage.rankupsupplybonus.RankUpSupplyBonusInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class RankUpSupplyBonusAlert extends DialogWindow
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const BORDER:int = 12;
      
      private const MARGIN:int = 12;
      
      private var closeButton:DefaultButtonBase;
      
      public function RankUpSupplyBonusAlert(_arg_1:RankUpSupplyBonusInfo)
      {
         super();
         this.createAlertWindow(this,_arg_1);
         dialogService.enqueueDialog(this);
      }
      
      public function createAlertWindow(_arg_1:Sprite, _arg_2:RankUpSupplyBonusInfo) : void
      {
         var _local_3:TankWindow = new TankWindow();
         _local_3.headerLang = localeService.getText(TextConst.GUI_LANG);
         _local_3.header = TankWindowHeader.CONGRATULATIONS;
         _arg_1.addChild(_local_3);
         var _local_4:TankWindowInner = this.createInnerFrame(_local_3,_arg_2);
         this.closeButton = this.createCloseButton(_local_3);
         _local_3.width = _local_4.width + this.BORDER * 2;
         _local_3.height = _local_4.height + this.closeButton.height + this.BORDER * 3 - 4;
         this.closeButton.x = (_local_3.width - this.closeButton.width) / 2;
         this.closeButton.y = _local_4.height + this.BORDER * 2 - 6;
      }
      
      private function createInnerFrame(_arg_1:Sprite, _arg_2:RankUpSupplyBonusInfo) : TankWindowInner
      {
         var _local_3:TankWindowInner = null;
         var _local_4:GarageItemBackground = null;
         var _local_5:LabelBase = null;
         _local_3 = new TankWindowInner(0,0,TankWindowInner.GREEN);
         _arg_1.addChild(_local_3);
         _local_3.x = this.BORDER;
         _local_3.y = this.BORDER;
         _local_4 = this.createItemPlate(_local_3);
         _local_5 = this.createDescriptionLabel(_local_3,_arg_2.text,_local_4.width);
         this.placeItemPlate(_local_4,_arg_2,this.MARGIN - 3,_local_5.height + this.MARGIN * 2);
         _local_3.width = _local_4.width + this.MARGIN * 2 - 6;
         _local_3.height = _local_5.height + this.MARGIN * 3 + _local_4.height - 2;
         return _local_3;
      }
      
      private function createItemPlate(_arg_1:Sprite) : GarageItemBackground
      {
         var _local_2:GarageItemBackground = new GarageItemBackground(GarageItemBackground.ENGINE_NORMAL);
         _arg_1.addChild(_local_2);
         return _local_2;
      }
      
      private function createDescriptionLabel(_arg_1:Sprite, _arg_2:String, _arg_3:int) : LabelBase
      {
         var _local_4:LabelBase = new LabelBase();
         _arg_1.addChild(_local_4);
         _local_4.wordWrap = true;
         _local_4.multiline = true;
         _local_4.text = _arg_2;
         _local_4.size = 12;
         _local_4.color = 5898034;
         _local_4.x = this.MARGIN - 2;
         _local_4.y = this.MARGIN;
         _local_4.width = _arg_3;
         return _local_4;
      }
      
      private function placeItemPlate(_arg_1:GarageItemBackground, _arg_2:RankUpSupplyBonusInfo, _arg_3:int, _arg_4:int) : void
      {
         _arg_1.x = _arg_3;
         _arg_1.y = _arg_4;
         this.createPreview(_arg_1,_arg_2.preview);
         this.createCountLabel(_arg_1,_arg_2.count);
      }
      
      private function createPreview(_arg_1:Sprite, _arg_2:ImageResource) : void
      {
         var _local_3:PreviewBonusItem = new PreviewBonusItem(_arg_2,_arg_1.width,_arg_1.height);
         _arg_1.addChild(_local_3);
      }
      
      private function createCountLabel(_arg_1:Sprite, _arg_2:int) : void
      {
         var _local_3:LabelBase = null;
         _local_3 = new LabelBase();
         _arg_1.addChild(_local_3);
         _local_3.size = 16;
         _local_3.color = 5898034;
         _local_3.text = "×" + _arg_2;
         _local_3.x = _arg_1.width - _local_3.width - 15;
         _local_3.y = _arg_1.height - _local_3.height - 10;
      }
      
      private function createCloseButton(_arg_1:Sprite) : DefaultButtonBase
      {
         var _local_2:DefaultButtonBase = new DefaultButtonBase();
         _local_2.label = localeService.getText(TextConst.ALERT_ANSWER_OK);
         _local_2.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         _arg_1.addChild(_local_2);
         return _local_2;
      }
      
      private function closeBonusWindow(_arg_1:MouseEvent = null) : void
      {
         this.destroy();
      }
      
      public function destroy() : void
      {
         this.closeButton.removeEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         dialogService.removeDialog(this);
      }
      
      override protected function cancelKeyPressed() : void
      {
         this.closeBonusWindow();
      }
      
      override protected function confirmationKeyPressed() : void
      {
         this.closeBonusWindow();
      }
   }
}

