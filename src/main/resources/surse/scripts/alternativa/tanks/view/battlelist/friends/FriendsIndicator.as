package alternativa.tanks.view.battlelist.friends
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   
   public class FriendsIndicator extends Sprite
   {
      
      private static var friendsGreenClass:Class = FriendsIndicator_friendsGreenClass;
      
      private static var friendsGreenBitmapData:BitmapData = Bitmap(new friendsGreenClass()).bitmapData;
      
      private static var friendsGreenDarkClass:Class = FriendsIndicator_friendsGreenDarkClass;
      
      private static var friendsGreenDarkBitmapData:BitmapData = Bitmap(new friendsGreenDarkClass()).bitmapData;
      
      private static var friendsGreyClass:Class = FriendsIndicator_friendsGreyClass;
      
      private static var friendsGreyBitmapData:BitmapData = Bitmap(new friendsGreyClass()).bitmapData;
      
      private static var friendsGreyDarkClass:Class = FriendsIndicator_friendsGreyDarkClass;
      
      private static var friendsGreyDarkBitmapData:BitmapData = Bitmap(new friendsGreyDarkClass()).bitmapData;
      
      public function FriendsIndicator(_arg_1:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:uint)
      {
         super();
         this.init(_arg_1,_arg_2,_arg_3,_arg_4);
      }
      
      private function init(_arg_1:Boolean, _arg_2:Boolean, _arg_3:int, _arg_4:uint) : void
      {
         var _local_5:Bitmap = null;
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,18,16);
         graphics.endFill();
         if(_arg_2)
         {
            if(_arg_1)
            {
               _local_5 = new Bitmap(friendsGreenDarkBitmapData);
            }
            else
            {
               _local_5 = new Bitmap(friendsGreenBitmapData);
            }
         }
         else if(_arg_1)
         {
            _local_5 = new Bitmap(friendsGreyDarkBitmapData);
         }
         else
         {
            _local_5 = new Bitmap(friendsGreyBitmapData);
         }
         _local_5.y = 3;
         addChild(_local_5);
         var _local_6:LabelBase = new LabelBase();
         _local_6.text = String(_arg_3);
         _local_6.x = _local_5.width;
         _local_6.y = -1;
         _local_6.color = _arg_4;
         addChild(_local_6);
      }
   }
}

