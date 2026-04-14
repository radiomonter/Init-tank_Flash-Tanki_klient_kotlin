package obfuscation.rokal
{
   import obfuscation.qevosuh.Coce;
   import obfuscation.qevosuh.Cuge;
   import obfuscation.qevosuh.Muwyru;
   import obfuscation.qevosuh.Tuw;
   import obfuscation.rofa.LightAnimation;
   
   public class Fyzeqap extends Tuw implements Muwyru, Riwizy
   {
      
      private static const gid:Array = [new Coce(1,2,"0x000000",0,0)];
      
      public function Fyzeqap()
      {
         super();
      }
      
      private static function qinequni(_arg_1:Coce, _arg_2:Coce) : Number
      {
         return _arg_1.time - _arg_2.time;
      }
      
      public function jaqirynu(_arg_1:String) : LightAnimation
      {
         var _local_2:Cuge = null;
         var _local_3:Vector.<Cuge> = getInitParam().effects;
         if(_local_3 != null)
         {
            for each(_local_2 in _local_3)
            {
               if(_local_2 != null && _local_2.name == _arg_1)
               {
                  _local_2.duzym.sort(qinequni);
                  return new LightAnimation(_local_2.duzym);
               }
            }
         }
         return new LightAnimation(Vector.<Coce>(gid));
      }
   }
}

