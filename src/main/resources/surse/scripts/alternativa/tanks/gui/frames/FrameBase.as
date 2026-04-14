package alternativa.tanks.gui.frames
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   
   public class FrameBase extends Sprite
   {
      
      private var frameLeftTopCorner:Bitmap;
      
      private var frameLeftBottomCorner:Bitmap;
      
      private var frameLeftLine:Bitmap;
      
      private var frameRightTopCorner:Bitmap;
      
      private var frameRightBottomCorner:Bitmap;
      
      private var frameRightLine:Bitmap;
      
      private var frameTopLine:Bitmap;
      
      private var frameBottomLine:Bitmap;
      
      public function FrameBase(_arg_1:int, _arg_2:int, _arg_3:FrameSkin)
      {
         super();
         this.setSkin(_arg_3);
         addChild(this.frameLeftTopCorner);
         addChild(this.frameRightTopCorner);
         this.setWidth(_arg_1);
         this.frameTopLine.x = this.frameLeftTopCorner.x + this.frameLeftTopCorner.width;
         addChild(this.frameTopLine);
         this.frameLeftBottomCorner.x = this.frameLeftTopCorner.x;
         addChild(this.frameLeftBottomCorner);
         this.setHeight(_arg_2);
         addChild(this.frameRightBottomCorner);
         this.frameBottomLine.x = this.frameTopLine.x;
         addChild(this.frameBottomLine);
         this.frameLeftLine.x = this.frameLeftTopCorner.x;
         this.frameLeftLine.y = this.frameLeftTopCorner.height;
         addChild(this.frameLeftLine);
         this.frameRightLine.y = this.frameLeftLine.y;
         addChild(this.frameRightLine);
      }
      
      private function setSkin(_arg_1:FrameSkin) : void
      {
         this.frameLeftTopCorner = new Bitmap(_arg_1.leftTopCorner);
         this.frameLeftBottomCorner = new Bitmap(_arg_1.leftBottomCorner);
         this.frameLeftLine = new Bitmap(_arg_1.frameLinePoint);
         this.frameRightTopCorner = new Bitmap(_arg_1.rightTopCorner);
         this.frameRightBottomCorner = new Bitmap(_arg_1.rightBottomCorner);
         this.frameRightLine = new Bitmap(_arg_1.frameLinePoint);
         this.frameTopLine = new Bitmap(_arg_1.frameLinePoint);
         this.frameBottomLine = new Bitmap(_arg_1.frameLinePoint);
      }
      
      public function setWidth(_arg_1:int) : void
      {
         this.frameRightTopCorner.x = _arg_1 - this.frameRightTopCorner.width;
         this.frameRightBottomCorner.x = this.frameRightTopCorner.x;
         this.frameTopLine.width = this.frameRightTopCorner.x - this.frameTopLine.x;
         this.frameBottomLine.width = this.frameTopLine.width;
         this.frameRightLine.x = this.frameRightTopCorner.x + this.frameRightTopCorner.width - this.frameRightLine.width;
      }
      
      public function setHeight(_arg_1:int) : void
      {
         this.frameLeftBottomCorner.y = _arg_1;
         this.frameRightBottomCorner.y = this.frameLeftBottomCorner.y;
         this.frameLeftLine.height = this.frameLeftBottomCorner.y - this.frameLeftTopCorner.height;
         this.frameRightLine.height = this.frameLeftLine.height;
         this.frameBottomLine.y = this.frameLeftBottomCorner.y + this.frameRightBottomCorner.height - this.frameBottomLine.height;
      }
   }
}

