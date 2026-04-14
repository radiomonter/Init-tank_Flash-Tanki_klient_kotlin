package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   import flash.display.Bitmap;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.SpreadMethod;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.geom.Matrix;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kolut.Qohiqov;
   import obfuscation.tydym.Fudazoze;
   
   public class Wagy extends Sprite implements Qohiqov
   {
      
      private static var hypyji:Class = Kov;
      
      private static var jylynege:Class = Gyfybumoq;
      
      private static var nybyweb:Class = Lykihybir;
      
      private static var dasa:Class = Jipesocy;
      
      private static var cepon:Class = Gulezubi;
      
      private static const cigurado:uint = 16742221;
      
      private static const somamag:uint = 4760319;
      
      private static const vupi:uint = 9249024;
      
      private static const tyquveja:uint = 16256;
      
      private static const duvolawu:int = 30;
      
      private static const dedojad:int = 6;
      
      private var border:WhiteFrame;
      
      private var zutemapi:Fudazoze;
      
      private var jeletaq:Fudazoze;
      
      private var labelRed:Label;
      
      private var wubiba:Label;
      
      private var time:int;
      
      private var vozyci:Wiwacod = new Wiwacod(cigurado,16777215);
      
      private var tapycum:Wiwacod = new Wiwacod(somamag,16777215);
      
      private var blinker:Rymefuqiw = new Rymefuqiw(0,1,Vector.<int>([200,600]),Vector.<Number>([10,1.1]));
      
      public function Wagy()
      {
         super();
         this.border = new WhiteFrame();
         addChild(this.border);
         this.labelRed = this.createLabel(cigurado);
         this.wubiba = this.createLabel(somamag);
         this.zutemapi = new Fudazoze(new hypyji(),new nybyweb(),new cepon(),this.blinker);
         this.zutemapi.y = 5;
         addChild(this.zutemapi);
         this.jeletaq = new Fudazoze(new jylynege(),new dasa(),new cepon(),this.blinker);
         this.jeletaq.y = 5;
         addChild(this.jeletaq);
         this.update();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private static function kogiquf(_arg_1:Label, _arg_2:Wiwacod, _arg_3:Bitmap) : void
      {
         var _local_4:uint = 0;
         if(_arg_3.visible)
         {
            _local_4 = _arg_2.interpolate(_arg_3.alpha);
         }
         else
         {
            _local_4 = _arg_2.pifebi;
         }
         if(_local_4 != _arg_1.textColor)
         {
            _arg_1.textColor = _local_4;
         }
      }
      
      public function wygi(_arg_1:int, _arg_2:int) : void
      {
         this.labelRed.text = _arg_1.toString();
         this.wubiba.text = _arg_2.toString();
         this.jeletaq.setState(Fudazoze.jiqekejin);
         this.zutemapi.setState(Fudazoze.jiqekejin);
         this.update();
      }
      
      public function set redScore(_arg_1:int) : void
      {
         if(int(this.labelRed.text) == _arg_1)
         {
            return;
         }
         this.labelRed.text = _arg_1.toString();
         this.zutemapi.setState(Fudazoze.qewovesez);
         this.update();
      }
      
      public function set blueScore(_arg_1:int) : void
      {
         if(int(this.wubiba.text) == _arg_1)
         {
            return;
         }
         this.wubiba.text = _arg_1.toString();
         this.jeletaq.setState(Fudazoze.qewovesez);
         this.update();
      }
      
      public function showFlagAtBase(_arg_1:BattleTeam) : void
      {
         var _local_2:Fudazoze = this.puqudiful(_arg_1);
         _local_2.setState(Fudazoze.jiqekejin);
      }
      
      public function showFlagCarried(_arg_1:BattleTeam) : void
      {
         var _local_2:Fudazoze = this.puqudiful(_arg_1);
         _local_2.setState(Fudazoze.munykumoh);
      }
      
      public function showFlagDropped(_arg_1:BattleTeam) : void
      {
         var _local_2:Fudazoze = this.puqudiful(_arg_1);
         _local_2.setState(Fudazoze.copymumy);
      }
      
      public function birud(_arg_1:BattleTeam, _arg_2:int) : void
      {
         switch(_arg_1)
         {
            case BattleTeam.BLUE:
               this.blueScore = _arg_2;
               return;
            case BattleTeam.RED:
               this.redScore = _arg_2;
         }
      }
      
      private function update() : void
      {
         var _local_1:int = 5;
         var _local_2:int = this.labelRed.width > this.wubiba.width ? int(this.labelRed.width) : int(this.wubiba.width);
         this.jeletaq.x = _local_1 + _local_1;
         var _local_3:int = this.jeletaq.x + duvolawu + _local_1;
         this.labelRed.x = _local_3 + (_local_2 - this.labelRed.width >> 1);
         _local_3 += _local_2 + _local_1 + _local_1;
         this.wubiba.x = _local_3 + (_local_2 - this.wubiba.width >> 1);
         _local_3 += _local_2 + _local_1;
         this.zutemapi.x = _local_3;
         _local_3 += duvolawu + _local_1 + _local_1;
         this.toni(_local_3);
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
         _local_8.createGradientBox(_arg_1 - 2 * _local_7,this.border.height - 2 * _local_7,0,0,0);
         var _local_9:String = SpreadMethod.PAD;
         var _local_10:Graphics = graphics;
         _local_10.clear();
         _local_10.beginGradientFill(_local_2,_local_3,_local_4,_local_6,_local_8,_local_9);
         _local_10.drawRect(_local_7,_local_7,_arg_1 - 2 * _local_7,this.border.height - 2 * _local_7);
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
         _local_2.text = "0";
         addChild(_local_2);
         return _local_2;
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         this.update();
         this.time = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         var _local_2:int = getTimer();
         var _local_3:int = _local_2 - this.time;
         this.time = _local_2;
         this.blinker.update(_local_2,_local_3);
         this.jeletaq.update(_local_2,_local_3);
         this.zutemapi.update(_local_2,_local_3);
         kogiquf(this.labelRed,this.vozyci,this.zutemapi.hedohygyl);
         kogiquf(this.wubiba,this.tapycum,this.jeletaq.hedohygyl);
      }
      
      private function puqudiful(_arg_1:BattleTeam) : Fudazoze
      {
         switch(_arg_1)
         {
            case BattleTeam.BLUE:
               return this.zutemapi;
            case BattleTeam.RED:
               return this.jeletaq;
            default:
               throw new ArgumentError("Unsupported team type");
         }
      }
   }
}

