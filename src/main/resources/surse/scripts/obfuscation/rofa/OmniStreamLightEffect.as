package obfuscation.rofa
{
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.tanks.utils.objectpool.Pool;
   
   public final class OmniStreamLightEffect extends Tykehyl
   {
      
      public function OmniStreamLightEffect(_arg_1:Pool)
      {
         super(_arg_1,new OmniLight(0,0,0));
      }
      
      public function init(_arg_1:Toli, _arg_2:LightAnimation, _arg_3:LightAnimation) : void
      {
         this.dugoceq = _arg_1;
         this.startTime = _arg_2.tudy();
         this.biw = _arg_3.tudy();
         this.baboqawu = _arg_2;
         this.zowijiha = _arg_3;
         this.random = biw / 4;
         boritaqah = true;
         currentTime = 0;
         alive = true;
         qygity = false;
         fadeTime = 0;
      }
   }
}

