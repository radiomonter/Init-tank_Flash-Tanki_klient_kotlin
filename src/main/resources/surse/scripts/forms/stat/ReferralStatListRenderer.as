package forms.stat
{
   import controls.Money;
   import controls.base.LabelBase;
   import controls.rangicons.RangIconSmall;
   import controls.statassets.ReferalStatLineBackgroundNormal;
   import controls.statassets.ReferalStatLineBackgroundSelected;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class ReferralStatListRenderer extends StatListRenderer
   {
      
      public function ReferralStatListRenderer()
      {
         super();
      }
      
      override protected function myIcon(_arg_1:Object) : Sprite
      {
         var _local_5:LabelBase = null;
         var _local_2:Sprite = null;
         var _local_4:LabelBase = null;
         _local_2 = new Sprite();
         var _local_3:RangIconSmall = new RangIconSmall(_arg_1.rank);
         _local_4 = new LabelBase();
         if(_arg_1.rank > 0)
         {
            _local_3.y = 3;
            _local_3.x = 0;
            _local_2.addChild(_local_3);
         }
         _local_4.autoSize = TextFieldAutoSize.NONE;
         _local_4.height = 18;
         _local_4.text = _arg_1.callsign;
         _local_4.x = 12;
         _local_4.width = _width - 72;
         _local_2.addChild(_local_4);
         _local_5 = new LabelBase();
         _local_5.autoSize = TextFieldAutoSize.NONE;
         _local_5.align = TextFormatAlign.RIGHT;
         _local_5.width = 90;
         _local_5.x = _width - 100;
         _local_5.text = _arg_1.income > -1 ? Money.numToString(_arg_1.income,false) : "null";
         _local_2.addChild(_local_5);
         return _local_2;
      }
      
      override public function set data(_arg_1:Object) : void
      {
         _data = _arg_1;
         var _local_2:DisplayObject = new ReferalStatLineBackgroundNormal();
         var _local_3:DisplayObject = new ReferalStatLineBackgroundSelected();
         nicon = this.myIcon(_data);
         setStyle("upSkin",_local_2);
         setStyle("downSkin",_local_2);
         setStyle("overSkin",_local_2);
         setStyle("selectedUpSkin",_local_3);
         setStyle("selectedOverSkin",_local_3);
         setStyle("selectedDownSkin",_local_3);
      }
   }
}

