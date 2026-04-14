package alternativa.proplib.types
{
   import alternativa.proplib.objects.PropObject;
   
   public class PropState
   {
      
      public static const DEFAULT_NAME:String = "default";
      
      private var _lods:Vector.<PropLOD> = new Vector.<PropLOD>();
      
      public function PropState()
      {
         super();
      }
      
      public function addLOD(_arg_1:PropObject, _arg_2:Number) : void
      {
         this._lods.push(new PropLOD(_arg_1,_arg_2));
      }
      
      public function get numLODs() : int
      {
         return this._lods.length;
      }
      
      public function lodByIndex(_arg_1:int) : PropLOD
      {
         return this._lods[_arg_1];
      }
      
      public function getDefaultObject() : PropObject
      {
         if(this._lods.length == 0)
         {
            throw new Error("No LODs found");
         }
         return PropLOD(this._lods[0]).prop;
      }
      
      public function traceState() : void
      {
         var _local_1:PropLOD = null;
         for each(_local_1 in this._lods)
         {
            _local_1.traceLOD();
         }
      }
   }
}

