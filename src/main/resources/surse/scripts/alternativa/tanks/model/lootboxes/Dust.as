package alternativa.tanks.model.lootboxes
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   
   public class Dust extends Sprite
   {
      
      private var motes:Array;
      
      private var count:int;
      
      private var bottom:Number;
      
      public function Dust(_arg_1:BitmapData, _arg_2:int, _arg_3:Number, _arg_4:Number)
      {
         var _local_7:Bitmap = null;
         var _local_8:Number = NaN;
         var _local_6:int = 0;
         this.motes = new Array();
         super();
         this.count = _arg_2;
         this.bottom = _arg_4;
         var _local_5:Number = _arg_3 / _arg_2;
         while(_local_6 < _arg_2)
         {
            _local_7 = new Bitmap(_arg_1,PixelSnapping.NEVER,true);
            _local_7.x = _local_6 * _local_5;
            _local_7.y = Math.random() * _arg_3;
            _local_8 = 0.2 + Math.random();
            _local_7.scaleX = _local_8;
            _local_7.scaleY = _local_8;
            _local_7.blendMode = BlendMode.ADD;
            addChild(_local_7);
            this.motes.push(_local_7);
            _local_6++;
         }
      }
      
      public function update() : void
      {
         var _local_4:Bitmap = null;
         var _local_3:int = 0;
         var _local_1:Number = this.bottom / 3;
         var _local_2:Number = _local_1 + _local_1;
         while(_local_3 < this.count)
         {
            _local_4 = this.motes[_local_3];
            _local_4.y += 2;
            if(_local_4.y > this.bottom)
            {
               _local_4.y = 0;
            }
            if(_local_4.y < _local_1)
            {
               _local_4.alpha = _local_4.y / _local_1;
            }
            else if(_local_4.y < _local_2)
            {
               _local_4.alpha = 1;
            }
            else
            {
               _local_4.alpha = 1 - (_local_4.y - _local_2) / _local_1;
            }
            _local_3++;
         }
      }
   }
}

