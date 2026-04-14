package obfuscation.pikobu
{
   import filters.Filters;
   
   public class Vip extends Munano
   {
      
      public function Vip(_arg_1:String)
      {
         super(_arg_1,false);
      }
      
      [Obfuscation(rename="false")]
      override protected function getShadowFilters() : Array
      {
         return null;
      }
      
      [Obfuscation(rename="false")]
      override protected function hutefa() : Array
      {
         return Filters.SHADOW_FILTERS;
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

