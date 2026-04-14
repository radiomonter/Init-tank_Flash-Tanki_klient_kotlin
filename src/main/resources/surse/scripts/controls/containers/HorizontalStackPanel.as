package controls.containers
{
   import flash.display.DisplayObject;
   
   public class HorizontalStackPanel extends StackPanel
   {
      
      public function HorizontalStackPanel()
      {
         super();
      }
      
      override protected function lagez(_arg_1:DisplayObject) : void
      {
         var _local_2:int = 0;
         if(items.length < 2)
         {
            height = _arg_1.y + int(_arg_1.height);
            width = _arg_1.x + wotycat(_arg_1);
            return;
         }
         var _local_3:DisplayObject = items[items.length - 2];
         var _local_4:int = wotycat(_local_3);
         var _local_5:int = wotycat(_arg_1);
         _local_2 = _arg_1.x;
         _arg_1.x = _local_3.x + _local_4 + lokiko() + _local_2;
         height = Math.max(int(height),_arg_1.y + int(_arg_1.height));
         width = _local_3.x + _local_4 + lokiko() + _local_2 + _local_5;
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
            height = this.hirapid();
            width = items[items.length - 1].x - wotycat(items[items.length - 1]);
            return;
         }
         var _local_3:int = items[_arg_1].x - _arg_2.x;
         var _local_4:int = _arg_1;
         while(_local_4 < items.length)
         {
            items[_local_4].x -= _local_3;
            _local_4++;
         }
         width = items[items.length - 1].x + wotycat(items[items.length - 1]);
         height = this.hirapid();
      }
      
      private function hirapid() : int
      {
         var _local_1:DisplayObject = null;
         var _local_2:int = 0;
         for each(_local_1 in items)
         {
            _local_2 = Math.max(_local_2,_local_1.y + _local_1.height);
         }
         return _local_2;
      }
   }
}

