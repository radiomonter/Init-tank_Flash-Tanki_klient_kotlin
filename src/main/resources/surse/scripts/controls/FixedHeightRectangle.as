package controls
{
   import base.DiscreteSprite;
   import flash.display.Bitmap;
   
   public class FixedHeightRectangle extends DiscreteSprite
   {
      
      private var left:Bitmap;
      
      private var middle:Bitmap;
      
      private var right:Bitmap;
      
      public function FixedHeightRectangle(_arg_1:FixedHeightRectangleSkin)
      {
         super();
         this.left = new Bitmap(_arg_1.left);
         this.middle = new Bitmap(_arg_1.middle);
         this.right = new Bitmap(_arg_1.right);
         this.setSkin(_arg_1);
         addChild(this.left);
         addChild(this.right);
         addChild(this.middle);
         mouseEnabled = false;
      }
      
      public function setSkin(_arg_1:FixedHeightRectangleSkin) : void
      {
         this.left.bitmapData = _arg_1.left;
         this.middle.bitmapData = _arg_1.middle;
         this.right.bitmapData = _arg_1.right;
         this.align(width);
      }
      
      override public function set width(_arg_1:Number) : void
      {
         _arg_1 = int(_arg_1);
         this.align(_arg_1);
         super.width = _arg_1;
      }
      
      private function align(_arg_1:int) : void
      {
         this.middle.x = this.left.width;
         this.right.x = _arg_1 - this.right.width;
         this.middle.width = _arg_1 - this.left.width - this.right.width;
      }
   }
}

