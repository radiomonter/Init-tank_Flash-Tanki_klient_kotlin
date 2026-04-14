package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   
   public class ItemPropertyIcon extends Sprite
   {
      
      private const space:int = 2;
      
      public var bmp:Bitmap;
      
      private var label:LabelBase;
      
      public function ItemPropertyIcon(_arg_1:BitmapData)
      {
         super();
         var _local_2:BitmapData = ItemInfoPanelBitmaps.backIcon;
         var _local_3:BitmapData = new BitmapData(_local_2.width,_local_2.height,true,0);
         _local_3.draw(_local_2);
         _local_3.draw(_arg_1,new Matrix(1,0,0,1,1,1));
         this.bmp = new Bitmap(_local_3);
         addChild(this.bmp);
         this.label = new MouseDisabledLabel();
         this.label.size = 10;
         addChild(this.label);
         this.label.color = 59156;
         this.label.align = TextFormatAlign.CENTER;
         this.label.sharpness = -100;
         this.label.thickness = 100;
         this.posLabel();
         this.label.y = this.bmp.height + this.space;
      }
      
      public function setValue(_arg_1:String, _arg_2:uint) : void
      {
         this.label.text = _arg_1;
         this.label.color = _arg_2;
         this.posLabel();
      }
      
      public function getLabel() : DisplayObject
      {
         return this.label;
      }
      
      private function posLabel() : void
      {
         if(this.bmp.width > this.label.textWidth)
         {
            this.label.x = Math.round((this.bmp.width - this.label.textWidth) * 0.5) - 3;
         }
         else if(this.label.textWidth > this.bmp.width)
         {
            this.label.x = -Math.round((this.label.textWidth - this.bmp.width) * 0.5) - 3;
         }
         else
         {
            this.label.x = -3;
         }
      }
      
      public function removeValue() : void
      {
         this.label.text = "";
      }
   }
}

