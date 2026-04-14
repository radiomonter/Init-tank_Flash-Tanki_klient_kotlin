package obfuscation.coh
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.TankWindowInner;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Tydoca extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const qygaf:uint = 16777215;
      
      private const niga:int = 120;
      
      private const qyma:int = 280;
      
      private const qucewasa:int = 10;
      
      private const BOTTOM_MARGIN:int = 5;
      
      private var varo:TankWindowInner;
      
      private var bafywico:LabelBase;
      
      public function Tydoca()
      {
         super();
         this.lycisyveg();
         this.lefypypiv();
         this.pajud();
         this.nav();
      }
      
      private function lycisyveg() : void
      {
         this.varo = new TankWindowInner(0,0,TankWindowInner.GREEN);
         this.varo.width = Raqohybe.hezo;
         addChild(this.varo);
      }
      
      private function lefypypiv() : void
      {
         var _local_1:Bitmap = new Bitmap();
         _local_1.x = int(this.varo.width / 2 - this.qyma / 2);
         _local_1.y = this.qucewasa;
         _local_1.bitmapData = Coneriw.wyfyp;
         this.varo.addChild(_local_1);
      }
      
      private function pajud() : void
      {
         this.bafywico = new LabelBase();
         this.bafywico.color = this.qygaf;
         this.bafywico.align = TextFormatAlign.CENTER;
         this.bafywico.text = localeService.getText(TanksLocale.TEXT_DAILY_QUEST_ALL_MISSIONS_COMPLETED);
         this.bafywico.x = int(Raqohybe.hezo / 2 - this.bafywico.width / 2);
         this.bafywico.y = this.niga + this.qucewasa * 2;
         this.varo.addChild(this.bafywico);
      }
      
      private function nav() : void
      {
         this.varo.height = this.bafywico.height + this.niga + this.qucewasa * 3;
      }
      
      public function boh() : int
      {
         return this.varo.height + this.BOTTOM_MARGIN;
      }
   }
}

