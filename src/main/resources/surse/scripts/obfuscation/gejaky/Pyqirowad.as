package obfuscation.gejaky
{
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Femegikad;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Jatapyba;
   import controls.base.LabelBase;
   import controls.resultassets.WhiteFrame;
   import flash.display.Shape;
   import flash.display.Sprite;
   import obfuscation.juha.Pyni;
   
   public class Pyqirowad extends Sprite implements Renderer, Femegikad
   {
      
      private static const fota:int = 1;
      
      private var shape:Shape = new Shape();
      
      private var indicators:Vector.<Bekohuha>;
      
      private var _width:int;
      
      private var _height:int;
      
      public function Pyqirowad(_arg_1:Vector.<Pyni>)
      {
         super();
         this.molo(_arg_1);
         this.japiz(_arg_1.length);
         addChild(this.shape);
         this.kiqaq();
      }
      
      public function removeFromParent() : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      private function kiqaq() : void
      {
         var _local_1:Bekohuha = null;
         for each(_local_1 in this.indicators)
         {
            addChild(_local_1.getLabel());
         }
      }
      
      public function lilor(_arg_1:Jatapyba) : void
      {
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.update();
      }
      
      public function update() : void
      {
         var _local_1:Bekohuha = null;
         for each(_local_1 in this.indicators)
         {
            _local_1.update();
         }
      }
      
      private function molo(_arg_1:Vector.<Pyni>) : void
      {
         var _local_5:Vector.<Pyni> = null;
         var _local_2:Pyni = null;
         var _local_3:Bekohuha = null;
         var _local_4:LabelBase = null;
         var _local_7:int = 0;
         _local_5 = this.ripa(_arg_1);
         var _local_6:int = 2;
         this.indicators = new Vector.<Bekohuha>(_arg_1.length);
         while(_local_7 < _local_5.length)
         {
            _local_2 = _local_5[_local_7];
            _local_3 = new Bekohuha(_local_2);
            _local_3.x = _local_6;
            _local_3.y = 2;
            addChild(_local_3);
            _local_4 = _local_3.getLabel();
            _local_4.y = 8;
            _local_4.x = int(_local_3.x + (_local_3.width - _local_4.width) / 2);
            if(_local_7 < _local_5.length - 1)
            {
               this.shape.graphics.lineStyle(0,16777215);
               this.shape.graphics.moveTo(_local_3.x + 36,2);
               this.shape.graphics.lineTo(_local_3.x + 36,38);
            }
            this.indicators[_local_7] = _local_3;
            _local_6 += _local_3.width + fota;
            _local_7++;
         }
      }
      
      private function ripa(sydi:Vector.<Pyni>) : Vector.<Pyni>
      {
         var jad:Vector.<Pyni> = sydi;
         return jad.concat().sort(function(_arg_1:Pyni, _arg_2:Pyni):Number
         {
            if(_arg_1.getName() < _arg_2.getName())
            {
               return -1;
            }
            if(_arg_1.getName() > _arg_2.getName())
            {
               return 1;
            }
            return 0;
         });
      }
      
      private function japiz(_arg_1:int) : void
      {
         var _local_2:WhiteFrame = null;
         _local_2 = new WhiteFrame();
         _local_2.width = _arg_1 * (36 + fota) - fota + 4;
         addChild(_local_2);
         this._width = _local_2.width;
         this._height = _local_2.height;
      }
      
      [Obfuscation(rename="false")]
      override public function get width() : Number
      {
         return this._width;
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return this._height;
      }
   }
}

