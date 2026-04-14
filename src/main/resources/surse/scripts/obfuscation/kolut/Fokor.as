package obfuscation.kolut
{
   import assets.icons.BattleInfoIcons;
   
   public class Fokor extends Qohec implements Qohiqov
   {
      
      private static const duvolawu:int = 17;
      
      private static const tuhevume:int = 10;
      
      private var icon:BattleInfoIcons;
      
      public function Fokor()
      {
         super();
         this.icon = new BattleInfoIcons();
         this.icon.type = BattleInfoIcons.KILL_LIMIT;
         addChild(this.icon);
         this.icon.y = tuhevume;
      }
      
      override protected function calculateWidth() : int
      {
         var _local_1:int = 5;
         var _local_2:int = labelRed.width > wubiba.width ? int(labelRed.width) : int(wubiba.width);
         labelRed.x = _local_1 + _local_1 + (_local_2 - labelRed.width >> 1);
         this.icon.x = labelRed.x + _local_2 + _local_1;
         wubiba.x = this.icon.x + duvolawu + _local_1 + (_local_2 - wubiba.width >> 1);
         return wubiba.x + _local_2 + _local_1 + _local_1;
      }
   }
}

