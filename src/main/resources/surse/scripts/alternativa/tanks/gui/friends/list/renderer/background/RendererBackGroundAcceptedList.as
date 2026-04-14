package alternativa.tanks.gui.friends.list.renderer.background
{
   import alternativa.tanks.gui.friends.list.AcceptedList;
   import alternativa.tanks.gui.friends.list.renderer.HeaderAcceptedList;
   import controls.ButtonState;
   import flash.display.Sprite;
   
   public class RendererBackGroundAcceptedList extends Sprite
   {
      
      protected var tabs:Vector.<Number>;
      
      protected var _width:int = 100;
      
      public function RendererBackGroundAcceptedList(_arg_1:Boolean, _arg_2:Boolean = false)
      {
         var _local_3:ButtonState = null;
         var _local_5:int = 0;
         this.tabs = new Vector.<Number>();
         super();
         var _local_4:int = int(HeaderAcceptedList.HEADERS.length);
         while(_local_5 < _local_4)
         {
            if(_arg_1)
            {
               if(_arg_2)
               {
                  _local_3 = new FriendCellSelected();
               }
               else
               {
                  _local_3 = new FriendCellNormal();
               }
            }
            else if(_arg_2)
            {
               _local_3 = new FriendOfflineCellSelected();
            }
            else
            {
               _local_3 = new FriendOfflineCellNormal();
            }
            addChild(_local_3);
            _local_5++;
         }
         this.resize();
      }
      
      protected function resize() : void
      {
         var _local_1:ButtonState = null;
         var _local_3:int = 0;
         _local_1 = null;
         if(AcceptedList.SCROLL_ON)
         {
            this.tabs = Vector.<Number>([0,this._width - 224,this._width - 1]);
         }
         else
         {
            this.tabs = Vector.<Number>([0,this._width - 233,this._width - 1]);
         }
         var _local_2:int = int(HeaderAcceptedList.HEADERS.length);
         _local_3 = 0;
         while(_local_3 < _local_2)
         {
            _local_1 = getChildAt(_local_3) as ButtonState;
            _local_1.width = this.tabs[_local_3 + 1] - this.tabs[_local_3] - 2;
            _local_1.height = 18;
            _local_1.x = this.tabs[_local_3];
            _local_3++;
         }
         graphics.clear();
         graphics.beginFill(16711680,0);
         graphics.drawRect(0,0,this._width - 1,18);
         graphics.endFill();
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.resize();
      }
   }
}

