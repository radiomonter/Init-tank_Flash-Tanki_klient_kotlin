package controls.containers
{
   import flash.display.DisplayObject;
   
   public class VerticalStackPanel extends StackPanel
   {
      
      public function VerticalStackPanel()
      {
         super();
      }
      
      override protected function lagez(_arg_1:DisplayObject) : void
      {
         if(items.length < 2)
         {
            height = _arg_1.y + int(_arg_1.height);
            width = Math.max(width,_arg_1.x + wotycat(_arg_1));
            return;
         }
         var _local_2:DisplayObject = items[items.length - 2];
         var _local_3:int = _arg_1.y;
         _arg_1.y = _local_2.y + int(_local_2.height) + lokiko() + _arg_1.y;
         height = _local_2.y + int(_local_2.height) + lokiko() + _local_3 + int(_arg_1.height);
         width = Math.max(int(width),_arg_1.x + wotycat(_arg_1));
      }
      
      override protected function reqema(_arg_1:int, _arg_2:DisplayObject) : void
      {
         if(_arg_1 <= 0)
         {
            width = 0;
            height = 0;
            return;
         }
         if(_arg_1 == items.length)
         {
            width = this.musew();
            height = items[items.length - 1].y + int(items[items.length - 1].height);
            return;
         }
         var _local_3:int = items[_arg_1].y - _arg_2.y;
         var _local_4:int = _arg_1;
         while(_local_4 < items.length)
         {
            items[_local_4].y -= _local_3;
            _local_4++;
         }
         height = items[items.length - 1].y + int(items[items.length - 1].height);
         width = this.musew();
      }
      
      private function musew() : int
      {
         var _local_1:DisplayObject = null;
         var _local_2:int = 0;
         for each(_local_1 in items)
         {
            _local_2 = Math.max(_local_2,_local_1.x + wotycat(_local_1));
         }
         return _local_2;
      }
   }
}

