package controls.base
{
   import base.DiscreteSprite;
   import controls.labels.MouseDisabledLabel;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.filters.DropShadowFilter;
   
   public class ThreeLineBigButton extends BigButtonBase
   {
      
      protected var infoContainer:Sprite = new DiscreteSprite();
      
      protected var captionLabel:MouseDisabledLabel = new MouseDisabledLabel();
      
      public function ThreeLineBigButton()
      {
         super();
         addChild(this.infoContainer);
         this.infoContainer.addChild(this.captionLabel);
         this.showInOneRow(this.captionLabel);
         this.captionLabel.size = 14;
         this.infoContainer.mouseEnabled = false;
         this.infoContainer.filters = [new DropShadowFilter(1,45,0,0.7,1,1,1)];
      }
      
      public function setText(_arg_1:String) : void
      {
         this.captionLabel.text = _arg_1;
         this.captionLabel.x = (_width - this.captionLabel.width) * 0.5;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         super.width = _arg_1;
         this.captionLabel.x = (_width - this.captionLabel.width) * 0.5;
      }
      
      protected function showInOneRow(_arg_1:DisplayObject) : void
      {
         _arg_1.y = 15;
      }
      
      protected function showInTwoRows(_arg_1:DisplayObject, _arg_2:DisplayObject) : void
      {
         _arg_1.y = 8;
         _arg_2.y = 25;
      }
      
      protected function showInThreeRows(_arg_1:DisplayObject, _arg_2:DisplayObject, _arg_3:DisplayObject) : void
      {
         _arg_1.y = 3;
         _arg_2.y = 16;
         _arg_3.y = 28;
      }
   }
}

