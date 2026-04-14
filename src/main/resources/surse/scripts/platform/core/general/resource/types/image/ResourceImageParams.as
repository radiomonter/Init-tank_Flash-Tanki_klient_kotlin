package platform.core.general.resource.types.image
{
   public class ResourceImageParams
   {
      
      private var _alpha:Boolean;
      
      public function ResourceImageParams(_arg_1:Boolean = false)
      {
         super();
         this._alpha = _arg_1;
      }
      
      public function get alpha() : Boolean
      {
         return this._alpha;
      }
      
      public function set alpha(_arg_1:Boolean) : void
      {
         this._alpha = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ResourceImageParams [";
         _local_1 += "alpha = " + this.alpha + " ";
         return _local_1 + "]";
      }
   }
}

