package alternativa.tanks.gui.friends.list.renderer.background
{
   import controls.ButtonState;
   import flash.display.Sprite;
   
   public class RendererBackGroundOutgoingList extends Sprite
   {
      
      private var _width:int = 100;
      
      public function RendererBackGroundOutgoingList(_arg_1:Boolean)
      {
         var _local_2:ButtonState = null;
         super();
         if(_arg_1)
         {
            _local_2 = new FriendCellSelected();
         }
         else
         {
            _local_2 = new FriendCellNormal();
         }
         addChild(_local_2);
         this.resize();
      }
      
      protected function resize() : void
      {
         var _local_1:ButtonState = null;
         _local_1 = getChildAt(0) as ButtonState;
         _local_1.width = this._width - 3;
         _local_1.height = 18;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this._width = Math.floor(_arg_1);
         this.resize();
      }
   }
}

