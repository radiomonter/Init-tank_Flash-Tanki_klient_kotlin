package forms.contextmenu
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   
   public class BattleInviteContextMenuLabel extends ContextMenuLabel
   {
      
      private static var battleInviteClass:Class = BattleInviteContextMenuLabel_battleInviteClass;
      
      public static var battleInviteBitmapData:BitmapData = Bitmap(new battleInviteClass()).bitmapData;
      
      private var _icon:Bitmap;
      
      public function BattleInviteContextMenuLabel()
      {
         super();
      }
      
      override protected function init() : void
      {
         this._icon = new Bitmap(battleInviteBitmapData);
         addChild(this._icon);
         this._icon.y = 4;
         super.init();
      }
      
      override public function set locked(_arg_1:Boolean) : void
      {
         super.locked = _arg_1;
         if(_arg_1)
         {
            this._icon.x = 0;
            this._icon.visible = false;
         }
         else
         {
            this._icon.x = _label.width + 4;
            this._icon.visible = true;
         }
      }
      
      override public function get width() : Number
      {
         var _local_1:Number = NaN;
         if(locked)
         {
            _local_1 = _label.width;
         }
         else
         {
            _local_1 = this._icon.x + this._icon.width + 1;
         }
         return _local_1;
      }
   }
}

