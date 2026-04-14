package obfuscation.fut
{
   public class Donoqof
   {
      
      private var bemybyv:Vector.<String>;
      
      private var cekuciz:Vector.<String>;
      
      public function Donoqof(_arg_1:Vector.<String> = null, _arg_2:Vector.<String> = null)
      {
         super();
         this.bemybyv = _arg_1;
         this.cekuciz = _arg_2;
      }
      
      public function get usersBlue() : Vector.<String>
      {
         return this.bemybyv;
      }
      
      public function set usersBlue(_arg_1:Vector.<String>) : void
      {
         this.bemybyv = _arg_1;
      }
      
      public function get usersRed() : Vector.<String>
      {
         return this.cekuciz;
      }
      
      public function set usersRed(_arg_1:Vector.<String>) : void
      {
         this.cekuciz = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TeamBattleItemCC [";
         _local_1 += "usersBlue = " + this.usersBlue + " ";
         _local_1 += "usersRed = " + this.usersRed + " ";
         return _local_1 + "]";
      }
   }
}

