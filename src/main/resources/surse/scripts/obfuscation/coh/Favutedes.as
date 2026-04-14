package obfuscation.coh
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import obfuscation.pejug.Magyp;
   import projects.tanks.client.panel.model.dailyquest.Nokomojob;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Favutedes extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const fogahidal:int = 5;
      
      private const hadyqoben:int = 4;
      
      private const jukefuf:int = 14;
      
      private const fipyhocen:int = 9;
      
      private const rud:int = 50;
      
      private const zekosete:int = 14;
      
      private const rydus:int = 8;
      
      private const leguc:int = 10;
      
      private const HEADER_COLOR:uint = 5898034;
      
      private const pezuke:uint = 16777215;
      
      private var jyfevip:Bitmap;
      
      private var jycizici:Bitmap;
      
      private var gojatijif:Bitmap;
      
      private var fedigy:Bitmap;
      
      private var belowote:Bitmap;
      
      private var jyhagypu:Bitmap;
      
      private var zylimisa:Bitmap;
      
      private var gofutikehy:Bitmap;
      
      private var sel:Bitmap;
      
      private var puw:Magyp;
      
      private var _width:int;
      
      private var _height:int;
      
      private var dum:LabelBase;
      
      private var dugihewu:LabelBase;
      
      private var sady:LabelBase;
      
      private var nuh:LabelBase;
      
      private var gavef:Vector.<LabelBase>;
      
      public function Favutedes(_arg_1:Magyp)
      {
         super();
         this.puw = _arg_1;
         this._width = Raqohybe.wavugy - this.leguc * 2;
         this._height = this.boh();
         this.gavef = new Vector.<LabelBase>();
         this.letopis();
         this.jiqo();
         this.ned();
         this.sor();
         this.drawBackground();
         this.gehemy();
         this.kevuqac();
      }
      
      private function letopis() : void
      {
         this.jyfevip = new Bitmap(Coneriw.qomudukyc);
         addChild(this.jyfevip);
         this.jycizici = new Bitmap(Coneriw.tican);
         addChild(this.jycizici);
         this.gojatijif = new Bitmap(Coneriw.kuceto);
         addChild(this.gojatijif);
         this.jycizici.x = this.jyfevip.width;
         this.gojatijif.x = this._width - this.gojatijif.width;
         this.jycizici.width = this.gojatijif.x - this.jycizici.x;
      }
      
      private function jiqo() : void
      {
         this.fedigy = new Bitmap(Coneriw.mosu);
         this.fedigy.y = this._height - this.fedigy.height;
         addChild(this.fedigy);
         this.belowote = new Bitmap(Coneriw.nyzaqesez);
         this.belowote.y = this.fedigy.y;
         this.belowote.x = this.fedigy.width;
         this.belowote.width = this.jycizici.width;
         addChild(this.belowote);
         this.jyhagypu = new Bitmap(Coneriw.hafi);
         this.jyhagypu.y = this.fedigy.y;
         this.jyhagypu.x = this.gojatijif.x;
         addChild(this.jyhagypu);
      }
      
      private function ned() : void
      {
         this.zylimisa = new Bitmap(Coneriw.suzewufo);
         this.zylimisa.y = this.jyfevip.height;
         this.zylimisa.height = this._height - this.jyfevip.height - this.fedigy.height;
         addChild(this.zylimisa);
      }
      
      private function sor() : void
      {
         this.gofutikehy = new Bitmap(Coneriw.kivisu);
         this.gofutikehy.y = this.zylimisa.y;
         this.gofutikehy.x = this.jyhagypu.x;
         this.gofutikehy.height = this.zylimisa.height;
         addChild(this.gofutikehy);
      }
      
      private function drawBackground() : void
      {
         this.sel = new Bitmap(Coneriw.jidywawok);
         this.sel.y = this.jyfevip.height + this.jyfevip.y;
         this.sel.x = this.jyfevip.width;
         this.sel.height = this._height - this.fedigy.height - this.jyfevip.height;
         this.sel.width = this._width - this.jyfevip.width - this.gojatijif.width;
         addChild(this.sel);
      }
      
      private function gehemy() : void
      {
         this.vorenoduj();
         this.myhiraw();
         this.wifysiv();
      }
      
      private function vorenoduj() : void
      {
         this.sady = new LabelBase();
         this.sady.color = this.HEADER_COLOR;
         this.sady.align = TextFormatAlign.LEFT;
         this.sady.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_GOAL);
         this.sady.x = this.fogahidal;
         this.sady.y = this.hadyqoben;
         addChild(this.sady);
      }
      
      private function myhiraw() : void
      {
         this.dugihewu = new LabelBase();
         this.dugihewu.color = this.pezuke;
         this.dugihewu.align = TextFormatAlign.LEFT;
         this.dugihewu.text = this.qimeby();
         this.dugihewu.x = this._width - this.fipyhocen - this.dugihewu.textWidth;
         this.dugihewu.y = this.sady.y + this.jukefuf;
         addChild(this.dugihewu);
      }
      
      private function wifysiv() : void
      {
         this.dum = new LabelBase();
         this.dum.color = this.pezuke;
         this.dum.align = TextFormatAlign.LEFT;
         this.dum.text = this.puw.description;
         this.dum.wordWrap = true;
         this.dum.width = this.dugihewu.x - this.leguc;
         this.dum.x = this.sady.x;
         this.dum.y = this.dugihewu.y;
         addChild(this.dum);
      }
      
      private function qimeby() : String
      {
         return this.puw.progress + "/" + this.puw.finishCriteria;
      }
      
      private function kevuqac() : void
      {
         this.nuh = new LabelBase();
         this.nuh.color = this.HEADER_COLOR;
         this.nuh.align = TextFormatAlign.LEFT;
         this.nuh.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_PRIZE);
         this.nuh.x = this.fogahidal;
         this.nuh.y = this.rud;
         addChild(this.nuh);
         this.bucegyge();
      }
      
      public function qopa(_arg_1:Magyp) : void
      {
         this.puw = _arg_1;
         this.dum.text = this.puw.description;
         this.dugihewu.text = this.qimeby();
         this.dugihewu.x = this._width - this.fipyhocen - this.dugihewu.textWidth;
         this.mopahej(this.boh());
         this.jasymo();
         this.bucegyge();
      }
      
      public function mopahej(_arg_1:int) : void
      {
         this.fedigy.y = _arg_1 - this.fedigy.height;
         this.belowote.y = this.fedigy.y;
         this.jyhagypu.y = this.fedigy.y;
         this.zylimisa.height = _arg_1 - this.jyfevip.height - this.fedigy.height;
         this.gofutikehy.height = this.zylimisa.height;
         this.sel.height = _arg_1 - this.fedigy.height - this.jyfevip.height;
      }
      
      private function jasymo() : void
      {
         var _local_1:LabelBase = null;
         for each(_local_1 in this.gavef)
         {
            removeChild(_local_1);
         }
         this.gavef.splice(0,this.gavef.length);
      }
      
      private function bucegyge() : void
      {
         var _local_1:Nokomojob = null;
         var _local_2:LabelBase = null;
         var _local_3:int = 0;
         while(_local_3 < this.puw.prizes.length)
         {
            _local_1 = this.puw.prizes[_local_3];
            _local_2 = new LabelBase();
            _local_2.color = this.pezuke;
            _local_2.align = TextFormatAlign.LEFT;
            _local_2.text = _local_1.name + " × " + _local_1.count;
            _local_2.x = this.fogahidal;
            _local_2.y = this.rud + this.jukefuf + _local_3 * this.zekosete;
            addChild(_local_2);
            this.gavef.push(_local_2);
            _local_3++;
         }
      }
      
      public function boh() : int
      {
         return this.rud + this.jukefuf + this.zekosete * this.puw.prizes.length + this.rydus;
      }
   }
}

