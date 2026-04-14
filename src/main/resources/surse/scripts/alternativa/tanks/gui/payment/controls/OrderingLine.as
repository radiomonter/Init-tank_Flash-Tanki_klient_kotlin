package alternativa.tanks.gui.payment.controls
{
   import alternativa.tanks.gui.icons.CrystalIcon;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class OrderingLine extends Sprite
   {
      
      protected var _width:Number;
      
      protected var descriptionLabel:LabelBase;
      
      protected var crystalsLabel:LabelBase;
      
      protected var crystalsIcon:Bitmap;
      
      public function OrderingLine(_arg_1:String, _arg_2:int, showIcon:Boolean = true)
      {
         super();
         this.descriptionLabel = this.createLabel(_arg_1);
         addChild(this.descriptionLabel);
         this.crystalsLabel = this.createLabel(_arg_2.toString());
         addChild(this.crystalsLabel);
         if(showIcon)
         {
            this.crystalsIcon = CrystalIcon.createSmallInstance();
            this.crystalsIcon.y = 4;
            addChild(this.crystalsIcon);
         }
      }
      
      private function createLabel(_arg_1:String) : LabelBase
      {
         var _local_2:LabelBase = null;
         _local_2 = new LabelBase();
         _local_2.autoSize = TextFieldAutoSize.LEFT;
         _local_2.wordWrap = false;
         _local_2.multiline = true;
         _local_2.align = TextFormatAlign.LEFT;
         _local_2.text = _arg_1;
         _local_2.size = 12;
         _local_2.color = 5898034;
         return _local_2;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = _arg_1;
         var _local_2:Number = this.crystalsLabel.width;
         if(Boolean(this.crystalsIcon))
         {
            _local_2 += this.crystalsIcon.width;
         }
         this.crystalsLabel.x = this._width - _local_2;
         if(Boolean(this.crystalsIcon))
         {
            this.crystalsIcon.x = this.crystalsLabel.x + this.crystalsLabel.width;
         }
      }
   }
}

