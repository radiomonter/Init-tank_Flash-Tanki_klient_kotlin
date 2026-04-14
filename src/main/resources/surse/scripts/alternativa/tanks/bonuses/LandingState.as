package alternativa.tanks.bonuses
{
   import alternativa.math.Quaternion;
   import alternativa.math.Vector3;
   
   public class LandingState
   {
      
      public const position:Vector3 = new Vector3();
      
      public const orientation:Quaternion = new Quaternion();
      
      public function LandingState()
      {
         super();
      }
      
      public function interpolate(_arg_1:LandingState, _arg_2:LandingState, _arg_3:Number) : void
      {
         this.position.interpolate(_arg_3,_arg_1.position,_arg_2.position);
         this.orientation.slerp(_arg_1.orientation,_arg_2.orientation,_arg_3);
      }
      
      public function copy(_arg_1:LandingState) : void
      {
         this.position.copy(_arg_1.position);
         this.orientation.copy(_arg_1.orientation);
      }
   }
}

