package alternativa.tanks.view.battlecreate.slider
{
   import controls.Slider;
   import controls.slider.SliderTrack;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class SelectRankSlider extends Slider
   {
      
      private var _minRang:int = 0;
      
      private var _maxRang:int = 0;
      
      private var _prevMinRang:int = 0;
      
      private var _prevMaxRang:int = 0;
      
      private var _currentRang:int = 1;
      
      private var _maxRangRange:int = 2;
      
      private var sthumb:SelectRankThumbSlider = new SelectRankThumbSlider();
      
      protected var _thumbTick:Number;
      
      public function SelectRankSlider()
      {
         super();
         removeChild(track);
         track = new SliderTrack(false);
         addChild(track);
         removeChild(thumb);
         addChild(this.sthumb);
         _thumb_width = 36;
      }
      
      override protected function UnConfigUI(_arg_1:Event) : void
      {
         stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragThumb);
      }
      
      override protected function ConfigUI(_arg_1:Event) : void
      {
         this.sthumb.leftDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.sthumb.rightDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
         this.sthumb.centerDrag.addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseDown);
      }
      
      override protected function onMouseDown(_arg_1:MouseEvent) : void
      {
         super.onMouseDown(_arg_1);
         stage.addEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
         this._prevMinRang = this._minRang;
         this._prevMaxRang = this._maxRang;
      }
      
      public function get minRang() : int
      {
         return this._minRang;
      }
      
      public function set minRang(_arg_1:int) : void
      {
         this._minRang = _arg_1;
         this.checkMinRang();
         this.drawThumb();
      }
      
      public function get maxRang() : int
      {
         return this._maxRang;
      }
      
      public function set maxRang(_arg_1:int) : void
      {
         this._maxRang = _arg_1;
         this.checkMaxRang();
         this.drawThumb();
      }
      
      public function get currentRang() : int
      {
         return this._currentRang;
      }
      
      public function set currentRang(_arg_1:int) : void
      {
         this._currentRang = _arg_1;
         value = this._minRang = this._maxRang = this._currentRang;
         this.drawThumb();
      }
      
      protected function checkMinRang() : void
      {
         if(this._minRang < _minValue)
         {
            this._minRang = _minValue;
         }
         else if(this._minRang < this._currentRang - this._maxRangRange)
         {
            this._minRang = this._currentRang - this._maxRangRange;
            this._maxRang = this._currentRang;
         }
         else if(this._minRang < this._maxRang - this._maxRangRange)
         {
            this._maxRang = this._minRang + this._maxRangRange;
         }
         else if(this._minRang > this._currentRang)
         {
            this._minRang = this._currentRang;
         }
      }
      
      protected function checkMaxRang() : void
      {
         if(this._maxRang > _maxValue)
         {
            this._maxRang = _maxValue;
         }
         else if(this._maxRang > this._currentRang + this._maxRangRange)
         {
            this._maxRang = this._currentRang + this._maxRangRange;
            this._minRang = this._currentRang;
         }
         else if(this._maxRang > this._minRang + this._maxRangRange)
         {
            this._minRang = this._maxRang - this._maxRangRange;
         }
         else if(this._maxRang < this._currentRang)
         {
            this._maxRang = this._currentRang;
         }
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         var _local_2:int = _maxValue - _minValue;
         this._thumbTick = (_width + 2 - _thumb_width) / _local_2;
         this.drawThumb();
      }
      
      override protected function onMouseUp(_arg_1:MouseEvent) : void
      {
         if(_arg_1 != null)
         {
            stage.removeEventListener(MouseEvent.MOUSE_MOVE,this.dragThumb);
            stage.removeEventListener(MouseEvent.MOUSE_UP,this.onMouseUp);
            if(this._prevMaxRang != this._minRang || this._prevMaxRang != this._maxRang)
            {
               dispatchEvent(new SelectRankSliderEvent());
            }
         }
      }
      
      override protected function dragThumb(_arg_1:MouseEvent) : void
      {
         var _local_6:int = 0;
         var _local_2:* = trgt.mouseX < curThumbX;
         var _local_3:* = trgt.mouseX > curThumbX;
         var _local_4:* = this._minRang < this._currentRang;
         var _local_5:* = this._maxRang > this._currentRang;
         if(trgt == this.sthumb.leftDrag && (Boolean(_local_2) || Boolean(_local_4)))
         {
            this._minRang += int((this.sthumb.leftDrag.mouseX - curThumbX) / this._thumbTick);
            this.checkMinRang();
            this.checkMaxRang();
         }
         else if(trgt == this.sthumb.rightDrag && (Boolean(_local_3) || Boolean(_local_5)))
         {
            this._maxRang += int((this.sthumb.rightDrag.mouseX - curThumbX) / this._thumbTick);
            this.checkMinRang();
            this.checkMaxRang();
         }
         else if(trgt == this.sthumb.centerDrag && ((Boolean(_local_2) || Boolean(_local_4)) && (Boolean(_local_3) || Boolean(_local_5))))
         {
            this._minRang += int((this.sthumb.centerDrag.mouseX - curThumbX) / this._thumbTick);
            this._maxRang += int((this.sthumb.centerDrag.mouseX - curThumbX) / this._thumbTick);
            if(this._minRang < _minValue)
            {
               _local_6 = this._maxRang - this._minRang;
               this._minRang = _minValue;
               this._maxRang = _minValue + _local_6;
            }
            if(this._maxRang > _maxValue)
            {
               _local_6 = this._maxRang - this._minRang;
               this._maxRang = _maxValue;
               this._minRang = this._maxRang - _local_6;
            }
            _local_6 = this._maxRang - this._minRang;
            if(this._minRang > this._currentRang)
            {
               this._minRang = this._currentRang;
               this._maxRang = this._minRang + _local_6;
            }
            if(this._maxRang < this._currentRang)
            {
               this._maxRang = this._currentRang;
               this._minRang = this._maxRang - _local_6;
            }
         }
         this.drawThumb();
      }
      
      private function drawThumb() : void
      {
         var _local_1:int = this._maxRang - this._minRang;
         this.sthumb.width = _thumb_width + this._thumbTick * _local_1;
         this.sthumb.x = int(this._thumbTick * (this._minRang - _minValue));
         this.sthumb.minRang = this._minRang;
         this.sthumb.maxRang = this._maxRang;
      }
      
      public function get maxRangRange() : int
      {
         return this._maxRangRange;
      }
      
      public function set maxRangRange(_arg_1:int) : void
      {
         this._maxRangRange = _arg_1;
      }
   }
}

