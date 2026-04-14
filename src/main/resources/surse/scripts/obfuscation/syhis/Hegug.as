package obfuscation.syhis
{
   import platform.client.fp10.core.resource.types.ImageResource;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Hegug
   {
      
      private var nalub:ImageResource;
      
      private var kuka:ImageResource;
      
      private var junoq:ImageResource;
      
      private var puzeru:ImageResource;
      
      private var vukewaj:ImageResource;
      
      private var sicihy:ImageResource;
      
      private var kogitolo:ImageResource;
      
      private var lagyqu:Tanks3DSResource;
      
      private var gytady:ImageResource;
      
      private var naluju:ImageResource;
      
      private var sev:ImageResource;
      
      private var ryji:ImageResource;
      
      public function Hegug(_arg_1:ImageResource = null, _arg_2:ImageResource = null, _arg_3:ImageResource = null, _arg_4:ImageResource = null, _arg_5:ImageResource = null, _arg_6:ImageResource = null, _arg_7:ImageResource = null, _arg_8:Tanks3DSResource = null, _arg_9:ImageResource = null, _arg_10:ImageResource = null, _arg_11:ImageResource = null, _arg_12:ImageResource = null)
      {
         super();
         this.nalub = _arg_1;
         this.kuka = _arg_2;
         this.junoq = _arg_3;
         this.puzeru = _arg_4;
         this.vukewaj = _arg_5;
         this.sicihy = _arg_6;
         this.kogitolo = _arg_7;
         this.lagyqu = _arg_8;
         this.gytady = _arg_9;
         this.naluju = _arg_10;
         this.sev = _arg_11;
         this.ryji = _arg_12;
      }
      
      public function get bigLetters() : ImageResource
      {
         return this.nalub;
      }
      
      public function set bigLetters(_arg_1:ImageResource) : void
      {
         this.nalub = _arg_1;
      }
      
      public function get blueCircle() : ImageResource
      {
         return this.kuka;
      }
      
      public function set blueCircle(_arg_1:ImageResource) : void
      {
         this.kuka = _arg_1;
      }
      
      public function get bluePedestalTexture() : ImageResource
      {
         return this.junoq;
      }
      
      public function set bluePedestalTexture(_arg_1:ImageResource) : void
      {
         this.junoq = _arg_1;
      }
      
      public function get blueRay() : ImageResource
      {
         return this.puzeru;
      }
      
      public function set blueRay(_arg_1:ImageResource) : void
      {
         this.puzeru = _arg_1;
      }
      
      public function get blueRayTip() : ImageResource
      {
         return this.vukewaj;
      }
      
      public function set blueRayTip(_arg_1:ImageResource) : void
      {
         this.vukewaj = _arg_1;
      }
      
      public function get neutralCircle() : ImageResource
      {
         return this.sicihy;
      }
      
      public function set neutralCircle(_arg_1:ImageResource) : void
      {
         this.sicihy = _arg_1;
      }
      
      public function get neutralPedestalTexture() : ImageResource
      {
         return this.kogitolo;
      }
      
      public function set neutralPedestalTexture(_arg_1:ImageResource) : void
      {
         this.kogitolo = _arg_1;
      }
      
      public function get pedestal() : Tanks3DSResource
      {
         return this.lagyqu;
      }
      
      public function set pedestal(_arg_1:Tanks3DSResource) : void
      {
         this.lagyqu = _arg_1;
      }
      
      public function get redCircle() : ImageResource
      {
         return this.gytady;
      }
      
      public function set redCircle(_arg_1:ImageResource) : void
      {
         this.gytady = _arg_1;
      }
      
      public function get redPedestalTexture() : ImageResource
      {
         return this.naluju;
      }
      
      public function set redPedestalTexture(_arg_1:ImageResource) : void
      {
         this.naluju = _arg_1;
      }
      
      public function get redRay() : ImageResource
      {
         return this.sev;
      }
      
      public function set redRay(_arg_1:ImageResource) : void
      {
         this.sev = _arg_1;
      }
      
      public function get redRayTip() : ImageResource
      {
         return this.ryji;
      }
      
      public function set redRayTip(_arg_1:ImageResource) : void
      {
         this.ryji = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "DominationResources [";
         _local_1 += "bigLetters = " + this.bigLetters + " ";
         _local_1 += "blueCircle = " + this.blueCircle + " ";
         _local_1 += "bluePedestalTexture = " + this.bluePedestalTexture + " ";
         _local_1 += "blueRay = " + this.blueRay + " ";
         _local_1 += "blueRayTip = " + this.blueRayTip + " ";
         _local_1 += "neutralCircle = " + this.neutralCircle + " ";
         _local_1 += "neutralPedestalTexture = " + this.neutralPedestalTexture + " ";
         _local_1 += "pedestal = " + this.pedestal + " ";
         _local_1 += "redCircle = " + this.redCircle + " ";
         _local_1 += "redPedestalTexture = " + this.redPedestalTexture + " ";
         _local_1 += "redRay = " + this.redRay + " ";
         _local_1 += "redRayTip = " + this.redRayTip + " ";
         return _local_1 + "]";
      }
   }
}

