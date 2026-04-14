package assets.scroller.color
{
   import assets.scroller.ScrollThumbSkin;
   import assets.scroller.ThumbMiddleGreen;
   import assets.scroller.ThumbTopGreen;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol400")]
   public class ScrollThumbSkinGreen extends ScrollThumbSkin
   {
      
      public function ScrollThumbSkinGreen()
      {
         super();
      }
      
      override public function initSkin() : void
      {
         toppng = new ThumbTopGreen(14,1);
         midpng = new ThumbMiddleGreen(14,1);
      }
   }
}

