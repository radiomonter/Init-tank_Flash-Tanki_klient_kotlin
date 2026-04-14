package obfuscation.walytolo
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.locale.constants.TextConst;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Zigi;
   import assets.Diamond;
   import controls.Money;
   
   public class Wasygac extends Zigi
   {
      
      private var diamond:Diamond = new Diamond();
      
      public function Wasygac(_arg_1:int)
      {
         super(_arg_1);
      }
      
      override protected function init() : void
      {
         super.init();
         addChild(this.diamond);
         this.diamond.y = 4;
         this.update();
      }
      
      public function zone(_arg_1:int) : void
      {
         var _local_2:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
         var _local_3:String = _local_2.getText(TextConst.BATTLE_FUND);
         label.text = _local_3 + ": " + Money.numToString(_arg_1,false);
         this.update();
      }
      
      private function update() : void
      {
         this.diamond.x = label.x + label.width + 2;
      }
   }
}

