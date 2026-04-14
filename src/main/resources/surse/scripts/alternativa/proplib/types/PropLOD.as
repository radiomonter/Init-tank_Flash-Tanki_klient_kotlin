package alternativa.proplib.types
{
   import alternativa.proplib.objects.PropObject;
   
   public class PropLOD
   {
      
      public var prop:PropObject;
      
      public var distance:Number;
      
      public function PropLOD(_arg_1:PropObject, _arg_2:Number)
      {
         super();
         this.prop = _arg_1;
         this.distance = _arg_2;
      }
      
      public function traceLOD() : void
      {
         this.prop.traceProp();
      }
   }
}

