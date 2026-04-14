package controls.resultassets
{
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class ResultWindowBase extends Sprite
   {
      
      protected var tl:BitmapData;
      
      protected var px:BitmapData;
      
      protected var _width:int = 10;
      
      protected var _height:int = 10;
      
      public function ResultWindowBase()
      {
         super();
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.draw();
      }
      
      override public function get width() : Number
      {
         return this._width;
      }
      
      override public function set height(_arg_1:Number) : void
      {
         this._height = Math.floor(_arg_1);
         this.draw();
      }
      
      override public function get height() : Number
      {
         return this._height;
      }
      
      protected function draw() : void
      {
         var _local_2:Matrix = null;
         var _local_1:Graphics = this.graphics;
         _local_1.clear();
         _local_1.beginBitmapFill(this.tl);
         _local_1.drawRect(0,0,4,4);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI * 0.5);
         _local_2.translate(this._width - 4,0);
         _local_1.beginBitmapFill(this.tl,_local_2);
         _local_1.drawRect(this._width - 4,0,4,4);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI);
         _local_2.translate(this._width - 4,this._height - 4);
         _local_1.beginBitmapFill(this.tl,_local_2);
         _local_1.drawRect(this._width - 4,this._height - 4,4,4);
         _local_1.endFill();
         _local_2 = new Matrix();
         _local_2.rotate(Math.PI * 1.5);
         _local_2.translate(0,this._height - 4);
         _local_1.beginBitmapFill(this.tl,_local_2);
         _local_1.drawRect(0,this._height - 4,4,4);
         _local_1.endFill();
         _local_1.beginBitmapFill(this.px);
         _local_1.drawRect(4,0,this._width - 8,this._height);
         _local_1.drawRect(0,4,4,this._height - 8);
         _local_1.drawRect(this._width - 4,4,4,this._height - 8);
         _local_1.endFill();
      }
   }
}

