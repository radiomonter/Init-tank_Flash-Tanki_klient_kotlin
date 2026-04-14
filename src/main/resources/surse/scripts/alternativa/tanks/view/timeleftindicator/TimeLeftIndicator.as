package alternativa.tanks.view.timeleftindicator
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import utils.graphics.SectorMask;
   
   public class TimeLeftIndicator extends Sprite
   {
      
      protected var imageFull:Bitmap;
      
      protected var sectorMask:SectorMask;
      
      private var container:Sprite = new Sprite();
      
      public function TimeLeftIndicator()
      {
         super();
         addChild(this.container);
         this.sectorMask = new SectorMask(this.imageFull.width);
         this.container.addChild(this.sectorMask);
         this.paintEmpty();
      }
      
      public function setPercentLeft(_arg_1:Number) : void
      {
         _arg_1 = Math.max(0,Math.min(1,_arg_1));
         _arg_1 = this.getNormalized(_arg_1);
         if(_arg_1 == 0)
         {
            this.paintEmpty();
         }
         else
         {
            this.sectorMask.setProgress(1 - _arg_1,1);
            this.paintNotEmpty();
         }
      }
      
      private function getNormalized(_arg_1:Number) : Number
      {
         var _local_2:Number = 0;
         while(_arg_1 > 0)
         {
            _local_2 += 0.125;
            _arg_1 -= 0.125;
         }
         return _local_2;
      }
      
      private function paintEmpty() : void
      {
         this.container.visible = false;
      }
      
      private function paintNotEmpty() : void
      {
         this.container.visible = true;
         if(this.imageFull.parent == null)
         {
            this.container.addChild(this.imageFull);
         }
         this.container.mask = this.sectorMask;
      }
      
      override public function get width() : Number
      {
         return this.imageFull.width;
      }
   }
}

