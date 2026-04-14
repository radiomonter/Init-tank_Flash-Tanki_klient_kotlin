package platform.client.core.general.socialnetwork.types
{
   import flash.utils.Dictionary;
   
   public class LoginParameters
   {
      
      private var _parameters:Dictionary;
      
      public function LoginParameters(_arg_1:Dictionary = null)
      {
         super();
         this._parameters = _arg_1;
      }
      
      public function get parameters() : Dictionary
      {
         return this._parameters;
      }
      
      public function set parameters(_arg_1:Dictionary) : void
      {
         this._parameters = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "LoginParameters [";
         _local_1 += "parameters = " + this.parameters + " ";
         return _local_1 + "]";
      }
   }
}

