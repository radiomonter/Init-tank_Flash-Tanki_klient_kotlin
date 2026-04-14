package alternativa.tanks.gui
{
   import alternativa.tanks.gui.icons.CrystalIcon;
   import controls.Money;
   import controls.labels.MouseDisabledLabel;
   import flash.display.Bitmap;
   import flash.display.Graphics;
   import flash.display.Shape;
   import flash.display.Sprite;
   
   public class CrystalLabel extends Sprite
   {
      
      private var crystalIcon:Bitmap;
      
      private var label:MouseDisabledLabel;
      
      private var color:uint = 16777215;
      
      private var strikeColor:uint = 11645361;
      
      private var line:Shape = new Shape();
      
      private var isStrike:Boolean = false;
      
      public function CrystalLabel(_arg_1:int = 0)
      {
         super();
         mouseEnabled = false;
         this.label = new MouseDisabledLabel();
         this.crystalIcon = CrystalIcon.createSmallInstance();
         addChild(this.label);
         addChild(this.crystalIcon);
         this.crystalIcon.y = 4;
         this.setCost(_arg_1);
      }
      
      public function setText(_arg_1:String) : void
      {
         this.label.text = _arg_1;
         this.crystalIcon.x = this.label.x + this.label.textWidth + 5;
      }
      
      public function setCost(_arg_1:int) : void
      {
         this.label.text = Money.numToString(_arg_1,false);
         this.crystalIcon.x = this.label.x + this.label.textWidth + 5;
         this.setStrike(false);
      }
      
      public function setColor(_arg_1:int) : void
      {
         this.color = _arg_1;
         if(!this.isStrike)
         {
            this.label.textColor = _arg_1;
         }
      }
      
      public function setSharpness(_arg_1:int) : void
      {
         this.label.sharpness = _arg_1;
      }
      
      public function setThickness(_arg_1:int) : void
      {
         this.label.thickness = _arg_1;
      }
      
      public function setStrikeColor(_arg_1:int) : void
      {
         this.strikeColor = _arg_1;
      }
      
      public function setStrike(_arg_1:Boolean) : void
      {
         var _local_2:Graphics = null;
         var _local_3:int = 0;
         this.isStrike = _arg_1;
         if(_arg_1)
         {
            this.label.textColor = this.strikeColor;
            _local_2 = this.line.graphics;
            _local_2.clear();
            _local_2.lineStyle(1,this.strikeColor);
            _local_3 = int(this.label.y + this.label.height * 0.5) + 1;
            _local_2.moveTo(0,_local_3);
            _local_2.lineTo(0 + width + 2,_local_3);
            if(!contains(this.line))
            {
               addChild(this.line);
            }
         }
         else
         {
            this.label.textColor = this.color;
            if(contains(this.line))
            {
               removeChild(this.line);
            }
         }
      }
   }
}

