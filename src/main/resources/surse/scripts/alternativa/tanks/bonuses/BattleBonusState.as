package alternativa.tanks.bonuses
{
   public class BattleBonusState
   {
      
      public var pivotZ:Number = 0;
      
      public var angleX:Number = 0;
      
      public var angleZ:Number = 0;
      
      public function BattleBonusState()
      {
         super();
      }
      
      public function interpolate(_arg_1:BattleBonusState, _arg_2:BattleBonusState, _arg_3:Number) : void
      {
         this.pivotZ = _arg_1.pivotZ + _arg_3 * (_arg_2.pivotZ - _arg_1.pivotZ);
         this.angleX = _arg_1.angleX + _arg_3 * (_arg_2.angleX - _arg_1.angleX);
         this.angleZ = _arg_1.angleZ + _arg_3 * (_arg_2.angleZ - _arg_1.angleZ);
      }
      
      public function copy(_arg_1:BattleBonusState) : void
      {
         this.pivotZ = _arg_1.pivotZ;
         this.angleX = _arg_1.angleX;
         this.angleZ = _arg_1.angleZ;
      }
   }
}

