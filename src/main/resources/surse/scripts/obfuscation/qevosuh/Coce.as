package obfuscation.qevosuh
{
   public class Coce
   {
      
      private var qakebyzuf:Number;
      
      private var tyz:Number;
      
      private var _color:String;
      
      private var jecawezi:Number;
      
      private var nyhivewor:int;
      
      public function Coce(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:String = null, _arg_4:Number = 0, _arg_5:int = 0)
      {
         super();
         this.qakebyzuf = _arg_1;
         this.tyz = _arg_2;
         this._color = _arg_3;
         this.jecawezi = _arg_4;
         this.nyhivewor = _arg_5;
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
      
      public function get color() : String
      {
         return this._color;
      }
      
      public function set color(_arg_1:String) : void
      {
         this._color = _arg_1;
      }
      
      public function get intensity() : Number
      {
         return this.jecawezi;
      }
      
      public function set intensity(_arg_1:Number) : void
      {
         this.jecawezi = _arg_1;
      }
      
      public function get time() : int
      {
         return this.nyhivewor;
      }
      
      public function set time(_arg_1:int) : void
      {
         this.nyhivewor = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "LightingEfectRecord [";
         _local_1 += "attenuationBegin = " + this.attenuationBegin + " ";
         _local_1 += "attenuationEnd = " + this.attenuationEnd + " ";
         _local_1 += "color = " + this.color + " ";
         _local_1 += "intensity = " + this.intensity + " ";
         _local_1 += "time = " + this.time + " ";
         return _local_1 + "]";
      }
   }
}

