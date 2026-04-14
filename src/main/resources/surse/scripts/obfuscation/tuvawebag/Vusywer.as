package obfuscation.tuvawebag
{
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.Nib;
   import flash.geom.ColorTransform;
   
   public class Vusywer implements ColorTransformService
   {
      
      private var runym:ColorTransform;
      
      private var deqyvy:ColorTransform;
      
      public function Vusywer()
      {
         super();
      }
      
      public function setColorTransform(_arg_1:ColorTransform) : void
      {
      }
      
      public function dutimyp() : ColorTransform
      {
         return null;
      }
      
      public function zawora(_arg_1:Nib) : void
      {
      }
      
      public function juwokytu(_arg_1:ColorTransform, _arg_2:ColorTransform, _arg_3:ColorTransform, _arg_4:ColorTransform) : void
      {
         this.runym = _arg_3;
         this.deqyvy = _arg_4;
      }
      
      public function neloz() : ColorTransform
      {
         return this.runym;
      }
      
      public function sypa() : ColorTransform
      {
         return this.deqyvy;
      }
   }
}

