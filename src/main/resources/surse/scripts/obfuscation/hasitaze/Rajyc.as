package obfuscation.hasitaze
{
   public class Rajyc
   {
      
      private var _capacity:Number;
      
      private var lorab:Number;
      
      private var kubuhe:int;
      
      private var tawiciqe:Number;
      
      private var waduga:Number;
      
      private var pipawi:Number;
      
      private var pulybedy:Number;
      
      private var _radius:Number;
      
      public function Rajyc(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:int = 0, _arg_4:Number = 0, _arg_5:Number = 0, _arg_6:Number = 0, _arg_7:Number = 0, _arg_8:Number = 0)
      {
         super();
         this._capacity = _arg_1;
         this.lorab = _arg_2;
         this.kubuhe = _arg_3;
         this.tawiciqe = _arg_4;
         this.waduga = _arg_5;
         this.pipawi = _arg_6;
         this.pulybedy = _arg_7;
         this._radius = _arg_8;
      }
      
      public function get capacity() : Number
      {
         return this._capacity;
      }
      
      public function set capacity(_arg_1:Number) : void
      {
         this._capacity = _arg_1;
      }
      
      public function get chargeRate() : Number
      {
         return this.lorab;
      }
      
      public function set chargeRate(_arg_1:Number) : void
      {
         this.lorab = _arg_1;
      }
      
      public function get checkPeriodMsec() : int
      {
         return this.kubuhe;
      }
      
      public function set checkPeriodMsec(_arg_1:int) : void
      {
         this.kubuhe = _arg_1;
      }
      
      public function get coneAngle() : Number
      {
         return this.tawiciqe;
      }
      
      public function set coneAngle(_arg_1:Number) : void
      {
         this.tawiciqe = _arg_1;
      }
      
      public function get dischargeDamageRate() : Number
      {
         return this.waduga;
      }
      
      public function set dischargeDamageRate(_arg_1:Number) : void
      {
         this.waduga = _arg_1;
      }
      
      public function get dischargeHealingRate() : Number
      {
         return this.pipawi;
      }
      
      public function set dischargeHealingRate(_arg_1:Number) : void
      {
         this.pipawi = _arg_1;
      }
      
      public function get dischargeIdleRate() : Number
      {
         return this.pulybedy;
      }
      
      public function set dischargeIdleRate(_arg_1:Number) : void
      {
         this.pulybedy = _arg_1;
      }
      
      public function get radius() : Number
      {
         return this._radius;
      }
      
      public function set radius(_arg_1:Number) : void
      {
         this._radius = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "IsisCC [";
         _local_1 += "capacity = " + this.capacity + " ";
         _local_1 += "chargeRate = " + this.chargeRate + " ";
         _local_1 += "checkPeriodMsec = " + this.checkPeriodMsec + " ";
         _local_1 += "coneAngle = " + this.coneAngle + " ";
         _local_1 += "dischargeDamageRate = " + this.dischargeDamageRate + " ";
         _local_1 += "dischargeHealingRate = " + this.dischargeHealingRate + " ";
         _local_1 += "dischargeIdleRate = " + this.dischargeIdleRate + " ";
         _local_1 += "radius = " + this.radius + " ";
         return _local_1 + "]";
      }
   }
}

