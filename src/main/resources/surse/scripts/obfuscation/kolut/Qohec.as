package obfuscation.kolut
{
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import obfuscation.bude.BattleTeam;
   
   public class Qohec extends Sprite
   {
      
      private static const dedojad:int = 6;
      
      protected static const vupi:uint = 9249024;
      
      protected static const cigurado:uint = 16742221;
      
      protected static const tyquveja:uint = 16256;
      
      protected static const somamag:uint = 4760319;
      
      protected var rylo:int;
      
      protected var wosemaliw:int;
      
      protected var labelRed:Label;
      
      protected var wubiba:Label;
      
      private var background:Shape;
      
      protected var border:WhiteFrame;
      
      public function Qohec()
      {
         super();
         addChild(this.background = new Shape());
         addChild(this.border = new WhiteFrame());
         this.labelRed = this.createLabel(cigurado);
         this.wubiba = this.createLabel(somamag);
      }
      
      public function wygi(_arg_1:int, _arg_2:int) : void
      {
         this.rylo = _arg_1;
         this.labelRed.text = _arg_1.toString();
         this.wosemaliw = _arg_2;
         this.wubiba.text = _arg_2.toString();
         this.update();
      }
      
      public function birud(_arg_1:BattleTeam, _arg_2:int) : void
      {
         switch(_arg_1)
         {
            case BattleTeam.RED:
               this.scoreRed = _arg_2;
               break;
            case BattleTeam.BLUE:
               this.scoreBlue = _arg_2;
         }
         this.update();
      }
      
      public function set scoreRed(_arg_1:int) : void
      {
         this.rylo = _arg_1;
         this.labelRed.text = _arg_1.toString();
         this.update();
      }
      
      public function set scoreBlue(_arg_1:int) : void
      {
         this.wosemaliw = _arg_1;
         this.wubiba.text = _arg_1.toString();
         this.update();
      }
      
      public function update() : void
      {
         this.toni(this.calculateWidth());
      }
      
      protected function calculateWidth() : int
      {
         return 0;
      }
      
      private function toni(_arg_1:int) : void
      {
         this.border.width = _arg_1;
         var _local_2:String = GradientType.LINEAR;
         var _local_3:Array = [vupi,tyquveja];
         var _local_4:Array = [1,1];
         var _local_5:int = int(8 / _arg_1 * 255);
         var _local_6:Array = [127 - _local_5,127 + _local_5];
         var _local_7:int = 2;
         var _local_8:Matrix = new Matrix();
         _local_8.createGradientBox(_arg_1 - _local_7,this.border.height - _local_7,0,0,0);
         var _local_9:String = SpreadMethod.PAD;
         var _local_10:Graphics = this.background.graphics;
         _local_10.clear();
         _local_10.beginGradientFill(_local_2,_local_3,_local_4,_local_6,_local_8,_local_9);
         _local_10.drawRect(_local_7,_local_7,_arg_1 - 2 * _local_7,this.border.height - _local_7 - 1);
         _local_10.endFill();
      }
      
      private function createLabel(_arg_1:uint) : Label
      {
         var _local_2:Label = new Label();
         _local_2.color = _arg_1;
         _local_2.size = 18;
         _local_2.bold = true;
         _local_2.autoSize = TextFieldAutoSize.CENTER;
         _local_2.y = dedojad;
         addChild(_local_2);
         return _local_2;
      }
   }
}

