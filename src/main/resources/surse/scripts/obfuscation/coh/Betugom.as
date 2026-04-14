package obfuscation.coh
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.effects.BlinkEffect;
   import controls.TankWindowInner;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import obfuscation.qenomy.Gipafili;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Betugom extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private static const leftProgressResource:Class = Dotugymi;
      
      private static const centerProgressResource:Class = Qemetata;
      
      private static const dugirubak:int = 570;
      
      public static const HEIGHT:int = 50;
      
      private static const cycazam:int = 7;
      
      private static const SPACE:int = 5;
      
      private static const vykev:int = 5;
      
      private static const qyma:int = 44;
      
      private var leftProgressPart:Bitmap = new Bitmap(new leftProgressResource().bitmapData);
      
      private var centerProgressPart:Bitmap = new Bitmap(new centerProgressResource().bitmapData);
      
      private var kaz:TankWindowInner;
      
      private var rur:Bitmap = new Bitmap();
      
      private var hym:Bitmap = new Bitmap();
      
      private var woqal:MouseDisabledLabel = new MouseDisabledLabel();
      
      private var currentQuestStreak:int;
      
      private var povurates:Boolean;
      
      private var questImage:Bitmap = new Bitmap();
      
      private var rewardImage:Bitmap = new Bitmap();
      
      private var blinkEffect:BlinkEffect = new BlinkEffect(0.3,0.6);
      
      private var govobodis:int;
      
      public function Betugom()
      {
         super();
      }
      
      public function init(_arg_1:Gipafili) : void
      {
         this.currentQuestStreak = _arg_1.currentQuestStreak;
         this.povurates = _arg_1.doneForToday;
         this.qemuku(_arg_1);
      }
      
      private function qemuku(_arg_1:Gipafili) : void
      {
         this.questImage.bitmapData = _arg_1.questImage.data;
         this.questImage.x = 0;
         this.questImage.y = SPACE + 4;
         addChild(this.questImage);
         this.rewardImage.bitmapData = _arg_1.rewardImage.data;
         this.rewardImage.x = this.govobodis - SPACE;
         this.rewardImage.y = 2 * SPACE + 4;
         addChild(this.rewardImage);
      }
      
      public function redraw(_arg_1:int) : void
      {
         this.govobodis = _arg_1 - 2 * qyma - 2 * vykev;
         this.zerame();
      }
      
      public function fosefopen(_arg_1:int) : void
      {
         if(!this.povurates)
         {
            ++this.currentQuestStreak;
            this.povurates = true;
         }
         this.redraw(_arg_1);
      }
      
      private function zerame() : void
      {
         this.julumuw();
         this.cunusyreb();
         this.rosapaf();
         this.lasol();
      }
      
      private function lasol() : void
      {
         this.woqal.visible = this.govobodis > dugirubak;
      }
      
      private function julumuw() : void
      {
         this.rewardImage.x = this.govobodis + qyma + 2 * vykev;
      }
      
      private function cunusyreb() : void
      {
         if(this.kaz == null)
         {
            this.kaz = new TankWindowInner(this.govobodis,HEIGHT,TankWindowInner.GREEN);
            this.kaz.x = qyma + vykev;
            this.kaz.y = SPACE;
            addChild(this.kaz);
            this.rur.x = qyma + vykev + 1;
            this.rur.y = SPACE + 1;
            this.rur.blendMode = BlendMode.OVERLAY;
            addChild(this.rur);
            this.hym.y = SPACE + 1;
            this.hym.blendMode = BlendMode.OVERLAY;
            addChild(this.hym);
            this.woqal.x = qyma + vykev + SPACE;
            this.woqal.y = 4 * SPACE;
            this.woqal.text = localeService.getText(TanksLocale.TEXT_WEEKLY_QUEST_HINT);
            addChild(this.woqal);
         }
         this.kaz.width = this.govobodis;
      }
      
      private function rosapaf() : void
      {
         var _local_1:Shape = null;
         var _local_2:Graphics = null;
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:Shape = null;
         var _local_6:Graphics = null;
         this.blinkEffect.stop();
         var _local_7:Number = this.govobodis * 1 / cycazam;
         var _local_8:int = _local_7 * this.currentQuestStreak;
         if(this.currentQuestStreak != 0)
         {
            this.rur.bitmapData = new BitmapData(_local_8,this.leftProgressPart.height,true,0);
            this.rur.bitmapData.draw(this.leftProgressPart);
            if(_local_8 > this.leftProgressPart.width)
            {
               this.centerProgressPart.width = Math.min(_local_8 - this.leftProgressPart.width,this.govobodis - this.leftProgressPart.width * 2) - 2;
               _local_1 = new Shape();
               _local_2 = _local_1.graphics;
               _local_2.beginBitmapFill(this.centerProgressPart.bitmapData);
               _local_2.drawRect(this.leftProgressPart.width,0,this.centerProgressPart.width,this.centerProgressPart.height);
               _local_2.endFill();
               this.rur.bitmapData.draw(_local_1);
            }
            if(this.currentQuestStreak == cycazam)
            {
               this.rur.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.govobodis - 2,0));
            }
         }
         if(!this.povurates)
         {
            _local_3 = _local_7;
            _local_4 = 0;
            this.hym.bitmapData = new BitmapData(this.govobodis - _local_8,this.leftProgressPart.height,true,0);
            if(this.currentQuestStreak == 0)
            {
               this.hym.bitmapData.draw(this.leftProgressPart);
               _local_3 = _local_7 - this.leftProgressPart.width;
               _local_4 = this.leftProgressPart.width;
            }
            if(this.currentQuestStreak == 6)
            {
               this.hym.bitmapData.draw(this.leftProgressPart,new Matrix(-1,0,0,1,this.govobodis - _local_8,0));
               _local_3 = this.govobodis - _local_8 - this.leftProgressPart.width;
            }
            this.centerProgressPart.width = _local_3;
            _local_5 = new Shape();
            _local_6 = _local_5.graphics;
            _local_6.beginBitmapFill(this.centerProgressPart.bitmapData);
            _local_6.drawRect(_local_4,0,this.centerProgressPart.width,this.centerProgressPart.height);
            _local_6.endFill();
            this.hym.bitmapData.draw(_local_5);
            this.hym.x = this.rur.x + this.rur.width - (this.currentQuestStreak == 0 ? 0 : 2);
            this.blinkEffect.start(this.hym);
         }
         else
         {
            this.hym.visible = false;
         }
      }
   }
}

