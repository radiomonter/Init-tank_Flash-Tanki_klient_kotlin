package alternativa.tanks.model.lootboxes
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   
   public class Stars extends Sprite
   {
      
      private var stars:Array;
      
      private var count:int;
      
      private var radius:Number;
      
      public function Stars(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int, _arg_4:Number)
      {
         var _local_6:Sprite = null;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_5:int = 0;
         this.stars = new Array();
         super();
         this.count = _arg_3;
         this.radius = _arg_4;
         while(_local_5 < _arg_3)
         {
            _local_6 = new Sprite();
            _local_6.addChild(new Bitmap(_arg_1,PixelSnapping.NEVER,true));
            _local_6.addChild(new Bitmap(_arg_2,PixelSnapping.NEVER,true));
            _local_7 = 0.4 + Math.random();
            _local_6.getChildAt(0).scaleX = _local_7;
            _local_6.getChildAt(0).scaleY = _local_7;
            _local_6.getChildAt(0).x = -_local_6.getChildAt(0).width / 2;
            _local_6.getChildAt(0).y = -_local_6.getChildAt(0).height / 2;
            _local_6.getChildAt(0).blendMode = BlendMode.ADD;
            _local_6.getChildAt(1).scaleX = _local_7;
            _local_6.getChildAt(1).scaleY = _local_7;
            _local_6.getChildAt(1).x = -_local_6.getChildAt(1).width / 2;
            _local_6.getChildAt(1).y = -_local_6.getChildAt(1).height / 2;
            addChild(_local_6);
            this.stars.push(_local_6);
            _local_8 = Math.random() * Math.PI * 2;
            _local_9 = _arg_4 / 3 + Math.random() * _arg_4 * 2 / 3;
            _local_6.x = Math.cos(_local_8) * _local_9;
            _local_6.y = Math.sin(_local_8) * _local_9;
            if(_local_5 == 0)
            {
               _local_6.x = 0;
               _local_6.y = 0;
            }
            _local_6.rotation = Math.random() * 180;
            _local_5++;
         }
      }
      
      public function update() : void
      {
         var _local_1:Number = NaN;
         var _local_2:Number = NaN;
         var _local_4:Sprite = null;
         var _local_3:int = 0;
         while(_local_3 < this.count)
         {
            _local_4 = this.stars[_local_3];
            _local_4.rotation += 2;
            if(_local_4.rotation > 180)
            {
               _local_4.rotation = 0;
            }
            if(_local_4.rotation < 90)
            {
               _local_1 = _local_4.rotation / 90;
            }
            else
            {
               _local_1 = 1 - (_local_4.rotation - 90) / 90;
            }
            _local_2 = 0.2 + 0.8 * _local_1;
            _local_4.alpha = _local_1;
            _local_4.scaleX = _local_2;
            _local_4.scaleY = _local_2;
            _local_3++;
         }
      }
      
      public function colorize(_arg_1:ColorTransform) : void
      {
         var _local_3:Sprite = null;
         var _local_2:int = 0;
         while(_local_2 < this.count)
         {
            _local_3 = this.stars[_local_2];
            _local_3.getChildAt(0).transform.colorTransform = _arg_1;
            _local_2++;
         }
      }
   }
}

