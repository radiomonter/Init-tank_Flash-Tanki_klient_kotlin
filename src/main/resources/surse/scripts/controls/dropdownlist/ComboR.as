package controls.dropdownlist
{
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import forms.ranks.SmallRankIcon;
   
   public class ComboR extends ComboBoxRenderer
   {
      
      public function ComboR()
      {
         super();
      }
      
      override protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_3:LabelBase = null;
         var _local_4:SmallRankIcon = null;
         var _local_2:Sprite = new Sprite();
         _local_3 = new LabelBase();
         _local_3.autoSize = TextFieldAutoSize.NONE;
         _local_3.color = 16777215;
         _local_3.alpha = _arg_1.rang > 0 ? 0.5 : 1;
         _local_3.text = _arg_1.gameName;
         _local_3.height = 20;
         _local_3.width = _width - 20;
         _local_3.y = 0;
         if(_arg_1.rang > 0)
         {
            _local_4 = new SmallRankIcon(_arg_1.rang);
            _local_4.x = -2;
            _local_4.y = 2;
            _local_2.addChild(_local_4);
            _local_3.x = 12;
         }
         else
         {
            _local_3.x = -3;
         }
         _local_2.addChild(_local_3);
         return _local_2;
      }
   }
}

