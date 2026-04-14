package alternativa.proplib
{
   public class PropLibRegistry
   {
      
      private var libs:Object = {};
      
      public function PropLibRegistry()
      {
         super();
      }
      
      public function addLibrary(_arg_1:PropLibrary) : void
      {
         this.libs[_arg_1.name] = _arg_1;
      }
      
      public function getLibrary(_arg_1:String) : PropLibrary
      {
         return this.libs[_arg_1];
      }
      
      public function get libraries() : Vector.<PropLibrary>
      {
         var _local_2:PropLibrary = null;
         var _local_1:Vector.<PropLibrary> = new Vector.<PropLibrary>();
         for each(_local_2 in this.libs)
         {
            _local_1.push(_local_2);
         }
         return _local_1;
      }
   }
}

