package alternativa.tanks.gui.servers
{
   import base.DiscreteSprite;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   
   public class ServerBusynessControl extends DiscreteSprite
   {
      
      private static const leftEmptyClass:Class = ServerBusynessControl_leftEmptyClass;
      
      private static const leftFullClass:Class = ServerBusynessControl_leftFullClass;
      
      private static const centerEmptyClass:Class = ServerBusynessControl_centerEmptyClass;
      
      private static const centerFullClass:Class = ServerBusynessControl_centerFullClass;
      
      private static const redLeftClass:Class = ServerBusynessControl_redLeftClass;
      
      private static const redCenterClass:Class = ServerBusynessControl_redCenterClass;
      
      private static var left:BitmapData = new leftFullClass().bitmapData;
      
      private static var leftEmpty:BitmapData = new leftEmptyClass().bitmapData;
      
      private static var centerEmpty:BitmapData = new centerEmptyClass().bitmapData;
      
      private static var centerFull:BitmapData = new centerFullClass().bitmapData;
      
      private static var redLeft:BitmapData = new redLeftClass().bitmapData;
      
      private static var redCenter:BitmapData = new redCenterClass().bitmapData;
      
      private var busyness:Number;
      
      private var _width:int;
      
      public function ServerBusynessControl()
      {
         super();
         this.width = 20;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      public function setBusyness(_arg_1:Number) : void
      {
         this.busyness = _arg_1;
         this.draw();
      }
      
      private function draw() : void
      {
         var _local_1:int = 0;
         graphics.clear();
         if(this.busyness >= 1)
         {
            this.drawBitmap(redLeft,0);
            this.drawBitmap(redCenter,redLeft.width,this.width - redLeft.width * 2);
            this.drawRightUseLeft(redLeft);
         }
         else
         {
            this.drawBitmap(left,0);
            _local_1 = Math.min(Math.max(int(this.width * this.busyness),left.width),this.width - left.width);
            this.drawBitmap(centerFull,left.width,_local_1 - left.width);
            this.drawBitmap(centerEmpty,_local_1,this.width - left.width - _local_1);
            this.drawRightUseLeft(leftEmpty);
         }
         graphics.endFill();
      }
      
      private function drawBitmap(_arg_1:BitmapData, _arg_2:int, _arg_3:int = -1) : void
      {
         if(_arg_3 == -1)
         {
            _arg_3 = _arg_1.width;
         }
         if(_arg_3 == 0)
         {
            return;
         }
         graphics.beginBitmapFill(_arg_1);
         graphics.drawRect(_arg_2,0,_arg_3,_arg_1.height);
      }
      
      private function drawRightUseLeft(_arg_1:BitmapData) : void
      {
         var _local_2:Matrix = new Matrix(-1,0,0,1,this.width,0);
         graphics.beginBitmapFill(_arg_1,_local_2);
         graphics.drawRect(this.width - _arg_1.width,0,_arg_1.width,_arg_1.height);
      }
   }
}

