package obfuscation.pikobu
{
   public class Salivopot extends Munano
   {
      
      public function Salivopot(_arg_1:String)
      {
         super(_arg_1,false);
      }
      
      [Obfuscation(rename="false")]
      override protected function createAdditionalIcons() : void
      {
      }
      
      [Obfuscation(rename="false")]
      override protected function getAdditionalIconsWidth() : Number
      {
         return 0;
      }
   }
}

