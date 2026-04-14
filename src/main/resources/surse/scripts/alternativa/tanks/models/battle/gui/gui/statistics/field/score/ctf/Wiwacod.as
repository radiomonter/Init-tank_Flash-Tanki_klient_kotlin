package alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf
{
   public class Wiwacod
   {
      
      public var pifebi:uint;
      
      private var diq:Number;
      
      private var niqylihyv:Number;
      
      private var zekis:Number;
      
      public function Wiwacod(_arg_1:uint, _arg_2:uint)
      {
         super();
         this.pifebi = _arg_1;
         this.diq = (_arg_2 >> 16 & 0xFF) - (_arg_1 >> 16 & 0xFF);
         this.niqylihyv = (_arg_2 >> 8 & 0xFF) - (_arg_1 >> 8 & 0xFF);
         this.zekis = (_arg_2 & 0xFF) - (_arg_1 & 0xFF);
      }
      
      public function interpolate(_arg_1:Number) : uint
      {
         var _local_2:int = (this.pifebi >> 16 & 0xFF) + _arg_1 * this.diq;
         var _local_3:int = (this.pifebi >> 8 & 0xFF) + _arg_1 * this.niqylihyv;
         var _local_4:int = (this.pifebi & 0xFF) + _arg_1 * this.zekis;
         return _local_2 << 16 | _local_3 << 8 | _local_4;
      }
   }
}

