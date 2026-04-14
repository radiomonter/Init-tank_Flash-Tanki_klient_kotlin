package alternativa.tanks.gui.buttons
{
   import alternativa.tanks.gui.CrystalLabel;
   import alternativa.tanks.service.money.IMoneyService;
   import alternativa.tanks.service.money.Kyfa;
   import controls.base.ThreeLineBigButton;
   import flash.events.Event;
   
   public class CrystalButton extends ThreeLineBigButton implements Kyfa
   {
      
      [Inject]
      public static var moneyService:IMoneyService;
      
      protected var crystalLabel:CrystalLabel = new CrystalLabel();
      
      protected var crystals:int;
      
      public function CrystalButton(_arg_1:String = "", _arg_2:int = 0, _arg_3:int = 120)
      {
         super();
         this.width = _arg_3;
         infoContainer.addChild(this.crystalLabel);
         setText(_arg_1);
         this.setCost(_arg_2);
         this.show();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemoveFromStage);
      }
      
      private function onRemoveFromStage(_arg_1:Event) : void
      {
         moneyService.removeListener(this);
      }
      
      private function onAddToStage(_arg_1:Event) : void
      {
         moneyService.addListener(this);
         this.updateCrystalColor();
      }
      
      public function setCost(_arg_1:int) : void
      {
         this.crystals = _arg_1;
         this.crystalLabel.setCost(_arg_1);
         this.crystalLabel.x = (_width - this.crystalLabel.width) * 0.5;
         this.updateCrystalColor();
      }
      
      protected function show() : void
      {
         super.showInTwoRows(captionLabel,this.crystalLabel);
      }
      
      public function crystalsChanged(_arg_1:int) : void
      {
         this.updateCrystalColor();
      }
      
      private function updateCrystalColor() : void
      {
         if(moneyService.crystal < this.crystals)
         {
            this.crystalLabel.setColor(16731648);
         }
         else if(this.crystals == 0)
         {
            this.crystalLabel.setColor(11206400);
         }
         else
         {
            this.crystalLabel.setColor(16777215);
         }
      }
   }
}

