package controls.statassets
{
   import controls.resultassets.ResultWindowBase;
   import flash.display.Graphics;
   
   public class StatLineBase extends ResultWindowBase
   {
      
      protected var frameColor:uint = 0;
      
      public function StatLineBase()
      {
         super();
      }
      
      override protected function draw() : void
      {
         var _local_1:Graphics = null;
         super.draw();
         if(this.frameColor != 0)
         {
            _local_1 = this.graphics;
            _local_1.beginFill(this.frameColor);
            _local_1.drawRect(4,0,_width - 8,1);
            _local_1.drawRect(4,_height - 1,_width - 8,1);
            _local_1.drawRect(0,4,1,_height - 8);
            _local_1.drawRect(_width - 1,4,1,_height - 8);
            _local_1.endFill();
         }
      }
   }
}

