package obfuscation.rofa
{
   import obfuscation.qevosuh.Coce;
   
   public class Puqo
   {
      
      public static var jaw:LightAnimation;
      
      public function Puqo()
      {
         super();
      }
      
      public static function init() : void
      {
         var _local_1:Vector.<Coce> = null;
         _local_1 = new Vector.<Coce>();
         _local_1[0] = new Coce(1,2,"0xCCA538",0,0);
         _local_1[1] = new Coce(500,1500,"0xCCA538",1.2,100);
         _local_1[2] = new Coce(1,2,"0xCCA538",0,1200);
         jaw = new LightAnimation(_local_1);
      }
   }
}

