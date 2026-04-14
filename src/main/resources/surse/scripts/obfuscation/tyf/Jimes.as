package obfuscation.tyf
{
   import assets.IconAlarm;
   import controls.Label;
   import controls.statassets.BlackRoundRect;
   import flash.text.TextFieldAutoSize;
   
   public class Jimes extends BlackRoundRect
   {
      
      private static const gyvoro:String = "{time}";
      
      private var pytarug:Label;
      
      private var sucodaran:String;
      
      private var _seconds:int;
      
      public function Jimes(_arg_1:String, _arg_2:String, _arg_3:String)
      {
         var _local_4:Label = null;
         var _local_8:int = 0;
         var _local_10:int = 0;
         var _local_11:Label = null;
         _local_4 = null;
         super();
         this.sucodaran = _arg_3;
         var _local_5:int = 33;
         var _local_6:int = 33;
         var _local_7:int = 5;
         _local_8 = 16;
         var _local_9:IconAlarm = new IconAlarm();
         addChild(_local_9);
         _local_9.y = _local_5;
         _local_10 = _local_9.y + _local_9.height + 2 * _local_7;
         _local_4 = new Label();
         _local_4.size = _local_8;
         _local_4.text = _arg_1;
         _local_4.y = _local_10;
         addChild(_local_4);
         width = _local_4.textWidth;
         _local_10 += _local_4.height + _local_7;
         _local_11 = new Label();
         _local_11.size = _local_8;
         _local_11.text = _arg_2;
         _local_11.y = _local_10;
         addChild(_local_11);
         if(width < _local_11.textWidth)
         {
            width = _local_11.textWidth;
         }
         _local_10 += _local_11.height + _local_7;
         this.pytarug = new Label();
         this.pytarug.size = _local_8;
         this.pytarug.autoSize = TextFieldAutoSize.LEFT;
         this.pytarug.text = _arg_3 + " 99:99";
         this.pytarug.y = _local_10;
         addChild(this.pytarug);
         if(width < this.pytarug.textWidth)
         {
            width = this.pytarug.textWidth;
         }
         width += 2 * _local_6;
         _local_9.x = width - _local_9.width >> 1;
         _local_4.x = width - _local_4.width >> 1;
         _local_11.x = width - _local_11.width >> 1;
         height = _local_10 + this.pytarug.height + _local_5 - 5;
      }
      
      public function set seconds(_arg_1:int) : void
      {
         if(this._seconds == _arg_1)
         {
            return;
         }
         this._seconds = _arg_1;
         var _local_2:int = int(this._seconds / 60);
         this._seconds -= _local_2 * 60;
         var _local_3:String = this._seconds < 10 ? "0" + this._seconds : this._seconds.toString();
         this.pytarug.text = this.sucodaran.replace(gyvoro,_local_2 + ":" + _local_3);
         this.pytarug.x = width - this.pytarug.width >> 1;
      }
   }
}

