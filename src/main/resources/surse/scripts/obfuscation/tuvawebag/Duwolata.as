package obfuscation.tuvawebag
{
   import alternativa.tanks.services.colortransform.Bajoryta;
   import alternativa.tanks.services.colortransform.ColorTransformService;
   import alternativa.tanks.services.colortransform.Nib;
   import flash.geom.ColorTransform;
   
   public class Duwolata implements ColorTransformService
   {
      
      private const jok:Vector.<Nib> = new Vector.<Nib>();
      
      private var colorTransform:ColorTransform;
      
      private var runym:ColorTransform;
      
      private var deqyvy:ColorTransform;
      
      public function Duwolata()
      {
         super();
      }
      
      public function zawora(_arg_1:Nib) : void
      {
         this.jok.push(_arg_1);
         _arg_1.setColorTransform(this.colorTransform);
      }
      
      public function setColorTransform(_arg_1:ColorTransform) : void
      {
         var _local_2:Nib = null;
         if(!Bajoryta.diba(this.colorTransform,_arg_1))
         {
            this.colorTransform = Bajoryta.clone(_arg_1);
            for each(_local_2 in this.jok)
            {
               _local_2.setColorTransform(this.colorTransform);
            }
         }
      }
      
      public function dutimyp() : ColorTransform
      {
         return Bajoryta.clone(this.colorTransform);
      }
      
      public function juwokytu(_arg_1:ColorTransform, _arg_2:ColorTransform, _arg_3:ColorTransform, _arg_4:ColorTransform) : void
      {
         this.runym = _arg_1;
         this.deqyvy = _arg_2;
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

