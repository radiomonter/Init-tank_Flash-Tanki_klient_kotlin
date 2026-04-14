package alternativa.tanks.model.shop.items.base
{
   import alternativa.tanks.model.shop.ItemBase;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class ButtonItemBase extends ItemBase
   {
      
      private static const DOWN_PIXELS:int = 1;
      
      protected var normalState:Bitmap;
      
      protected var overState:Bitmap;
      
      protected var previousY:int;
      
      public function ButtonItemBase(_arg_1:ButtonItemSkin)
      {
         super();
         this.initAndAppendSkin(_arg_1);
         this.init();
      }
      
      private function initAndAppendSkin(_arg_1:ButtonItemSkin) : void
      {
         this.normalState = new Bitmap(_arg_1.normalState);
         this.overState = new Bitmap(_arg_1.overState);
         addChildAt(this.overState,0);
         addChildAt(this.normalState,0);
         this.overState.visible = false;
      }
      
      protected function init() : void
      {
         buttonMode = true;
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      public function setSkin(_arg_1:ButtonItemSkin) : void
      {
         removeChild(this.normalState);
         removeChild(this.overState);
         this.initAndAppendSkin(_arg_1);
      }
      
      private function onMouseEvent(_arg_1:MouseEvent) : void
      {
         this.overState.visible = _arg_1.type == MouseEvent.MOUSE_OVER;
         this.normalState.visible = !this.overState.visible;
         switch(_arg_1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.previousY = y;
               return;
            case MouseEvent.MOUSE_OUT:
               y = this.previousY;
               return;
            case MouseEvent.MOUSE_UP:
               y = this.previousY;
               return;
            case MouseEvent.MOUSE_DOWN:
               y = this.previousY + DOWN_PIXELS;
         }
      }
      
      override public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
   }
}

