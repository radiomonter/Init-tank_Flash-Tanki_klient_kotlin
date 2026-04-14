package obfuscation.pekyfo
{
   public class Byma
   {
      
      private var lunykyzym:Number;
      
      private var fihysuv:Number;
      
      private var hocari:Number;
      
      private var japeb:Number;
      
      public function Byma(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0)
      {
         super();
         this.lunykyzym = _arg_1;
         this.fihysuv = _arg_2;
         this.hocari = _arg_3;
         this.japeb = _arg_4;
      }
      
      public function get impactForce() : Number
      {
         return this.lunykyzym;
      }
      
      public function set impactForce(_arg_1:Number) : void
      {
         this.lunykyzym = _arg_1;
      }
      
      public function get minSplashDamagePercent() : Number
      {
         return this.fihysuv;
      }
      
      public function set minSplashDamagePercent(_arg_1:Number) : void
      {
         this.fihysuv = _arg_1;
      }
      
      public function get radiusOfMaxSplashDamage() : Number
      {
         return this.hocari;
      }
      
      public function set radiusOfMaxSplashDamage(_arg_1:Number) : void
      {
         this.hocari = _arg_1;
      }
      
      public function get splashDamageRadius() : Number
      {
         return this.japeb;
      }
      
      public function set splashDamageRadius(_arg_1:Number) : void
      {
         this.japeb = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "SplashCC [";
         _local_1 += "impactForce = " + this.impactForce + " ";
         _local_1 += "minSplashDamagePercent = " + this.minSplashDamagePercent + " ";
         _local_1 += "radiusOfMaxSplashDamage = " + this.radiusOfMaxSplashDamage + " ";
         _local_1 += "splashDamageRadius = " + this.splashDamageRadius + " ";
         return _local_1 + "]";
      }
   }
}

