package alternativa.tanks.gui.clanmanagement
{
   import base.DiscreteSprite;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Shape;
   import flash.display.StageQuality;
   import flash.events.Event;
   import flash.text.TextFormatAlign;
   
   public class ClanBonusItem extends DiscreteSprite
   {
      
      private static const WIDTH:Number = 120;
      
      private static const HEIGHT:Number = 100;
      
      private var image:Bitmap;
      
      private var textLabel:LabelBase;
      
      private var valueLabel:LabelBase;
      
      private var stageQuality:String;
      
      public function ClanBonusItem(_arg_1:Bitmap, _arg_2:String, _arg_3:String)
      {
         super();
         this.image = _arg_1;
         this.textLabel = new LabelBase();
         this.textLabel.align = TextFormatAlign.CENTER;
         this.textLabel.wordWrap = true;
         this.textLabel.multiline = true;
         this.valueLabel = new LabelBase();
         this.valueLabel.size = 16;
         this.valueLabel.bold = true;
         this.image.x = WIDTH - this.image.bitmapData.width >> 1;
         this.image.y = HEIGHT - this.image.bitmapData.height >> 1;
         this.textLabel.text = _arg_2;
         this.textLabel.width = WIDTH;
         this.textLabel.y = 5;
         this.setValue(_arg_3);
         var _local_4:Shape = new Shape();
         _local_4.graphics.beginFill(676609,1);
         _local_4.graphics.lineStyle(0,5177127,1);
         _local_4.graphics.drawRoundRect(0,0,WIDTH,HEIGHT,6,6);
         _local_4.graphics.endFill();
         addChild(_local_4);
         addChild(this.image);
         addChild(this.textLabel);
         addChild(this.valueLabel);
         addEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
      }
      
      private function addedToStage(_arg_1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.addedToStage);
         this.stageQuality = stage.quality;
         stage.quality = StageQuality.MEDIUM;
         addEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStage);
      }
      
      private function removedFromStage(_arg_1:Event) : void
      {
         removeEventListener(Event.REMOVED_FROM_STAGE,this.removedFromStage);
         stage.quality = this.stageQuality;
      }
      
      public function setValue(_arg_1:String) : void
      {
         this.valueLabel.text = _arg_1;
         this.valueLabel.x = WIDTH - this.valueLabel.width >> 1;
         this.valueLabel.y = HEIGHT - 5 - this.valueLabel.height;
      }
   }
}

