package obfuscation.kewic
{
   public class Pafijoban
   {
      
      private var wizotumev:Number;
      
      private var hiw:Number;
      
      private var tybozi:Number;
      
      private var modev:int;
      
      private var rufah:Number;
      
      private var tobavul:Number;
      
      private var cam:Number;
      
      public function Pafijoban(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:int = 0, _arg_5:Number = 0, _arg_6:Number = 0, _arg_7:Number = 0)
      {
         super();
         this.wizotumev = _arg_1;
         this.hiw = _arg_2;
         this.tybozi = _arg_3;
         this.modev = _arg_4;
         this.rufah = _arg_5;
         this.tobavul = _arg_6;
         this.cam = _arg_7;
      }
      
      public function get energyCapacity() : Number
      {
         return this.wizotumev;
      }
      
      public function set energyCapacity(_arg_1:Number) : void
      {
         this.wizotumev = _arg_1;
      }
      
      public function get energyPerShot() : Number
      {
         return this.hiw;
      }
      
      public function set energyPerShot(_arg_1:Number) : void
      {
         this.hiw = _arg_1;
      }
      
      public function get energyRechargeSpeed() : Number
      {
         return this.tybozi;
      }
      
      public function set energyRechargeSpeed(_arg_1:Number) : void
      {
         this.tybozi = _arg_1;
      }
      
      public function get maxRicochetCount() : int
      {
         return this.modev;
      }
      
      public function set maxRicochetCount(_arg_1:int) : void
      {
         this.modev = _arg_1;
      }
      
      public function get shellRadius() : Number
      {
         return this.rufah;
      }
      
      public function set shellRadius(_arg_1:Number) : void
      {
         this.rufah = _arg_1;
      }
      
      public function get shellSpeed() : Number
      {
         return this.tobavul;
      }
      
      public function set shellSpeed(_arg_1:Number) : void
      {
         this.tobavul = _arg_1;
      }
      
      public function get shotDistance() : Number
      {
         return this.cam;
      }
      
      public function set shotDistance(_arg_1:Number) : void
      {
         this.cam = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RicochetCC [";
         _local_1 += "energyCapacity = " + this.energyCapacity + " ";
         _local_1 += "energyPerShot = " + this.energyPerShot + " ";
         _local_1 += "energyRechargeSpeed = " + this.energyRechargeSpeed + " ";
         _local_1 += "maxRicochetCount = " + this.maxRicochetCount + " ";
         _local_1 += "shellRadius = " + this.shellRadius + " ";
         _local_1 += "shellSpeed = " + this.shellSpeed + " ";
         _local_1 += "shotDistance = " + this.shotDistance + " ";
         return _local_1 + "]";
      }
   }
}

