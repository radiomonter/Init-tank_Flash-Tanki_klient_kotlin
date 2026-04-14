package obfuscation.kisagehy
{
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Waqi
   {
      
      private var _alpha:Number;
      
      private var kedawedaj:Number;
      
      private var pefikilu:Number;
      
      private var jitypo:Number;
      
      private var byvaganyf:MultiframeImageResource;
      
      private var vepebobif:Number;
      
      public function Waqi(_arg_1:Number = 0, _arg_2:Number = 0, _arg_3:Number = 0, _arg_4:Number = 0, _arg_5:MultiframeImageResource = null, _arg_6:Number = 0)
      {
         super();
         this._alpha = _arg_1;
         this.kedawedaj = _arg_2;
         this.pefikilu = _arg_3;
         this.jitypo = _arg_4;
         this.byvaganyf = _arg_5;
         this.vepebobif = _arg_6;
      }
      
      public function get alpha() : Number
      {
         return this._alpha;
      }
      
      public function set alpha(_arg_1:Number) : void
      {
         this._alpha = _arg_1;
      }
      
      public function get micubew() : Number
      {
         return this.kedawedaj;
      }
      
      public function set micubew(_arg_1:Number) : void
      {
         this.kedawedaj = _arg_1;
      }
      
      public function get dustFarDistance() : Number
      {
         return this.pefikilu;
      }
      
      public function set dustFarDistance(_arg_1:Number) : void
      {
         this.pefikilu = _arg_1;
      }
      
      public function get dustNearDistance() : Number
      {
         return this.jitypo;
      }
      
      public function set dustNearDistance(_arg_1:Number) : void
      {
         this.jitypo = _arg_1;
      }
      
      public function get dustParticle() : MultiframeImageResource
      {
         return this.byvaganyf;
      }
      
      public function set dustParticle(_arg_1:MultiframeImageResource) : void
      {
         this.byvaganyf = _arg_1;
      }
      
      public function get dustSize() : Number
      {
         return this.vepebobif;
      }
      
      public function set dustSize(_arg_1:Number) : void
      {
         this.vepebobif = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DustParams [";
         _local_1 += "alpha = " + this.alpha + " ";
         _local_1 += "density = " + this.micubew + " ";
         _local_1 += "dustFarDistance = " + this.dustFarDistance + " ";
         _local_1 += "dustNearDistance = " + this.dustNearDistance + " ";
         _local_1 += "dustParticle = " + this.dustParticle + " ";
         _local_1 += "dustSize = " + this.dustSize + " ";
         return _local_1 + "]";
      }
   }
}

