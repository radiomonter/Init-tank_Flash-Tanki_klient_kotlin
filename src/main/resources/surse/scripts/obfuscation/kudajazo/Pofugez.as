package obfuscation.kudajazo
{
   public class Pofugez
   {
      
      private var qakebyzuf:Number;
      
      private var tyz:Number;
      
      private var jecawezi:Number;
      
      private var tawiruqe:String;
      
      public function Pofugez(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:String = null)
      {
         super();
         this.qakebyzuf = _arg_1;
         this.tyz = _arg_2;
         this.jecawezi = _arg_3;
         this.tawiruqe = _arg_4;
      }
      
      public function get attenuationBegin() : Number
      {
         return this.qakebyzuf;
      }
      
      public function set attenuationBegin(_arg_1:Number) : void
      {
         this.qakebyzuf = _arg_1;
      }
      
      public function get attenuationEnd() : Number
      {
         return this.tyz;
      }
      
      public function set attenuationEnd(_arg_1:Number) : void
      {
         this.tyz = _arg_1;
      }
      
      public function get intensity() : Number
      {
         return this.jecawezi;
      }
      
      public function set intensity(_arg_1:Number) : void
      {
         this.jecawezi = _arg_1;
      }
      
      public function get lightColor() : String
      {
         return this.tawiruqe;
      }
      
      public function set lightColor(_arg_1:String) : void
      {
         this.tawiruqe = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusLightCC [";
         _local_1 += "attenuationBegin = " + this.attenuationBegin + " ";
         _local_1 += "attenuationEnd = " + this.attenuationEnd + " ";
         _local_1 += "intensity = " + this.intensity + " ";
         _local_1 += "lightColor = " + this.lightColor + " ";
         return _local_1 + "]";
      }
   }
}

