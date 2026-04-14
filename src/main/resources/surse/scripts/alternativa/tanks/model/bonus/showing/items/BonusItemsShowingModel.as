package alternativa.tanks.model.bonus.showing.items
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.CongratulationsWindowWithBanner;
   import alternativa.tanks.gui.RepatriateBonusWindow;
   import alternativa.tanks.model.bonus.showing.detach.BonusDetach;
   import alternativa.tanks.model.bonus.showing.info.BonusInfo;
   import alternativa.tanks.service.dialogs.IDialogsService;
   import controls.DefaultButton;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.model.IObjectLoadListener;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingCC;
   import projects.tanks.client.panel.model.bonus.showing.items.BonusItemsShowingModelBase;
   import projects.tanks.client.panel.model.bonus.showing.items.IBonusItemsShowingModelBase;
   
   public class BonusItemsShowingModel extends BonusItemsShowingModelBase implements IBonusItemsShowingModelBase, IObjectLoadListener
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var resourceRegistry:ResourceRegistry;
      
      [Inject]
      public static var modelRegister:ModelRegistry;
      
      [Inject]
      public static var dialogsService:IDialogsService;
      
      private var bonusWindow:Sprite;
      
      public function BonusItemsShowingModel()
      {
         super();
      }
      
      public function objectLoaded() : void
      {
         var _local_1:IGameObject = null;
         var _local_2:BonusInfo = null;
         var _local_3:DefaultButton = null;
         var _local_4:BonusItemsShowingCC = getInitParam();
         var _local_5:Vector.<BonusItemCC> = new Vector.<BonusItemCC>();
         for each(_local_1 in _local_4.bonuses)
         {
            _local_5.push(BonusItem(_local_1.adapt(BonusItem)).getItem());
         }
         _local_2 = BonusInfo(object.adapt(BonusInfo));
         if(_local_2.getImage() == null)
         {
            this.bonusWindow = new CongratulationsWindowWithBanner(_local_2.getTopText(),_local_5);
            _local_3 = CongratulationsWindowWithBanner(this.bonusWindow).closeButton;
         }
         else
         {
            this.bonusWindow = new RepatriateBonusWindow(_local_2.getImage().data,_local_2.getTopText(),_local_5);
            _local_3 = RepatriateBonusWindow(this.bonusWindow).closeButton;
         }
         _local_3.addEventListener(MouseEvent.CLICK,this.closeBonusWindow);
         _local_3.addEventListener(MouseEvent.CLICK,new BonusDetach(object).detach);
         this.alignBonusWindow();
         display.stage.addEventListener(Event.RESIZE,this.alignBonusWindow);
         this.addDialog(this.bonusWindow);
      }
      
      public function objectUnloaded() : void
      {
         this.closeBonusWindow();
      }
      
      private function alignBonusWindow(_arg_1:Event = null) : void
      {
         var _local_2:Stage = display.stage;
         this.bonusWindow.x = Math.round((_local_2.stageWidth - this.bonusWindow.width) * 0.5);
         this.bonusWindow.y = Math.round((_local_2.stageHeight - this.bonusWindow.height) * 0.5);
      }
      
      private function closeBonusWindow(_arg_1:MouseEvent = null) : void
      {
         if(this.bonusWindow != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.alignBonusWindow);
            this.removeDialog(this.bonusWindow);
            this.bonusWindow = null;
         }
      }
      
      private function addDialog(_arg_1:DisplayObject) : void
      {
         dialogsService.dizeza(_arg_1);
      }
      
      private function removeDialog(_arg_1:DisplayObject) : void
      {
         dialogsService.removeDialog(_arg_1);
      }
      
      public function objectLoadedPost() : void
      {
      }
      
      public function objectUnloadedPost() : void
      {
      }
   }
}

