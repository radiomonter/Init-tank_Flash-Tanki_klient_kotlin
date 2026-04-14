package alternativa.tanks.view.battlecreate.slider
{
   import controls.slider.SliderThumb;
   import flash.display.BitmapData;
   import flash.display.Graphics;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import forms.ranks.SmallRankIcon;
   
   public class SelectRankThumbSlider extends SliderThumb
   {
      
      private static const bitmapArrow:Class = SelectRankThumbSlider_bitmapArrow;
      
      private static const arrow:BitmapData = new bitmapArrow().bitmapData;
      
      private var iconMin:SmallRankIcon;
      
      private var iconMax:SmallRankIcon;
      
      private var _minRang:int = 0;
      
      private var _maxRang:int = 0;
      
      public var leftDrag:Sprite;
      
      public var centerDrag:Sprite;
      
      public var rightDrag:Sprite;
      
      public function SelectRankThumbSlider()
      {
         var _local_1:Graphics = null;
         this.iconMin = new SmallRankIcon();
         this.iconMax = new SmallRankIcon();
         super();
         addChild(this.iconMax);
         addChild(this.iconMin);
         this.iconMax.y = 9;
         this.iconMin.y = 9;
         this.leftDrag = new Sprite();
         _local_1 = this.leftDrag.graphics;
         _local_1.beginFill(0,0);
         _local_1.drawRect(0,0,15,30);
         _local_1.endFill();
         this.centerDrag = new Sprite();
         this.centerDrag.x = 15;
         this.rightDrag = new Sprite();
         _local_1 = this.rightDrag.graphics;
         _local_1.beginFill(0,0);
         _local_1.drawRect(0,0,15,30);
         _local_1.endFill();
         addChild(this.leftDrag);
         addChild(this.centerDrag);
         addChild(this.rightDrag);
         this.leftDrag.buttonMode = true;
         this.centerDrag.buttonMode = true;
         this.rightDrag.buttonMode = true;
      }
      
      override protected function draw() : void
      {
         var _local_1:Graphics = null;
         var _local_2:Matrix = null;
         super.draw();
         var _local_3:int = this._maxRang - this._minRang;
         this.iconMin.setDefaultAccount(this._minRang);
         this.iconMax.setDefaultAccount(this._maxRang);
         this.iconMax.visible = _local_3 > 0;
         if(_local_3 == 0)
         {
            this.iconMax.x = this.iconMin.x = int((_width - this.iconMin.width) / 2);
         }
         else
         {
            this.iconMin.x = 11;
            this.iconMax.x = _width - this.iconMax.width - 11;
            _local_1 = this.graphics;
            _local_2 = new Matrix();
            _local_2.translate(5,12);
            _local_1.beginBitmapFill(arrow,_local_2);
            _local_1.drawRect(5,12,4,7);
            _local_1.endFill();
            _local_2 = new Matrix();
            _local_2.rotate(Math.PI);
            _local_2.translate(_width - 9,12);
            _local_1.beginBitmapFill(arrow,_local_2);
            _local_1.drawRect(_width - 9,12,4,7);
            _local_1.endFill();
         }
         _local_1 = this.centerDrag.graphics;
         _local_1.clear();
         _local_1.beginFill(0,0);
         _local_1.drawRect(0,0,_width - 30,30);
         _local_1.endFill();
         this.rightDrag.x = _width - 15;
      }
      
      public function set minRang(_arg_1:int) : void
      {
         this._minRang = _arg_1;
         this.draw();
      }
      
      public function set maxRang(_arg_1:int) : void
      {
         this._maxRang = _arg_1;
         this.draw();
      }
   }
}

