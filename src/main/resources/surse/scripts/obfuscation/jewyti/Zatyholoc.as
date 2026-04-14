package obfuscation.jewyti
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.camera.GameCamera;
   
   public class Zatyholoc implements Detuqyz
   {
      
      private static const direction:Vector3 = new Vector3();
      
      private static const localDirection:Vector3 = new Vector3();
      
      private var nasyrypyq:ConsoleVarFloat;
      
      private var fyjynog:ConsoleVarFloat;
      
      public function Zatyholoc(_arg_1:ConsoleVarFloat, _arg_2:ConsoleVarFloat)
      {
         super();
         this.nasyrypyq = _arg_1;
         this.fyjynog = _arg_2;
      }
      
      public function buloqonus(_arg_1:Sytyrojuq, _arg_2:GameCamera, _arg_3:Number) : Vector3
      {
         localDirection.x = _arg_1.zunosup();
         localDirection.y = -_arg_1.zekyliqol();
         localDirection.z = _arg_1.botava();
         _arg_2.tywaho(localDirection,direction);
         if(direction.lengthSqr() > 0)
         {
            direction.normalize();
         }
         if(_arg_1.risag())
         {
            direction.scale(this.nasyrypyq.value * this.fyjynog.value * _arg_3);
         }
         else
         {
            direction.scale(this.nasyrypyq.value * _arg_3);
         }
         return direction;
      }
   }
}

