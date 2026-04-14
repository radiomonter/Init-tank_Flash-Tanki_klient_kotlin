package alternativa.tanks.gui
{
   import controls.base.LabelBase;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   
   public class ModTable extends Sprite
   {
      
      private static const upgradeSelectionLeftClass:Class = ModTable_upgradeSelectionLeftClass;
      
      private static const upgradeSelectionCenterClass:Class = ModTable_upgradeSelectionCenterClass;
      
      public const vSpace:int = 0;
      
      private var _maxCostWidth:int;
      
      public var constWidth:int;
      
      public var rows:Vector.<ModInfoRow>;
      
      private var selection:Shape;
      
      private var selectedRowIndex:int = -1;
      
      private var _width:int;
      
      public function ModTable(_arg_1:int)
      {
         var _local_2:ModInfoRow = null;
         var _local_3:int = 0;
         this.rows = new Vector.<ModInfoRow>();
         _local_2 = null;
         super();
         this._width = _arg_1;
         this.selection = new Shape();
         addChild(this.selection);
         this.selection.x = 3;
         while(_local_3 < 4)
         {
            _local_2 = new ModInfoRow(_local_3,this._width);
            addChild(_local_2);
            _local_2.y = (_local_2.h + this.vSpace) * _local_3;
            this.rows.push(_local_2);
            _local_3++;
         }
         this.resizeSelection(this._width);
      }
      
      public function select(_arg_1:int) : void
      {
         var _local_2:ModInfoRow = null;
         if(this.selectedRowIndex != -1)
         {
            _local_2 = this.rows[this.selectedRowIndex];
            _local_2.unselect();
         }
         this.selectedRowIndex = _arg_1;
         this.selection.y = (ModInfoRow(this.rows[0]).h + this.vSpace) * _arg_1;
         _local_2 = this.rows[this.selectedRowIndex];
         _local_2.select();
      }
      
      private function resizeSelection(_arg_1:int) : void
      {
         var _local_2:int = _arg_1 - 6;
         var _local_3:BitmapData = new upgradeSelectionLeftClass().bitmapData;
         this.selection.graphics.clear();
         this.selection.graphics.beginBitmapFill(_local_3);
         this.selection.graphics.drawRect(0,0,_local_3.width,_local_3.height);
         var _local_4:BitmapData = new upgradeSelectionCenterClass().bitmapData;
         this.selection.graphics.beginBitmapFill(_local_4);
         this.selection.graphics.drawRect(_local_3.width,0,_local_2 - _local_3.width * 2,_local_4.height);
         var _local_5:Matrix = new Matrix(-1,0,0,1,_local_2,0);
         this.selection.graphics.beginBitmapFill(_local_3,_local_5);
         this.selection.graphics.drawRect(_local_2 - _local_3.width,0,_local_3.width,_local_3.height);
         this.selection.graphics.endFill();
      }
      
      public function correctNonintegralValues() : void
      {
         var _local_1:int = 0;
         var _local_2:LabelBase = null;
         var _local_3:int = 0;
         var _local_7:int = 0;
         var _local_4:Array = new Array();
         var _local_5:ModInfoRow = this.rows[0];
         var _local_6:int = int(_local_5.labels.length);
         while(_local_7 < 4)
         {
            _local_5 = this.rows[_local_7] as ModInfoRow;
            _local_1 = 0;
            while(_local_1 < _local_6)
            {
               _local_2 = _local_5.labels[_local_1] as LabelBase;
               if(_local_2.text.indexOf(".") != -1)
               {
                  _local_4.push(_local_1);
               }
               _local_1++;
            }
            _local_7++;
         }
         _local_7 = 0;
         while(_local_7 < 4)
         {
            _local_5 = this.rows[_local_7];
            _local_1 = 0;
            while(_local_1 < _local_4.length)
            {
               _local_3 = int(_local_4[_local_1]);
               _local_2 = _local_5.labels[_local_3] as LabelBase;
               if(_local_2.text.indexOf(".") == -1)
               {
                  _local_2.text += ".0";
               }
               _local_1++;
            }
            _local_7++;
         }
      }
      
      public function set maxCostWidth(_arg_1:int) : void
      {
         var _local_3:int = 0;
         this._maxCostWidth = _arg_1;
         var _local_2:ModInfoRow = this.rows[0];
         this.constWidth = _local_2.upgradeIndicator.width + _local_2.rankIcon.width + 3 + _local_2.crystalIcon.width + this._maxCostWidth + _local_2.hSpace * 3;
         while(_local_3 < 4)
         {
            _local_2 = this.rows[_local_3] as ModInfoRow;
            _local_2.costWidth = this._maxCostWidth;
            _local_3++;
         }
      }
   }
}

