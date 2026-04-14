package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import assets.Diamond;
   import assets.icons.IconGarageMod;
   import controls.Money;
   import controls.TankWindow;
   import controls.TankWindowInner;
   import controls.base.DefaultButtonBase;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class ConfirmAlert extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const windowMargin:int = 11;
      
      private const spaceModule:int = 7;
      
      private const previewSize:Point = new Point(164,106);
      
      private const buttonSize:Point = new Point(104,33);
      
      private var window:TankWindow;
      
      private var upgradeIndicator:IconGarageMod;
      
      private var preview:Bitmap;
      
      private var previewInner:TankWindowInner;
      
      private var questionLabel:LabelBase;
      
      private var costLabel:LabelBase;
      
      private var nameLabel:LabelBase;
      
      private var crystalIcon:Diamond;
      
      public var confirmButton:DefaultButtonBase;
      
      public var cancelButton:DefaultButtonBase;
      
      private var windowWidth:int;
      
      private var windowHeight:int;
      
      public function ConfirmAlert(_arg_1:String, _arg_2:int, _arg_3:BitmapData, _arg_4:Boolean, _arg_5:int, _arg_6:String, _arg_7:int = -1)
      {
         super();
         this.windowWidth = Math.max(this.buttonSize.x * 2 + this.windowMargin * 2 + this.spaceModule,this.previewSize.x + this.windowMargin * 4);
         this.window = new TankWindow(this.windowWidth,0);
         addChild(this.window);
         this.previewInner = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.previewInner.x = this.windowMargin;
         this.previewInner.y = this.windowMargin;
         this.previewInner.width = this.windowWidth - this.windowMargin * 2;
         this.previewInner.height = this.previewSize.y + this.windowMargin * 2;
         addChild(this.previewInner);
         this.preview = new Bitmap(_arg_3);
         addChild(this.preview);
         this.preview.x = this.previewInner.x + int((this.windowWidth - this.windowMargin * 2 - this.previewSize.x) * 0.5);
         this.preview.y = this.windowMargin * 2;
         if(_arg_5 != -1)
         {
            this.upgradeIndicator = new IconGarageMod();
            addChild(this.upgradeIndicator);
            this.upgradeIndicator.x = this.windowWidth - this.windowMargin - this.spaceModule - this.upgradeIndicator.width + 2;
            this.upgradeIndicator.y = this.windowMargin + this.spaceModule - 1;
            this.upgradeIndicator.mod = _arg_5;
         }
         this.questionLabel = new LabelBase();
         addChild(this.questionLabel);
         this.questionLabel.text = _arg_6;
         this.questionLabel.x = this.windowWidth - this.questionLabel.width >> 1;
         this.questionLabel.width = this.windowWidth - this.windowMargin * 2;
         this.questionLabel.y = this.previewInner.y + this.previewSize.y + this.windowMargin * 2 + this.spaceModule;
         this.nameLabel = new LabelBase();
         addChild(this.nameLabel);
         if(_arg_5 > 0)
         {
            this.nameLabel.text = "\"" + _arg_1 + "\" " + localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         else
         {
            this.nameLabel.text = "\"" + _arg_1 + "\" " + (_arg_7 > 1 ? "(" + _arg_7 + ") " : "") + localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_COST_PREFIX);
         }
         this.crystalIcon = new Diamond();
         addChild(this.crystalIcon);
         this.costLabel = new LabelBase();
         addChild(this.costLabel);
         this.costLabel.text = Money.numToString(_arg_2,false);
         var _local_8:int = this.nameLabel.width + this.costLabel.width + this.crystalIcon.width + 2;
         var _local_9:* = this.windowWidth - _local_8 >> 1;
         this.nameLabel.x = _local_9;
         this.nameLabel.y = this.questionLabel.y + this.questionLabel.height + this.windowMargin;
         this.crystalIcon.x = this.nameLabel.x + this.nameLabel.width + 2;
         this.crystalIcon.y = this.nameLabel.y + 5;
         this.costLabel.x = this.crystalIcon.x + this.crystalIcon.width;
         this.costLabel.y = this.nameLabel.y;
         this.windowHeight = this.nameLabel.y + this.nameLabel.height + this.windowMargin * 2 + this.buttonSize.y;
         this.cancelButton = new DefaultButtonBase();
         addChild(this.cancelButton);
         this.cancelButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CANCEL_BUTTON_TEXT);
         this.cancelButton.x = this.windowWidth - this.buttonSize.x - 3;
         this.cancelButton.y = this.windowHeight - this.windowMargin - this.buttonSize.y + 2;
         this.confirmButton = new DefaultButtonBase();
         addChild(this.confirmButton);
         this.confirmButton.label = localeService.getText(TanksLocale.TEXT_GARAGE_CONFIRM_ALERT_CONFIRM_BUTTON_TEXT);
         this.confirmButton.x = this.windowMargin;
         this.confirmButton.y = this.windowHeight - this.windowMargin - this.buttonSize.y + 2;
         this.window.height = this.windowHeight;
      }
   }
}

