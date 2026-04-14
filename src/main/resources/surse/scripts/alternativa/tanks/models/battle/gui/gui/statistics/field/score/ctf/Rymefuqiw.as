package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class Rymefuqiw
   {
      
      public var values:Vector.<Number>;
      
      private var maxValue:Number;
      
      private var minValue:Number;
      
      private var laby:Vector.<int>;
      
      private var mazobu:Vector.<Number>;
      
      private var rocecijeg:int;
      
      private var speeds:Vector.<Number>;
      
      private var fubiketab:Vector.<int>;
      
      private var pacatywak:Number;
      
      private var sukawilyg:int = 0;
      
      public function Rymefuqiw(_arg_1:Number, _arg_2:Number, _arg_3:Vector.<int>, _arg_4:Vector.<Number>)
      {
         super();
         this.minValue = _arg_1;
         this.maxValue = _arg_2;
         this.laby = _arg_3;
         this.mazobu = _arg_4;
         this.pacatywak = _arg_2 - _arg_1;
         this.rocecijeg = _arg_3.length;
         this.speeds = new Vector.<Number>(this.rocecijeg);
         this.fubiketab = new Vector.<int>(this.rocecijeg);
         this.values = new Vector.<Number>(this.rocecijeg);
      }
      
      public function start(_arg_1:int) : void
      {
         if(this.sukawilyg == 0)
         {
            this.init(_arg_1);
         }
         ++this.sukawilyg;
      }
      
      public function stop() : void
      {
         --this.sukawilyg;
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = 0;
         if(this.sukawilyg <= 0)
         {
            return;
         }
         while(_local_3 < this.rocecijeg)
         {
            this.values[_local_3] += this.speeds[_local_3] * _arg_2;
            if(this.values[_local_3] > this.maxValue)
            {
               this.values[_local_3] = this.maxValue;
            }
            if(this.values[_local_3] < this.minValue)
            {
               this.values[_local_3] = this.minValue;
            }
            if(_arg_1 >= this.fubiketab[_local_3])
            {
               this.fubiketab[_local_3] += this.laby[_local_3];
               if(this.speeds[_local_3] < 0)
               {
                  this.speeds[_local_3] = this.vuq(1,this.mazobu[_local_3],this.laby[_local_3]);
               }
               else
               {
                  this.speeds[_local_3] = this.vuq(-1,this.mazobu[_local_3],this.laby[_local_3]);
               }
            }
            _local_3++;
         }
      }
      
      private function init(_arg_1:int) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.rocecijeg)
         {
            this.speeds[_local_2] = this.vuq(-1,this.mazobu[_local_2],this.laby[_local_2]);
            this.values[_local_2] = this.maxValue;
            this.fubiketab[_local_2] = _arg_1 + this.laby[_local_2];
            _local_2++;
         }
      }
      
      private function vuq(_arg_1:Number, _arg_2:Number, _arg_3:int) : Number
      {
         return _arg_1 * _arg_2 * this.pacatywak / _arg_3;
      }
   }
}

