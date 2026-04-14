package obfuscation.jete
{
   import alternativa.tanks.engine3d.Bizotevuf;
   import alternativa.tanks.engine3d.TextureAnimation;
   import obfuscation.rofa.Javuvyh;
   
   internal class Myzokotyn extends Javuvyh
   {
      
      private var cogakegi:Vector.<Bizotevuf>;
      
      private var numFrames:int;
      
      private var tepe:Number;
      
      public function Myzokotyn()
      {
         super(1,1,0.5,0);
         shadowMapAlphaThreshold = 2;
         depthMapAlphaThreshold = 2;
         useShadowMap = false;
         useLight = false;
      }
      
      public function init(_arg_1:TextureAnimation) : void
      {
         setMaterialToAllFaces(_arg_1.material);
         this.cogakegi = _arg_1.sakito;
         this.numFrames = this.cogakegi.length;
         this.tepe = 0;
         this.metobe(this.cogakegi[0]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.cogakegi = null;
         this.numFrames = 0;
      }
      
      public function update(_arg_1:Number, _arg_2:Number) : void
      {
         this.tepe += _arg_1 * _arg_2;
         if(this.tepe >= this.numFrames)
         {
            this.tepe = 0;
         }
         this.metobe(this.cogakegi[int(this.tepe)]);
      }
      
      private function metobe(_arg_1:Bizotevuf) : void
      {
         a.u = _arg_1.topLeftU;
         a.v = _arg_1.topLeftV;
         b.u = _arg_1.topLeftU;
         b.v = _arg_1.bottomRightV;
         c.u = _arg_1.bottomRightU;
         c.v = _arg_1.bottomRightV;
         d.u = _arg_1.bottomRightU;
         d.v = _arg_1.topLeftV;
      }
   }
}

