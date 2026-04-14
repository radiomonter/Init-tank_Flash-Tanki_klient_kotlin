package forms.ranks
{
   import flash.display.Bitmap;
   
   public class BigRankIcon extends RankIcon
   {
      
      public function BigRankIcon()
      {
         super();
      }
      
      override protected function createDefaultRankBitmap(_arg_1:int) : Bitmap
      {
         return new Bitmap(DefaultRanksBitmaps.bigRanks[_arg_1 - 1]);
      }
      
      override protected function createPremiumRankBitmap(_arg_1:int) : Bitmap
      {
         return new Bitmap(PremiumRankBitmaps.bigRanks[_arg_1 - 1]);
      }
   }
}

