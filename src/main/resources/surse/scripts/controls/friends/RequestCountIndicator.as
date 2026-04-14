package controls.friends
{
   import alternativa.osgi.service.display.IDisplay;
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.friend.IFriendInfoService;
   
   public class RequestCountIndicator extends Sprite
   {
      
      [Inject]
      public static var friendInfoService:IFriendInfoService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static var leftIconClass:Class = RequestCountIndicator_leftIconClass;
      
      private static var leftIconBitmapData:BitmapData = Bitmap(new leftIconClass()).bitmapData;
      
      private static var centerIconClass:Class = RequestCountIndicator_centerIconClass;
      
      private static var centerIconBitmapData:BitmapData = Bitmap(new centerIconClass()).bitmapData;
      
      private static var rightIconClass:Class = RequestCountIndicator_rightIconClass;
      
      private static var rightIconBitmapData:BitmapData = Bitmap(new rightIconClass()).bitmapData;
      
      private var _leftIcon:Bitmap;
      
      private var _centerIcon:Bitmap;
      
      private var _rightIcon:Bitmap;
      
      private var indicatorLabel:LabelBase;
      
      private var _currentCount:int = 0;
      
      private var _newCount:int = 0;
      
      public function RequestCountIndicator()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this._leftIcon = new Bitmap(leftIconBitmapData);
         addChild(this._leftIcon);
         this._centerIcon = new Bitmap(centerIconBitmapData);
         addChild(this._centerIcon);
         this._rightIcon = new Bitmap(rightIconBitmapData);
         addChild(this._rightIcon);
         this.indicatorLabel = new LabelBase();
         addChild(this.indicatorLabel);
         this.setRequestCount(this._currentCount,this._newCount);
         this.resize();
      }
      
      public function setRequestCount(_arg_1:int, _arg_2:int) : void
      {
         this._currentCount = _arg_1;
         this._newCount = _arg_2;
         this.visible = _arg_2 != 0;
         this.indicatorLabel.text = String(_arg_2);
         this.resize();
      }
      
      private function resize() : void
      {
         this._rightIcon.x = -5;
         this.indicatorLabel.x = -int(this.indicatorLabel.width) - 1;
         this._centerIcon.width = this.getCenterIconWidth();
         this._centerIcon.x = this._rightIcon.x - this._centerIcon.width;
         this._leftIcon.x = this._centerIcon.x - this._leftIcon.width;
      }
      
      private function getCenterIconWidth() : int
      {
         var _local_1:int = 0;
         var _local_2:int = this.indicatorLabel.text.length;
         if(_local_2 == 1)
         {
            _local_1 = 1;
         }
         else if(_local_2 > 1)
         {
            _local_1 = (_local_2 - 1) * 6;
         }
         return _local_1;
      }
      
      public function set currentCount(_arg_1:int) : void
      {
         this.setRequestCount(_arg_1,this._newCount);
      }
      
      public function set newCount(_arg_1:int) : void
      {
         this.setRequestCount(this._currentCount,_arg_1);
      }
   }
}

