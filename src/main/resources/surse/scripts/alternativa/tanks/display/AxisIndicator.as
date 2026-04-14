package alternativa.tanks.display
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import flash.display.Shape;
   
   use namespace alternativa3d;
   
   public class AxisIndicator extends Shape
   {
      
      private var _size:int;
      
      private var axis1:Vector.<Number> = Vector.<Number>([0,0,0,0,0,0]);
      
      public function AxisIndicator(_arg_1:int)
      {
         super();
         this._size = _arg_1;
      }
      
      public function update(_arg_1:Camera3D) : void
      {
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_2:int = 0;
         graphics.clear();
         _arg_1.composeMatrix();
         this.axis1[0] = _arg_1.ma;
         this.axis1[1] = _arg_1.mb;
         this.axis1[2] = _arg_1.me;
         this.axis1[3] = _arg_1.mf;
         this.axis1[4] = _arg_1.mi;
         this.axis1[5] = _arg_1.mj;
         var _local_3:int = 16;
         while(_local_2 < 6)
         {
            _local_4 = this.axis1[_local_2] + 1;
            _local_5 = this.axis1[int(_local_2 + 1)] + 1;
            graphics.lineStyle(0,255 << _local_3);
            graphics.moveTo(this._size,this._size);
            graphics.lineTo(this._size * _local_4,this._size * _local_5);
            _local_2 += 2;
            _local_3 -= 8;
         }
      }
      
      public function get size() : int
      {
         return this._size;
      }
   }
}

