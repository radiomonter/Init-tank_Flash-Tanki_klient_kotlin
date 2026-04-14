package alternativa.tanks.display
{
   import flash.display.Sprite;
   import utils.SectorMask;
   
   public class SquareSectorIndicator extends Sprite
   {
      
      private var size:Number;
      
      private var ellipseWidth:Number;
      
      private var sectorMask:SectorMask;
      
      public function SquareSectorIndicator(_arg_1:int, _arg_2:Number, _arg_3:uint, _arg_4:Number)
      {
         super();
         this.size = _arg_1;
         this.ellipseWidth = _arg_2;
         this.drawShape(_arg_3,_arg_4);
         this.sectorMask = new SectorMask(_arg_1);
         addChild(this.sectorMask);
         mask = this.sectorMask;
      }
      
      private function drawShape(_arg_1:uint, _arg_2:Number) : void
      {
         graphics.clear();
         graphics.beginFill(_arg_1,_arg_2);
         graphics.drawRoundRect(0,0,this.size,this.size,this.ellipseWidth);
         graphics.endFill();
      }
      
      public function setProgress(_arg_1:Number) : void
      {
         this.sectorMask.setProgress(1 - _arg_1,1);
      }
      
      public function setColor(_arg_1:uint, _arg_2:Number) : void
      {
         this.drawShape(_arg_1,_arg_2);
      }
   }
}

