package obfuscation.gejaky
{
   import alternativa.tanks.display.Flash;
   import alternativa.tanks.display.SquareSectorIndicator;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.geom.ColorTransform;
   import flash.utils.getTimer;
   import obfuscation.juha.Pyni;
   import obfuscation.ligy.Zyjova;
   
   public class Bekohuha extends Sprite
   {
      
      private static const SIZE:int = 36;
      
      private static const cigurado:uint = 16742221;
      
      private static const somamag:uint = 4760319;
      
      private static const peqa:uint = 16777215;
      
      private static const vupi:uint = 9249024;
      
      private static const tyquveja:uint = 16256;
      
      private const flash:Flash = Flash.getDefault();
      
      private var point:Pyni;
      
      private var label:LabelBase;
      
      private var fyqohy:SquareSectorIndicator;
      
      private var tohudedaz:Zyjova = Zyjova.NEUTRAL;
      
      private var score:Number = 0;
      
      public function Bekohuha(_arg_1:Pyni)
      {
         super();
         this.point = _arg_1;
         this.qira();
         this.createLabel();
         this.update();
      }
      
      public static function quruqa(_arg_1:Zyjova) : uint
      {
         switch(_arg_1)
         {
            case Zyjova.BLUE:
               return somamag;
            case Zyjova.RED:
               return cigurado;
            default:
               return peqa;
         }
      }
      
      private function qira() : void
      {
         this.fyqohy = new SquareSectorIndicator(SIZE,0,0,0);
         addChild(this.fyqohy);
      }
      
      private function createLabel() : void
      {
         this.label = new LabelBase();
         this.label.size = 18;
         this.label.bold = true;
         this.label.color = quruqa(this.point.poforiv());
         this.label.text = this.point.getName();
      }
      
      public function getLabel() : LabelBase
      {
         return this.label;
      }
      
      public function update() : void
      {
         this.loc();
         this.updateScore();
      }
      
      private function tulovosu(_arg_1:uint) : void
      {
         var _local_2:ColorTransform = this.fyqohy.transform.colorTransform;
         _local_2.redOffset = _arg_1;
         _local_2.greenOffset = _arg_1;
         _local_2.blueOffset = _arg_1;
         this.fyqohy.transform.colorTransform = _local_2;
      }
      
      private function loc() : void
      {
         if(this.tohudedaz != this.point.poforiv())
         {
            this.tohudedaz = this.point.poforiv();
            this.label.color = this.pinisyd();
            if(this.tohudedaz != Zyjova.NEUTRAL)
            {
               this.flash.init();
            }
         }
         if(this.flash.isActive())
         {
            this.tulovosu(this.flash.getColorOffset(getTimer()));
         }
      }
      
      private function pinisyd() : uint
      {
         switch(this.tohudedaz)
         {
            case Zyjova.BLUE:
               return somamag;
            case Zyjova.RED:
               return cigurado;
            default:
               return peqa;
         }
      }
      
      private function updateScore() : void
      {
         if(this.score != this.point.neka())
         {
            this.score = this.point.neka();
            if(this.score < 0)
            {
               this.fyqohy.setColor(vupi,1);
            }
            else if(this.score > 0)
            {
               this.fyqohy.setColor(tyquveja,1);
            }
            else
            {
               this.fyqohy.setColor(0,0);
            }
            this.fyqohy.setProgress(Math.abs(this.score) / 100);
         }
      }
      
      [Obfuscation(rename="false")]
      override public function get width() : Number
      {
         return SIZE;
      }
      
      [Obfuscation(rename="false")]
      override public function get height() : Number
      {
         return SIZE;
      }
   }
}

