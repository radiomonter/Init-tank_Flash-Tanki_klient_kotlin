package obfuscation.coh
{
   import alternativa.types.Long;
   import controls.TankWindowInner;
   import controls.base.ThreeLineBigButton;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import obfuscation.pejug.Magyp;
   import obfuscation.rabygi.Jabehi;
   import obfuscation.rabygi.Nunaqypep;
   import obfuscation.wezej.Dizu;
   import obfuscation.wezej.Tikesutak;
   
   public class Virelasa extends Sprite
   {
      
      private const qucewasa:int = 10;
      
      private const niga:int = 120;
      
      private const qyma:int = 280;
      
      private const tuwif:int = 4;
      
      private var varo:TankWindowInner;
      
      private var zes:Favutedes;
      
      private var gugebinyve:Bitmap;
      
      private var mymomof:ThreeLineBigButton;
      
      private var puw:Magyp;
      
      public function Virelasa(_arg_1:Magyp)
      {
         super();
         this.puw = _arg_1;
         this.lycisyveg();
         this.lefypypiv();
         this.begypafuw();
         this.nav();
         this.dujyjy();
      }
      
      private function lycisyveg() : void
      {
         this.varo = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.varo.width = Raqohybe.wavugy;
         addChild(this.varo);
      }
      
      private function lefypypiv() : void
      {
         this.gugebinyve = new Bitmap();
         this.gugebinyve.x = int(this.varo.width / 2 - this.qyma / 2);
         this.gugebinyve.y = this.qucewasa;
         this.gugebinyve.bitmapData = this.puw.image.data;
         this.varo.addChild(this.gugebinyve);
      }
      
      private function begypafuw() : void
      {
         this.zes = new Favutedes(this.puw);
         this.zes.x = this.qucewasa;
         this.zes.y = this.niga + this.qucewasa * 2;
         this.varo.addChild(this.zes);
      }
      
      private function dujyjy() : void
      {
         this.mymomof = this.fan();
         addChild(this.mymomof);
         this.musaf();
      }
      
      private function fan() : ThreeLineBigButton
      {
         if(this.puw.progress == this.puw.finishCriteria)
         {
            return this.pefed();
         }
         return this.nerajenu();
      }
      
      private function nerajenu() : ThreeLineBigButton
      {
         var _local_1:Tikesutak = new Tikesutak();
         _local_1.addEventListener(MouseEvent.CLICK,this.pujasi);
         if(this.puw.canSkipForFree)
         {
            _local_1.jyjesam();
         }
         else
         {
            _local_1.showButtonWithCrystals(this.puw.skipCost);
         }
         return ThreeLineBigButton(_local_1);
      }
      
      private function pujasi(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new Jabehi(Jabehi.DAILY_QUEST_CHANGE,this.puw));
      }
      
      private function pefed() : ThreeLineBigButton
      {
         var _local_1:ThreeLineBigButton = new Dizu();
         _local_1.addEventListener(MouseEvent.CLICK,this.hal);
         return _local_1;
      }
      
      private function hal(_arg_1:MouseEvent) : void
      {
         this.mymomof.removeEventListener(MouseEvent.CLICK,this.hal);
         dispatchEvent(new Nunaqypep(Nunaqypep.DAILY_QUEST_GET_PRIZE,this.puw));
      }
      
      private function musaf() : void
      {
         this.mymomof.x = int(Raqohybe.wavugy / 2 - this.mymomof.width / 2);
         this.mymomof.y = this.varo.height + Raqohybe.WINDOW_MARGIN - this.tuwif;
      }
      
      private function nav() : void
      {
         this.varo.height = this.zes.boh() + this.niga + this.qucewasa * 3;
      }
      
      public function zof(_arg_1:Magyp) : void
      {
         this.puw = _arg_1;
         this.gugebinyve.bitmapData = _arg_1.image.data;
         this.zes.qopa(_arg_1);
         this.nav();
         this.musaf();
      }
      
      public function juraqaqe(_arg_1:int) : void
      {
         this.varo.height = _arg_1 - (Raqohybe.WINDOW_MARGIN + this.mymomof.height);
         var _local_2:int = _arg_1 - this.zibi();
         this.zes.mopahej(_local_2);
         this.mymomof.y = _arg_1 - this.mymomof.height - this.tuwif;
      }
      
      public function wuqut(_arg_1:int) : void
      {
         this.puw.canSkipForFree = false;
         this.puw.skipCost = _arg_1;
         Tikesutak(this.mymomof).showButtonWithCrystals(_arg_1);
      }
      
      public function boh() : int
      {
         return this.zes.boh() + this.zibi();
      }
      
      private function zibi() : int
      {
         return this.niga + this.qucewasa * 3 + Raqohybe.WINDOW_MARGIN + this.mymomof.height;
      }
      
      public function qedo() : Long
      {
         return this.puw.questId;
      }
      
      public function pugogydi() : void
      {
         var _local_1:Tikesutak = Tikesutak(this.mymomof);
         _local_1.removeEventListener(MouseEvent.CLICK,this.pujasi);
         _local_1.removeListeners();
      }
      
      public function pamytulec() : Boolean
      {
         return this.mymomof is Tikesutak;
      }
      
      public function roso() : void
      {
         this.mymomof.enabled = false;
      }
      
      public function zizahuw() : void
      {
         this.mymomof.enabled = true;
      }
   }
}

