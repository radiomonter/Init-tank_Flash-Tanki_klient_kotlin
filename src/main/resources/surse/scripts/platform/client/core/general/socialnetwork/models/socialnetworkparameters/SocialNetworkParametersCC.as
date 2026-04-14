package platform.client.core.general.socialnetwork.models.socialnetworkparameters
{
   public class SocialNetworkParametersCC
   {
      
      private var _hasOwnPaymentSystem:Boolean;
      
      private var _hasSocialFunction:Boolean;
      
      public function SocialNetworkParametersCC(_arg_1:Boolean = false, _arg_2:Boolean = false)
      {
         super();
         this._hasOwnPaymentSystem = _arg_1;
         this._hasSocialFunction = _arg_2;
      }
      
      public function get hasOwnPaymentSystem() : Boolean
      {
         return this._hasOwnPaymentSystem;
      }
      
      public function set hasOwnPaymentSystem(_arg_1:Boolean) : void
      {
         this._hasOwnPaymentSystem = _arg_1;
      }
      
      public function get hasSocialFunction() : Boolean
      {
         return this._hasSocialFunction;
      }
      
      public function set hasSocialFunction(_arg_1:Boolean) : void
      {
         this._hasSocialFunction = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "SocialNetworkParametersCC [";
         _local_1 += "hasOwnPaymentSystem = " + this.hasOwnPaymentSystem + " ";
         _local_1 += "hasSocialFunction = " + this.hasSocialFunction + " ";
         return _local_1 + "]";
      }
   }
}

