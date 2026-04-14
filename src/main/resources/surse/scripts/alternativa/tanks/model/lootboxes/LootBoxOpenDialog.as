package alternativa.tanks.model.lootboxes
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.loader.ILoaderWindowService;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.ColorTransform;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.getTimer;
   import platform.client.fp10.core.resource.BatchResourceLoader;
   import platform.client.fp10.core.resource.Resource;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxModelCC;
   import projects.tanks.client.garage.models.item.lootbox.LootBoxReward;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.dialogs.gui.DialogWindow;
   
   public class LootBoxOpenDialog extends DialogWindow
   {
      
      [Inject]
      public static var loaderService:ILoaderWindowService = ILoaderWindowService(OSGi.getInstance().getService(ILoaderWindowService));
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      private static const BgOneClosed:Class = LootBoxOpenDialog_BgOneClosed;
      
      private static const bgOneClosed:BitmapData = new BgOneClosed().bitmapData;
      
      private static const BgThreeClosed:Class = LootBoxOpenDialog_BgThreeClosed;
      
      private static const bgThreeClosed:BitmapData = new BgThreeClosed().bitmapData;
      
      private static const BgFiveClosed:Class = LootBoxOpenDialog_BgFiveClosed;
      
      private static const bgFiveClosed:BitmapData = new BgFiveClosed().bitmapData;
      
      private static const BgOneOpen:Class = LootBoxOpenDialog_BgOneOpen;
      
      private static const bgOneOpen:BitmapData = new BgOneOpen().bitmapData;
      
      private static const BgThreeOpen:Class = LootBoxOpenDialog_BgThreeOpen;
      
      private static const bgThreeOpen:BitmapData = new BgThreeOpen().bitmapData;
      
      private static const BgFiveOpen:Class = LootBoxOpenDialog_BgFiveOpen;
      
      private static const bgFiveOpen:BitmapData = new BgFiveOpen().bitmapData;
      
      private static const BgOneLight:Class = LootBoxOpenDialog_BgOneLight;
      
      private static const bgOneLight:BitmapData = new BgOneLight().bitmapData;
      
      private static const BgThreeLight:Class = LootBoxOpenDialog_BgThreeLight;
      
      private static const bgThreeLight:BitmapData = new BgThreeLight().bitmapData;
      
      private static const BgFiveLight:Class = LootBoxOpenDialog_BgFiveLight;
      
      private static const bgFiveLight:BitmapData = new BgFiveLight().bitmapData;
      
      private static const Shine:Class = LootBoxOpenDialog_Shine;
      
      private static const shine:BitmapData = new Shine().bitmapData;
      
      private static const Mote:Class = LootBoxOpenDialog_Mote;
      
      private static const mote:BitmapData = new Mote().bitmapData;
      
      private static const Star:Class = LootBoxOpenDialog_Star;
      
      private static const star:BitmapData = new Star().bitmapData;
      
      private static const Blick:Class = LootBoxOpenDialog_Blick;
      
      private static const blick:BitmapData = new Blick().bitmapData;
      
      private static const STATE_SELECT:int = 0;
      
      private static const STATE_OPEN:int = 1;
      
      private static const STATE_DELAY:int = 2;
      
      private static const STATE_PRESENT:int = 3;
      
      private static const STATE_SWITCH:int = 4;
      
      private static const STATE_COMPLETE:int = 5;
      
      private static const STATE_MULTIPLIER:int = 6;
      
      private static const STATE_LIGHT_UP:int = 7;
      
      private static const OPEN_TIME:Number = 35 / 60;
      
      private static const LIGHT_UP_TIME:Number = 35 / 60;
      
      private static const PRESENT_MIDDLE_TIME:Number = 15 / 60;
      
      private static const PRESENT_APEAR_TIME:Number = 20 / 60;
      
      private static const PRESENT_TIME:Number = PRESENT_APEAR_TIME + 40 / 60;
      
      private static const PRESENT_DISAPEAR_TIME:Number = PRESENT_TIME + 10 / 60;
      
      private static const SWITCH_TIME:Number = 30 / 60;
      
      private static const MULTIPLIER_MIDDLE_TIME:Number = 10 / 60;
      
      private static const MULTIPLIER_APEAR_TIME:Number = 15 / 60;
      
      private static const MULTIPLIER_TIME:Number = MULTIPLIER_APEAR_TIME + 40 / 60;
      
      private static const MULTIPLIER_DISAPEAR_TIME:Number = MULTIPLIER_TIME + 5 / 60;
      
      private static const WINDOW_WIDTH:int = 625;
      
      private static const WINDOW_HEIGHT:int = 591;
      
      private static const BUTTON_PANEL_HEIGHT:int = 54;
      
      private static const MARGIN:int = 11;
      
      private var boxesCount:int = 0;
      
      private var closeButton:DefaultButtonBase = new DefaultButtonBase();
      
      private var openButtonsPanel:Sprite = new Sprite();
      
      private var params:LootBoxModelCC;
      
      private var window:TankWindow = new TankWindow(WINDOW_WIDTH,WINDOW_HEIGHT);
      
      private var inner:TankWindowInner;
      
      private var rewards:Vector.<LootBoxReward> = new Vector.<LootBoxReward>();
      
      private var presents:Array = [];
      
      private var index:int = 0;
      
      private var color:ColorTransform = new ColorTransform();
      
      private var bgClosed:Sprite = new Sprite();
      
      private var bgOpen:Sprite = new Sprite();
      
      private var bgLight:Sprite = new Sprite();
      
      private var shine1:Sprite = new Sprite();
      
      private var shine2:Sprite = new Sprite();
      
      private var dust:Dust = new Dust(mote,16,WINDOW_WIDTH - 100,WINDOW_HEIGHT - 40);
      
      private var stars:Stars = new Stars(star,blick,16,WINDOW_WIDTH / 2 - 80);
      
      private var present:Sprite = new Sprite();
      
      private var label:LabelBase = new LabelBase();
      
      private var multiplier:LabelBase = new LabelBase();
      
      private var timer:int = 0;
      
      private var state:int = 0;
      
      public function LootBoxOpenDialog(_arg_1:LootBoxModelCC, _arg_2:int)
      {
         super();
         this.params = _arg_1;
         this.boxesCount = _arg_2;
         addChild(this.window);
         this.onBoxResourcesLoaded();
      }
      
      public function openLoots(rewards:Vector.<LootBoxReward>) : void
      {
         var resources:Vector.<Resource>;
         var reward:LootBoxReward = null;
         this.rewards = rewards.concat();
         resources = new Vector.<Resource>();
         for each(reward in rewards)
         {
            if(!reward.image.isLoaded && resources.indexOf(reward.image) < 0)
            {
               resources.push(reward.image);
            }
         }
         if(resources.length > 0)
         {
            new BatchResourceLoader(function():void
            {
               startOpeningBox();
            }).load(resources);
         }
         else
         {
            this.startOpeningBox();
         }
      }
      
      public function select(_arg_1:int) : void
      {
         if(_arg_1 == 0)
         {
            this.bgClosed.getChildAt(0).visible = true;
            this.bgClosed.getChildAt(1).visible = false;
            this.bgClosed.getChildAt(2).visible = false;
            this.bgOpen.getChildAt(0).visible = true;
            this.bgOpen.getChildAt(1).visible = false;
            this.bgOpen.getChildAt(2).visible = false;
            this.bgLight.getChildAt(0).visible = true;
            this.bgLight.getChildAt(1).visible = false;
            this.bgLight.getChildAt(2).visible = false;
         }
         else if(_arg_1 == 1)
         {
            this.bgClosed.getChildAt(0).visible = false;
            this.bgClosed.getChildAt(1).visible = true;
            this.bgClosed.getChildAt(2).visible = false;
            this.bgOpen.getChildAt(0).visible = false;
            this.bgOpen.getChildAt(1).visible = true;
            this.bgOpen.getChildAt(2).visible = false;
            this.bgLight.getChildAt(0).visible = false;
            this.bgLight.getChildAt(1).visible = true;
            this.bgLight.getChildAt(2).visible = false;
         }
         else if(_arg_1 == 2)
         {
            this.bgClosed.getChildAt(0).visible = false;
            this.bgClosed.getChildAt(1).visible = false;
            this.bgClosed.getChildAt(2).visible = true;
            this.bgOpen.getChildAt(0).visible = false;
            this.bgOpen.getChildAt(1).visible = false;
            this.bgOpen.getChildAt(2).visible = true;
            this.bgLight.getChildAt(0).visible = false;
            this.bgLight.getChildAt(1).visible = false;
            this.bgLight.getChildAt(2).visible = true;
         }
      }
      
      private function startOpeningBox() : void
      {
         var _local_1:LootBoxReward = null;
         var _local_2:Present = null;
         for each(_local_1 in this.rewards)
         {
            _local_2 = new Present(_local_1.image.data,_local_1.name,_local_1.category);
            this.presents.push(_local_2);
         }
         this.colorize((this.presents[0] as Present).color);
         this.state = STATE_OPEN;
         this.inner.addChild(this.bgOpen);
         this.inner.addChild(this.bgLight);
         this.inner.addChild(this.dust);
         this.inner.addChild(this.stars);
         this.inner.addChild(this.present);
         this.timer = getTimer();
         this.dust.alpha = 0;
         this.bgLight.alpha = 0;
         addEventListener(Event.ENTER_FRAME,this.onEnterFrame,false,0,true);
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_9:Present = null;
         var _local_4:Number = (getTimer() - this.timer) / 1000;
         var _local_5:Present = this.presents[this.index];
         var _local_6:Present = this.presents[this.index + 1] as Present;
         var _local_7:int = 1;
         var _local_8:int = this.index - 1;
         while(_local_8 >= 0)
         {
            _local_9 = this.presents[_local_8];
            if(_local_9.bitmap.bitmapData != _local_5.bitmap.bitmapData)
            {
               break;
            }
            _local_7++;
            _local_8--;
         }
         this.multiplier.alpha = _local_7 > 1 && this.state == STATE_COMPLETE ? 1 : 0;
         this.multiplier.text = "x" + _local_7.toString();
         this.multiplier.x = -this.multiplier.width / 2;
         if(this.state == STATE_MULTIPLIER)
         {
            if(_local_4 < MULTIPLIER_MIDDLE_TIME)
            {
               _local_2 = _local_4 / MULTIPLIER_MIDDLE_TIME;
               _local_2 = Math.pow(_local_2,1 / 3);
               _local_3 = 0.35 + (0.65 + 0.1) * _local_2;
               this.multiplier.alpha = _local_2;
               this.multiplier.scaleX = _local_3;
               this.multiplier.scaleY = _local_3;
            }
            else if(_local_4 < MULTIPLIER_APEAR_TIME)
            {
               _local_2 = 1 - (_local_4 - MULTIPLIER_MIDDLE_TIME) / (MULTIPLIER_APEAR_TIME - MULTIPLIER_MIDDLE_TIME);
               _local_3 = 1 + 0.1 * _local_2;
               this.multiplier.alpha = 1;
               this.multiplier.scaleX = _local_3;
               this.multiplier.scaleY = _local_3;
            }
            else if(_local_4 < MULTIPLIER_TIME)
            {
               this.multiplier.alpha = 1;
               this.multiplier.scaleX = 1;
               this.multiplier.scaleY = 1;
            }
            else if(_local_4 < MULTIPLIER_DISAPEAR_TIME)
            {
               if(this.index < this.presents.length - 1)
               {
                  _local_2 = 1 - (_local_4 - MULTIPLIER_TIME) / (MULTIPLIER_DISAPEAR_TIME - MULTIPLIER_TIME);
                  this.multiplier.alpha = _local_2;
               }
               else
               {
                  this.timer = getTimer();
                  this.state = STATE_COMPLETE;
               }
            }
            else
            {
               this.multiplier.alpha = 0;
               if(_local_6 != null && _local_5.bitmap.bitmapData != _local_6.bitmap.bitmapData)
               {
                  this.present.removeChildren();
                  this.state = STATE_SWITCH;
               }
               else if(_local_6 == null)
               {
                  this.state = STATE_COMPLETE;
               }
               else
               {
                  ++this.index;
               }
               this.timer = getTimer();
            }
         }
         else if(this.state == STATE_OPEN)
         {
            _local_2 = _local_4 / OPEN_TIME;
            if(_local_2 < 1)
            {
               this.bgOpen.alpha = _local_2;
            }
            else
            {
               this.bgOpen.alpha = 1;
               this.inner.removeChild(this.bgClosed);
               this.timer = getTimer();
               this.state = STATE_LIGHT_UP;
            }
         }
         else if(this.state == STATE_LIGHT_UP)
         {
            _local_2 = _local_4 / LIGHT_UP_TIME;
            if(_local_2 < 1)
            {
               this.bgLight.alpha = _local_2;
               this.dust.alpha = _local_2;
            }
            else
            {
               this.bgLight.alpha = 1;
               this.dust.alpha = 1;
               this.timer = getTimer();
               this.state = STATE_DELAY;
            }
         }
         else if(this.state == STATE_DELAY)
         {
            if(_local_4 > _local_5.delay)
            {
               this.present.addChild(_local_5.bitmap);
               this.present.addChild(this.label);
               this.present.addChild(this.multiplier);
               this.label.text = _local_5.name;
               this.label.x = -this.label.width / 2;
               _local_5.bitmap.x = -_local_5.bitmap.width / 2;
               _local_5.bitmap.y = -_local_5.bitmap.height / 2;
               this.present.alpha = 0;
               this.timer = getTimer();
               this.state = STATE_PRESENT;
            }
         }
         else if(this.state == STATE_PRESENT)
         {
            if(_local_4 < PRESENT_MIDDLE_TIME)
            {
               _local_2 = _local_4 / PRESENT_MIDDLE_TIME;
               _local_2 = Math.pow(_local_2,1 / 3);
               _local_3 = 0.35 + (0.65 + 0.1) * _local_2;
               this.present.alpha = _local_2;
               this.present.scaleX = _local_3;
               this.present.scaleY = _local_3;
            }
            else if(_local_4 < PRESENT_APEAR_TIME)
            {
               this.inner.addChild(this.shine1);
               this.inner.addChild(this.shine2);
               this.inner.addChild(this.dust);
               this.inner.addChild(this.stars);
               this.inner.addChild(this.present);
               this.dust.alpha = 1;
               this.stars.alpha = 1;
               _local_2 = 1 - (_local_4 - PRESENT_MIDDLE_TIME) / (PRESENT_APEAR_TIME - PRESENT_MIDDLE_TIME);
               _local_3 = 1 + 0.1 * _local_2;
               this.present.alpha = 1;
               this.present.scaleX = _local_3;
               this.present.scaleY = _local_3;
            }
            else if(_local_4 < PRESENT_TIME)
            {
               this.present.alpha = 1;
               this.present.scaleX = 1;
               this.present.scaleY = 1;
            }
            else if(_local_4 < PRESENT_DISAPEAR_TIME)
            {
               if(this.index < this.presents.length - 1)
               {
                  if(_local_5.bitmap.bitmapData != _local_6.bitmap.bitmapData)
                  {
                     _local_2 = 1 - (_local_4 - PRESENT_TIME) / (PRESENT_DISAPEAR_TIME - PRESENT_TIME);
                     this.present.alpha = _local_2;
                  }
               }
               else
               {
                  this.timer = getTimer();
                  this.state = STATE_COMPLETE;
               }
            }
            else
            {
               if(_local_6 != null && _local_6.bitmap.bitmapData == _local_5.bitmap.bitmapData)
               {
                  this.state = STATE_MULTIPLIER;
                  ++this.index;
               }
               else
               {
                  this.state = STATE_SWITCH;
                  this.present.alpha = 0;
                  this.present.removeChild(_local_5.bitmap);
               }
               this.timer = getTimer();
            }
         }
         else if(this.state == STATE_SWITCH)
         {
            if(_local_4 < SWITCH_TIME)
            {
               _local_2 = _local_4 / SWITCH_TIME;
               this.interpolate(_local_5.color,_local_6.color,_local_2);
               this.colorize(this.color);
            }
            else
            {
               this.colorize(_local_6.color);
               ++this.index;
               this.timer = getTimer();
               this.state = STATE_DELAY;
            }
         }
         else if(this.state == STATE_COMPLETE)
         {
            this.window.addChild(this.closeButton);
         }
         this.shine1.rotation += 0.3;
         this.shine2.rotation -= 0.3;
         this.dust.update();
         this.stars.update();
      }
      
      private function onBoxResourcesLoaded() : void
      {
         var _local_8:int = 0;
         var _local_9:OpenBoxButton = null;
         var _local_5:int = 0;
         var _local_6:int = 0;
         var _local_1:int = WINDOW_WIDTH - 2 * MARGIN;
         var _local_2:int = WINDOW_HEIGHT - 2 * MARGIN - BUTTON_PANEL_HEIGHT - 5;
         this.inner = new TankWindowInner(_local_1,_local_2,TankWindowInner.GREEN);
         this.inner.x = MARGIN;
         this.inner.y = MARGIN;
         this.window.addChild(this.inner);
         this.closeButton.label = localeService.getText(TanksLocale.TEXT_CLOSE_LABEL);
         this.closeButton.addEventListener(MouseEvent.CLICK,this.onCloseDialog,false,0,true);
         this.closeButton.x = WINDOW_WIDTH - this.closeButton.width - MARGIN;
         this.closeButton.y = WINDOW_HEIGHT - this.closeButton.height - MARGIN;
         this.openButtonsPanel.y = WINDOW_HEIGHT - 2 * MARGIN - BUTTON_PANEL_HEIGHT + 15;
         this.window.addChild(this.closeButton);
         this.window.addChild(this.openButtonsPanel);
         var _local_3:Array = [1,5,15];
         var _local_4:Array = [localeService.getText(TanksLocale.TEXT_LOOT_1_OPEN_BUTTON),localeService.getText(TanksLocale.TEXT_LOOT_5_OPEN_BUTTON),localeService.getText(TanksLocale.TEXT_LOOT_15_OPEN_BUTTON)];
         while(_local_6 < _local_3.length)
         {
            _local_8 = int(_local_3[_local_6]);
            _local_9 = new OpenBoxButton(_local_4[_local_6],_local_8,_local_6);
            _local_9.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver,false,0,true);
            _local_9.addEventListener(MouseEvent.CLICK,this.onBoxSelected,false,0,true);
            _local_9.x = _local_5;
            this.openButtonsPanel.addChild(_local_9);
            _local_5 += 135;
            _local_9.enabled = _local_8 <= this.boxesCount;
            _local_6++;
         }
         this.openButtonsPanel.x = (WINDOW_WIDTH - _local_5) / 2;
         this.bgClosed.addChild(new Bitmap(bgOneClosed));
         this.bgClosed.addChild(new Bitmap(bgThreeClosed));
         this.bgClosed.addChild(new Bitmap(bgFiveClosed));
         this.inner.addChild(this.bgClosed);
         this.bgOpen.addChild(new Bitmap(bgOneOpen));
         this.bgOpen.addChild(new Bitmap(bgThreeOpen));
         this.bgOpen.addChild(new Bitmap(bgFiveOpen));
         this.bgOpen.alpha = 0;
         this.bgLight.addChild(new Bitmap(bgOneLight));
         this.bgLight.addChild(new Bitmap(bgThreeLight));
         this.bgLight.addChild(new Bitmap(bgFiveLight));
         this.bgLight.blendMode = BlendMode.ADD;
         this.bgLight.alpha = 0;
         this.bgClosed.width = _local_1;
         this.bgClosed.height = _local_2;
         this.bgOpen.width = _local_1;
         this.bgOpen.height = _local_2;
         this.bgLight.width = _local_1;
         this.bgLight.height = _local_2;
         this.shine1.addChild(new Bitmap(shine,PixelSnapping.NEVER,true));
         this.shine1.getChildAt(0).x = -this.shine1.getChildAt(0).width / 2;
         this.shine1.getChildAt(0).y = -this.shine1.getChildAt(0).height / 2;
         this.shine1.x = WINDOW_WIDTH / 2;
         this.shine1.y = WINDOW_HEIGHT / 2;
         this.shine1.width = 410;
         this.shine1.height = 410;
         this.shine1.blendMode = BlendMode.ADD;
         this.shine2.addChild(new Bitmap(shine,PixelSnapping.NEVER,true));
         this.shine2.getChildAt(0).x = -this.shine1.getChildAt(0).width / 2;
         this.shine2.getChildAt(0).y = -this.shine1.getChildAt(0).height / 2;
         this.shine2.x = WINDOW_WIDTH / 2;
         this.shine2.y = WINDOW_HEIGHT / 2;
         this.shine2.width = 410;
         this.shine2.height = 410;
         this.shine2.blendMode = BlendMode.ADD;
         this.dust.x = 50;
         this.dust.y = 20;
         this.dust.alpha = 0;
         this.stars.x = WINDOW_WIDTH / 2;
         this.stars.y = WINDOW_HEIGHT / 2;
         this.stars.alpha = 0;
         this.present.x = WINDOW_WIDTH / 2;
         this.present.y = WINDOW_HEIGHT / 2;
         this.present.alpha = 0;
         var _local_7:TextFormat = new TextFormat();
         _local_7.align = "center";
         this.label.autoSize = TextFieldAutoSize.CENTER;
         this.label.defaultTextFormat = _local_7;
         this.label.size = 40;
         this.label.x = -(_local_1 - 100) / 2;
         this.label.y = WINDOW_HEIGHT / 6;
         this.multiplier.autoSize = TextFieldAutoSize.CENTER;
         this.multiplier.defaultTextFormat = _local_7;
         this.multiplier.size = 40;
         this.multiplier.y = WINDOW_HEIGHT / 6 + 40;
         this.multiplier.alpha = 0;
         this.select(0);
      }
      
      private function interpolate(_arg_1:ColorTransform, _arg_2:ColorTransform, _arg_3:Number) : void
      {
         this.color.redMultiplier = _arg_1.redMultiplier + (_arg_2.redMultiplier - _arg_1.redMultiplier) * _arg_3;
         this.color.greenMultiplier = _arg_1.greenMultiplier + (_arg_2.greenMultiplier - _arg_1.greenMultiplier) * _arg_3;
         this.color.blueMultiplier = _arg_1.blueMultiplier + (_arg_2.blueMultiplier - _arg_1.blueMultiplier) * _arg_3;
      }
      
      private function colorize(_arg_1:ColorTransform) : void
      {
         this.bgLight.transform.colorTransform = _arg_1;
         this.shine1.transform.colorTransform = _arg_1;
         this.shine2.transform.colorTransform = _arg_1;
         this.dust.transform.colorTransform = _arg_1;
         this.stars.colorize(_arg_1);
      }
      
      private function onRollOver(_arg_1:MouseEvent) : void
      {
         var _local_2:OpenBoxButton = _arg_1.target as OpenBoxButton;
         this.select(_local_2.mode);
      }
      
      private function onBoxSelected(_arg_1:MouseEvent) : void
      {
         var _local_2:OpenBoxButton = _arg_1.target as OpenBoxButton;
         this.window.removeChild(this.openButtonsPanel);
         this.window.removeChild(this.closeButton);
         this.boxesCount -= _local_2.count;
         dispatchEvent(new LootBoxEvent(_local_2.count));
      }
      
      private function close() : void
      {
         dialogService.removeDialog(this);
      }
      
      private function onCloseDialog(_arg_1:MouseEvent) : void
      {
         this.close();
      }
      
      override protected function cancelKeyPressed() : void
      {
         if(this.window.contains(this.closeButton))
         {
            this.close();
         }
      }
      
      override protected function confirmationKeyPressed() : void
      {
         if(this.window.contains(this.closeButton))
         {
            this.close();
         }
      }
   }
}

