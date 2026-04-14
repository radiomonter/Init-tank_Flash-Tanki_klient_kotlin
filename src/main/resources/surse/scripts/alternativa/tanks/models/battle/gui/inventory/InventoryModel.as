package alternativa.tanks.models.battle.gui.inventory
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.InventorySlotReadyToUseEvent;
   import alternativa.tanks.battle.events.Qeluzajy;
   import alternativa.tanks.battle.events.Rujina;
   import alternativa.tanks.battle.events.Vibu;
   import alternativa.tanks.battle.events.Vovakopy;
   import alternativa.tanks.models.inventory.InventoryItemType;
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputLockEvent;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.utils.Rahyvol;
   import controls.InventoryIcon;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.gopepelaw.Dipyfeg;
   import obfuscation.gopepelaw.Zivunet;
   import obfuscation.kukuragi.Mor;
   import obfuscation.kukuragi.Qady;
   import obfuscation.modo.Bibeza;
   import obfuscation.modo.Gazib;
   
   public class InventoryModel extends Mor implements Qady, IObjectLoadListener, Zivunet, Bibeza, BattleEventListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var bafat:BattleInputService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var battleGuiService:BattleGUIService;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const PANEL_OFFSET_Y:int = 50;
      
      private var container:DisplayObjectContainer;
      
      private var inventorySlots:Vector.<InventoryPanelSlot>;
      
      private var widozej:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      private var cucevan:Rahyvol;
      
      private var inventoryItemModel:Dipyfeg;
      
      private var jituqa:int;
      
      public function InventoryModel()
      {
         super();
         _interfaces.push(IModel,Qady,IObjectLoadListener,Zivunet,Bibeza);
         this.cucevan = new Rahyvol();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Qeluzajy,this.piw);
         this.dejysa.jikina(Vibu,this.jaz);
         this.dejysa.jikina(Vovakopy,this.byzac);
         this.dejysa.jikina(Rujina,this.qoc);
         this.dejysa.jikina(InventorySlotReadyToUseEvent,this.onInventorySlotReadyToUseEvent);
      }
      
      public function qoc(_arg_1:Rujina) : void
      {
         var _local_2:InventoryPanelSlot = null;
         var _local_3:InventoryItem = null;
         if(_arg_1.isLocal)
         {
            for each(_local_2 in this.inventorySlots)
            {
               _local_3 = _local_2.getItem();
               if(_local_3 != null)
               {
                  _local_3.rucez();
               }
            }
         }
      }
      
      public function jaz(_arg_1:Object) : void
      {
         this.hewiven(Gazib.hehu,true);
      }
      
      private function byzac(_arg_1:Vovakopy) : void
      {
         var _local_2:InventoryPanelSlot = null;
         var _local_3:InventoryItem = null;
         this.hewiven(Gazib.hehu,true);
         for each(_local_2 in this.inventorySlots)
         {
            _local_3 = _local_2.getItem();
            if(_local_3 != null)
            {
               _local_3.rucez();
            }
         }
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:IModelService = IModelService(OSGi.getInstance().getService(IModelService));
         this.inventoryItemModel = Dipyfeg(_local_2.getModelsByInterface(Dipyfeg)[0]);
         this.container = new Sprite();
         this.container.visible = false;
         battleGuiService.tadadoqa();
         battleGuiService.fez().addChild(this.container);
         this.dejysa.bijoja();
         this.tequgasib();
         this.lygapuwas();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize(null);
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:int = 0;
         if(this.inventorySlots == null)
         {
            return;
         }
         while(_local_2 < this.inventorySlots.length)
         {
            this.him(_local_2);
            _local_2++;
         }
         this.inventorySlots = null;
         battleGuiService.fez().removeChild(this.container);
         this.container = null;
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.dejysa.ciqon();
         bafat.removeEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         bafat.removeEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
      }
      
      public function hisug(_arg_1:InventoryItem, _arg_2:int) : void
      {
         if(this.qoqyviguc() == 0)
         {
            display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
         var _local_3:InventoryPanelSlot = this.inventorySlots[_arg_2];
         _local_3.setItem(_arg_1);
         this.updateSlotCounter(_local_3);
         if(_arg_1.count > 0)
         {
            this.container.visible = true;
         }
      }
      
      public function itemUpdateCount(_arg_1:InventoryItem) : void
      {
         var _local_2:InventoryPanelSlot = null;
         if(_arg_1.count > 0 && !this.container.visible)
         {
            this.container.visible = true;
         }
         for each(_local_2 in this.inventorySlots)
         {
            if(_local_2.getItem() == _arg_1)
            {
               this.updateSlotCounter(_local_2);
            }
         }
      }
      
      private function updateSlotCounter(_arg_1:InventoryPanelSlot) : void
      {
         var _local_2:Boolean = false;
         _arg_1.sohetu();
         if(_arg_1.getSlotNumber() == InventoryItemType.GOLD)
         {
            _local_2 = _arg_1.getInventoryCount() > 0;
            if(_arg_1.sudywa().visible == _local_2)
            {
               return;
            }
            _arg_1.sudywa().visible = _local_2;
            this.onResize(null);
         }
      }
      
      public function initItemSlot(_arg_1:InventoryItem) : void
      {
      }
      
      public function hidige(_arg_1:InventoryItem) : void
      {
         var _local_2:InventoryPanelSlot = null;
         for each(_local_2 in this.inventorySlots)
         {
            if(_local_2.getItem() == _arg_1)
            {
               this.updateSlotCounter(_local_2);
            }
         }
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function guvanuhi(_arg_1:InventoryItem) : void
      {
         var _local_2:InventoryPanelSlot = null;
         for each(_local_2 in this.inventorySlots)
         {
            if(_local_2.getItem() == _arg_1)
            {
               this.updateSlotCounter(_local_2);
            }
         }
      }
      
      public function wazetap(_arg_1:int, _arg_2:int, _arg_3:Boolean) : void
      {
         var _local_4:InventoryPanelSlot = null;
         var _local_5:InventoryItem = null;
         for each(_local_4 in this.inventorySlots)
         {
            _local_5 = _local_4.getItem();
            if(_local_5 != null && _local_5.getId() == _arg_1)
            {
               _local_4.weq(_arg_2,_arg_3);
            }
         }
      }
      
      private function wufaj(_arg_1:BattleInputLockEvent) : void
      {
         this.hewiven(Gazib.jyhigoc,true);
      }
      
      private function nusonubi(_arg_1:BattleInputLockEvent) : void
      {
         this.hewiven(Gazib.jyhigoc,false);
      }
      
      private function piw(_arg_1:Object) : void
      {
         var _local_2:InventoryPanelSlot = null;
         var _local_3:InventoryItem = null;
         for each(_local_2 in this.inventorySlots)
         {
            _local_2.weq(Gazib.hehu,false);
            _local_2.felonubi(getTimer());
            _local_2.gajowa(getTimer());
            _local_3 = _local_2.getItem();
            if(_local_3 != null && _local_3.kyduwy() <= 75000)
            {
               _local_3.rucez();
            }
         }
      }
      
      public function changeEffectTime(_arg_1:int, _arg_2:int, _arg_3:Boolean, _arg_4:Boolean) : void
      {
         var _local_5:InventoryPanelSlot = this.inventorySlots[_arg_1];
         if(!this.isSpecialEffect(_arg_1))
         {
            if(_arg_4)
            {
               _local_5.startInfiniteEffect(_arg_3);
            }
            else
            {
               _local_5.changeEffectTime(_arg_2,_arg_3);
            }
         }
      }
      
      private function onInventorySlotReadyToUseEvent(param1:InventorySlotReadyToUseEvent) : void
      {
         var _loc2_:InventoryPanelSlot = this.inventorySlots[param1.slotIndex];
      }
      
      public function setCooldownDuration(_arg_1:int, _arg_2:int) : void
      {
         InventoryPanelSlot(this.inventorySlots[_arg_1]).setCooldownDuration(_arg_2);
      }
      
      public function hewiven(_arg_1:int, _arg_2:Boolean) : void
      {
         var _local_3:InventoryPanelSlot = null;
         for each(_local_3 in this.inventorySlots)
         {
            _local_3.weq(_arg_1,_arg_2);
         }
      }
      
      private function isSpecialEffect(_arg_1:int) : Boolean
      {
         return _arg_1 <= 0;
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.container.x = display.stage.stageWidth / 2 - new InventoryIcon(InventoryIcon.EMPTY).width * 5 / 2 - 33;
         this.container.y = display.stage.stageHeight - PANEL_OFFSET_Y;
      }
      
      public function activateCooldown(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:InventoryPanelSlot = null;
         if(!this.isSpecialEffect(_arg_1))
         {
            _local_3 = this.inventorySlots[_arg_1];
            _local_3.activateCooldown(_arg_2);
         }
      }
      
      public function activateDependedCooldown(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:InventoryPanelSlot = null;
         if(!this.isSpecialEffect(_arg_1))
         {
            _local_3 = this.inventorySlots[_arg_1];
            _local_3.activateDependedCooldown(_arg_2);
         }
      }
      
      private function tequgasib() : void
      {
         var _local_5:InventoryPanelSlot = null;
         var _local_6:DisplayObject = null;
         var _local_4:int = 0;
         var _local_1:int = 6;
         this.inventorySlots = new Vector.<InventoryPanelSlot>(_local_1);
         var _local_2:int = 10 + new InventoryIcon(InventoryIcon.EMPTY).width;
         var _local_3:int = 10;
         while(_local_4 < _local_1)
         {
            _local_5 = new InventoryPanelSlot(_local_4 + 1);
            this.inventorySlots[_local_4] = _local_5;
            _local_6 = _local_5.sudywa();
            _local_6.x = _local_3;
            this.container.addChild(_local_6);
            if(_local_4 + 1 == 6)
            {
               _local_6.visible = false;
            }
            _local_3 += _local_2;
            _local_4++;
         }
         bafat.addEventListener(BattleInputLockEvent.INPUT_LOCKED,this.wufaj);
         bafat.addEventListener(BattleInputLockEvent.INPUT_UNLOCKED,this.nusonubi);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(this.cucevan.gumi(_arg_1.keyCode))
         {
            return;
         }
         var _local_2:GameActionEnum = tytol.jikamybu(_arg_1.keyCode);
         var _local_3:* = this.widozej[_local_2];
         if(_local_3 == null)
         {
            return;
         }
         var _local_4:int = _local_3;
         var _local_5:InventoryPanelSlot = this.inventorySlots[_local_4];
         if(_local_5.isLocked() || _local_5.cooldownIsActivated())
         {
            return;
         }
         var _local_6:InventoryItem = _local_5.getItem();
         if(_local_6 != null)
         {
            this.cucevan.welobiqe(_arg_1.keyCode);
            this.inventoryItemModel.zekoqow(_local_6);
         }
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(this.cucevan.gumi(_arg_1.keyCode))
         {
            this.cucevan.coz(_arg_1.keyCode);
         }
      }
      
      private function qoqyviguc() : int
      {
         var _local_1:int = 0;
         var _local_2:InventoryPanelSlot = null;
         for each(_local_2 in this.inventorySlots)
         {
            if(_local_2.getItem() != null)
            {
               _local_1++;
            }
         }
         return _local_1;
      }
      
      private function him(_arg_1:int) : void
      {
         var _local_2:InventoryPanelSlot = this.inventorySlots[_arg_1];
         _local_2.setItem(null);
         if(this.qoqyviguc() == 0)
         {
            display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
            display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
            display.stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         }
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         var _local_3:InventoryPanelSlot = null;
         var _local_2:int = getTimer();
         for each(_local_3 in this.inventorySlots)
         {
            _local_3.update(_local_2);
         }
      }
      
      private function lygapuwas() : void
      {
         this.widozej[GameActionEnum.USE_FIRS_AID] = 0;
         this.widozej[GameActionEnum.USE_DOUBLE_ARMOR] = 1;
         this.widozej[GameActionEnum.USE_DOUBLE_DAMAGE] = 2;
         this.widozej[GameActionEnum.USE_NITRO] = 3;
         this.widozej[GameActionEnum.USE_MINE] = 4;
         this.widozej[GameActionEnum.DROP_GOLD_BOX] = 5;
      }
   }
}

