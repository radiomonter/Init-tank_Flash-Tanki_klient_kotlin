package alternativa.tanks.models.weapon.shaft
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   
   public class Qesaba
   {
      
      public var lozybom:Vector3;
      
      public var target:Body;
      
      public var raw:Vector3;
      
      public function Qesaba()
      {
         super();
      }
      
      public function juvilyvyb(_arg_1:Body, _arg_2:Vector3) : void
      {
         this.target = _arg_1;
         this.raw = _arg_2;
      }
      
      public function zor(_arg_1:Vector3) : void
      {
         this.lozybom = _arg_1.clone();
      }
   }
}

