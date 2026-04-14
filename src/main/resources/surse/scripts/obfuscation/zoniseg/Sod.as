package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   
   public class Sod
   {
      
      private static const hacavyrus:Number = 100000;
      
      public function Sod()
      {
         super();
      }
      
      public static function teluwelyp(_arg_1:Vector3, _arg_2:Vector3) : Vector3
      {
         var _local_3:Vector3 = _arg_1.clone();
         _local_3.addScaled(Sod.hacavyrus,_arg_2);
         return _local_3;
      }
   }
}

