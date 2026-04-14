package obfuscation.nubezeqyr
{
   public class Ruvetuki
   {
      
      private var rog:int;
      
      private var dyvusez:int;
      
      private var benon:int;
      
      public function Ruvetuki(_arg_1:int = 0, _arg_2:int = 0, _arg_3:int = 0)
      {
         super();
         this.rog = _arg_1;
         this.dyvusez = _arg_2;
         this.benon = _arg_3;
      }
      
      public function get delayMountArmorInSec() : int
      {
         return this.rog;
      }
      
      public function set delayMountArmorInSec(_arg_1:int) : void
      {
         this.rog = _arg_1;
      }
      
      public function get delayMountColorInSec() : int
      {
         return this.dyvusez;
      }
      
      public function set delayMountColorInSec(_arg_1:int) : void
      {
         this.dyvusez = _arg_1;
      }
      
      public function get delayMountWeaponInSec() : int
      {
         return this.benon;
      }
      
      public function set delayMountWeaponInSec(_arg_1:int) : void
      {
         this.benon = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DelayMountCategoryCC [";
         _local_1 += "delayMountArmorInSec = " + this.delayMountArmorInSec + " ";
         _local_1 += "delayMountColorInSec = " + this.delayMountColorInSec + " ";
         _local_1 += "delayMountWeaponInSec = " + this.delayMountWeaponInSec + " ";
         return _local_1 + "]";
      }
   }
}

