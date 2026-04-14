package obfuscation.jiw
{
   import alternativa.math.Vector3;
   import flash.display.Bitmap;
   import flash.display.DisplayObject;
   import flash.display.PixelSnapping;
   import flash.display.Sprite;
   import obfuscation.juha.Pyni;
   import obfuscation.ligy.Zyjova;
   import utils.graphics.SectorMask;
   
   public class Huzyd extends Sprite
   {
      
      private var vakuzo:Pyni;
      
      private var vepumu:Bitmap;
      
      private var wulyqa:Bitmap;
      
      private var sectorMask:SectorMask;
      
      private var score:Number = 0;
      
      private var container:Sprite = new Sprite();
      
      public function Huzyd(_arg_1:Pyni)
      {
         super();
         this.vakuzo = _arg_1;
         this.maboqika();
      }
      
      private static function kege(_arg_1:Zyjova) : Bitmap
      {
         return new Bitmap(Tobavyr.zimory(_arg_1),PixelSnapping.AUTO,true);
      }
      
      private function maboqika() : void
      {
         this.vepumu = kege(Zyjova.BLUE);
         this.wulyqa = kege(Zyjova.RED);
         addChild(kege(Zyjova.NEUTRAL));
         addChild(this.container);
         this.sectorMask = new SectorMask(this.vepumu.width);
         this.container.addChild(this.sectorMask);
         addChild(new Bitmap(Tobavyr.nigurarip(this.vakuzo.getName().charAt(0))));
         this.pewe();
      }
      
      public function nikigali(_arg_1:Vector3) : void
      {
         this.vakuzo.readPosition(_arg_1);
      }
      
      public function update() : void
      {
         this.wygi(this.vakuzo.neka());
      }
      
      public function pac() : Pyni
      {
         return this.vakuzo;
      }
      
      private function wygi(_arg_1:Number) : void
      {
         var _local_2:Number = NaN;
         if(_arg_1 < -100)
         {
            _arg_1 = -100;
         }
         else if(_arg_1 > 100)
         {
            _arg_1 = 100;
         }
         if(this.score != _arg_1)
         {
            if(_arg_1 == 0)
            {
               this.pewe();
            }
            else
            {
               _local_2 = Math.abs(_arg_1) / 100;
               this.sectorMask.setProgress(1 - _local_2,1);
               if(_arg_1 < 0)
               {
                  this.cobalu();
               }
               else if(_arg_1 > 0)
               {
                  this.kipi();
               }
            }
            this.score = _arg_1;
         }
      }
      
      private function pewe() : void
      {
         this.container.visible = false;
      }
      
      private function cobalu() : void
      {
         this.container.visible = true;
         this.woguzas(this.vepumu,this.wulyqa);
         this.container.mask = this.sectorMask;
      }
      
      private function kipi() : void
      {
         this.container.visible = true;
         this.woguzas(this.wulyqa,this.vepumu);
         this.container.mask = this.sectorMask;
      }
      
      private function woguzas(_arg_1:DisplayObject, _arg_2:DisplayObject) : void
      {
         if(_arg_2.parent == null)
         {
            if(_arg_1.parent != null)
            {
               this.container.removeChild(_arg_1);
            }
            this.container.addChild(_arg_2);
         }
      }
   }
}

