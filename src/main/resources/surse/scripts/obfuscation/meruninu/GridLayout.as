package obfuscation.meruninu
{
   import flash.display.DisplayObject;
   
   public class GridLayout
   {
      
      private var topX:int;
      
      private var topY:int;
      
      private var columnWidth:int;
      
      private var rowHeight:int;
      
      private var fovazihe:int;
      
      public function GridLayout(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int)
      {
         super();
         this.topX = _arg_1;
         this.topY = _arg_2;
         this.columnWidth = _arg_3;
         this.rowHeight = _arg_4;
      }
      
      public function layout(_arg_1:Array) : int
      {
         var _local_2:int = 0;
         var _local_3:Array = null;
         var _local_4:int = 0;
         var _local_5:DisplayObject = null;
         var _local_6:int = 0;
         while(_local_6 < _arg_1.length)
         {
            _local_3 = _arg_1[_local_6];
            _local_4 = 0;
            while(_local_4 < _local_3.length)
            {
               if(_local_3[_local_4] != null)
               {
                  _local_5 = _local_3[_local_4];
                  _local_5.x = this.topX + _local_4 * this.columnWidth;
                  _local_5.y = this.topY + _local_6 * this.rowHeight + this.fovazihe * _local_6;
                  _local_2 = _local_5.y + _local_5.height;
               }
               _local_4++;
            }
            _local_6++;
         }
         return _local_2;
      }
      
      public function veqyl() : int
      {
         return this.fovazihe;
      }
      
      public function tuwifovyg(_arg_1:int) : void
      {
         this.fovazihe = _arg_1;
      }
   }
}

