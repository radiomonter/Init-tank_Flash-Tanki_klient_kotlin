package alternativa.tanks.model.shop
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   
   public class ShopCategoryHeader extends Sprite
   {
      
      private var headerText:String;
      
      private var descriptionText:String;
      
      private var headerLabel:LabelBase;
      
      private var descriptionLabel:LabelBase;
      
      public function ShopCategoryHeader(_arg_1:String, _arg_2:String)
      {
         super();
         this.headerText = _arg_1;
         this.descriptionText = _arg_2;
         this.init();
      }
      
      private function init() : void
      {
         this.createHeaderLabel();
         this.createDescriptionLabel();
      }
      
      private function createHeaderLabel() : void
      {
         this.headerLabel = new LabelBase();
         this.headerLabel.size = 18;
         this.headerLabel.text = this.headerText;
         addChild(this.headerLabel);
      }
      
      private function createDescriptionLabel() : void
      {
         this.descriptionLabel = new LabelBase();
         this.descriptionLabel.htmlText = this.descriptionText;
         this.descriptionLabel.wordWrap = true;
         addChild(this.descriptionLabel);
      }
      
      public function render(_arg_1:int) : void
      {
         this.headerLabel.width = _arg_1;
         this.descriptionLabel.width = _arg_1;
         this.descriptionLabel.y = this.headerLabel.y + this.headerLabel.height;
      }
   }
}

