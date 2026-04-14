package alternativa.tanks.battle.objects.tank
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   
   public class Budukaby implements Qory
   {
      
      private static const position:Vector3 = new Vector3();
      
      private static const eulerAngles:Vector3 = new Vector3();
      
      private static const qylyhi:Matrix3 = new Matrix3();
      
      public var tank:Tank;
      
      public function Budukaby(_arg_1:Tank)
      {
         super();
         this.tank = _arg_1;
      }
      
      public function reset() : void
      {
      }
      
      public function update(_arg_1:Number) : void
      {
         this.tank.lygulo.toMatrix3(qylyhi);
         position.copy(this.tank.bilofydur);
         position.transform3(qylyhi);
         position.add(this.tank.roca);
         this.tank.lygulo.getEulerAngles(eulerAngles);
         this.tank.bij().muruqad(position,eulerAngles);
      }
   }
}

