package controls.dropdownlist
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   
   public class AccountsRenderer extends ComboR
   {
      
      private static var overStyleClass:Class = AccountsRenderer_overStyleClass;
      
      private static var overStyleBitmapData:BitmapData = new overStyleClass().bitmapData;
      
      public function AccountsRenderer()
      {
         super();
      }
      
      override protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_3:LabelBase = null;
         var _local_2:Sprite = null;
         _local_2 = new Sprite();
         _local_3 = new LabelBase();
         _local_3.autoSize = TextFieldAutoSize.NONE;
         _local_3.color = 16777215;
         _local_3.alpha = _arg_1.rang > 0 ? 0.5 : 1;
         _local_3.text = _arg_1.gameName;
         _local_3.height = AccountsList.ROW_HEIGHT;
         _local_3.width = _width - 20;
         _local_3.x -= 5;
         _local_2.addChild(_local_3);
         var _local_4:DeleteIndicator = new DeleteIndicator(_arg_1);
         _local_4.x = _local_2.width - _local_4.width + 5;
         _local_2.addChild(_local_4);
         tabEnabled = false;
         mouseEnabled = false;
         mouseChildren = true;
         return _local_2;
      }
      
      override public function set data(_arg_1:Object) : void
      {
         var _local_2:Bitmap = new Bitmap(new BitmapData(1,1,true,0));
         var _local_3:Shape = new Shape();
         _local_3.graphics.beginBitmapFill(overStyleBitmapData);
         _local_3.graphics.drawRect(0,0,1,18);
         _local_3.graphics.endFill();
         _data = _arg_1;
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_3);
         setStyle("overSkin",_local_3);
         setStyle("selectedUpSkin",_local_2);
         setStyle("selectedOverSkin",_local_3);
         setStyle("selectedDownSkin",_local_3);
      }
   }
}

