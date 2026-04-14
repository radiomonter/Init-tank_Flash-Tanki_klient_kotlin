package controls.checkbox
{
   import controls.base.LabelBase;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class TankCheckBox extends Sprite
   {
      
      private static const hugegahim:Class = Voj;
      
      private static const tycu:BitmapData = Bitmap(new hugegahim()).bitmapData;
      
      private static const zacuvom:Class = Lepidyf;
      
      private static const jaqosi:BitmapData = Bitmap(new zacuvom()).bitmapData;
      
      private static const jaqad:Class = Hozo;
      
      private static const tulo:BitmapData = Bitmap(new jaqad()).bitmapData;
      
      private static const pyrerezev:Class = Kor;
      
      private static const sawylif:BitmapData = Bitmap(new pyrerezev()).bitmapData;
      
      private var jemad:Bitmap;
      
      private var rinojy:Bitmap;
      
      private var rubidyba:Bitmap;
      
      private var korut:Bitmap;
      
      private var suguv:Array;
      
      private var _checked:Boolean;
      
      private var pijuzemi:Boolean;
      
      private var _enabled:Boolean;
      
      public var pofefekub:LabelBase;
      
      public function TankCheckBox(_arg_1:BitmapData = null)
      {
         super();
         this.rinojy = new Bitmap(jaqosi);
         addChild(this.rinojy);
         this.rubidyba = new Bitmap(tulo);
         addChild(this.rubidyba);
         this.korut = new Bitmap(sawylif);
         addChild(this.korut);
         this.jemad = new Bitmap(_arg_1 != null ? _arg_1 : tycu);
         addChild(this.jemad);
         this.jemad.visible = false;
         this.suguv = [this.rinojy,this.rubidyba,this.korut];
         tabEnabled = false;
         this.vol(this.rinojy);
         this.enabled = true;
         this.pofefekub = new LabelBase();
         this.pofefekub.x = 29;
         this.pofefekub.y = 7;
         addChild(this.pofefekub);
      }
      
      private function vol(_arg_1:Bitmap) : void
      {
         var _local_2:Bitmap = null;
         for each(_local_2 in this.suguv)
         {
            _local_2.visible = false;
         }
         _arg_1.visible = true;
      }
      
      public function get checked() : Boolean
      {
         return this._checked;
      }
      
      public function quvevivi(_arg_1:Boolean) : void
      {
         if(this._checked != _arg_1)
         {
            this._checked = _arg_1;
            this.jemad.visible = this._checked;
         }
      }
      
      public function set checked(_arg_1:Boolean) : void
      {
         if(this._checked != _arg_1)
         {
            this.changeState();
         }
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(this._enabled != _arg_1)
         {
            this._enabled = _arg_1;
            if(this._enabled)
            {
               buttonMode = true;
               mouseEnabled = true;
               this.addListeners();
            }
            else
            {
               buttonMode = false;
               mouseEnabled = false;
               this.removeListeners();
            }
         }
      }
      
      public function set label(_arg_1:String) : void
      {
         this.pofefekub.text = _arg_1;
      }
      
      public function kus(_arg_1:int) : void
      {
         this.pofefekub.y += _arg_1;
      }
      
      private function addListeners() : void
      {
         addEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         addEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function removeListeners() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_OUT,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_DOWN,this.onMouseEvent);
         removeEventListener(MouseEvent.MOUSE_UP,this.onMouseEvent);
      }
      
      private function onMouseEvent(_arg_1:MouseEvent) : void
      {
         this.jemad.y = 0;
         switch(_arg_1.type)
         {
            case MouseEvent.MOUSE_OVER:
               this.vol(this.korut);
               return;
            case MouseEvent.MOUSE_OUT:
               this.pijuzemi = false;
               this.vol(this.rinojy);
               return;
            case MouseEvent.MOUSE_DOWN:
               if(this._checked)
               {
                  this.jemad.y = 2;
               }
               this.pijuzemi = true;
               this.vol(this.rubidyba);
               return;
            case MouseEvent.MOUSE_UP:
               this.vol(this.korut);
               if(this.pijuzemi)
               {
                  this.pijuzemi = false;
                  this.changeState();
               }
         }
      }
      
      private function changeState() : void
      {
         this._checked = !this._checked;
         this.jemad.visible = this._checked;
         dispatchEvent(new CheckBoxEvent(CheckBoxEvent.STATE_CHANGED));
      }
   }
}

