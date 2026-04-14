package projects.tanks.client.entrance.model.entrance.registration
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class RegistrationModelCC
   {
      
      private var _bgResource:ImageResource;
      
      private var _enableRequiredEmail:Boolean;
      
      private var _maxPasswordLength:int;
      
      private var _minPasswordLength:int;
      
      public function RegistrationModelCC(_arg_1:ImageResource = null, _arg_2:Boolean = false, _arg_3:int = 0, _arg_4:int = 0)
      {
         super();
         this._bgResource = _arg_1;
         this._enableRequiredEmail = _arg_2;
         this._maxPasswordLength = _arg_3;
         this._minPasswordLength = _arg_4;
      }
      
      public function get bgResource() : ImageResource
      {
         return this._bgResource;
      }
      
      public function set bgResource(_arg_1:ImageResource) : void
      {
         this._bgResource = _arg_1;
      }
      
      public function get enableRequiredEmail() : Boolean
      {
         return this._enableRequiredEmail;
      }
      
      public function set enableRequiredEmail(_arg_1:Boolean) : void
      {
         this._enableRequiredEmail = _arg_1;
      }
      
      public function get maxPasswordLength() : int
      {
         return this._maxPasswordLength;
      }
      
      public function set maxPasswordLength(_arg_1:int) : void
      {
         this._maxPasswordLength = _arg_1;
      }
      
      public function get minPasswordLength() : int
      {
         return this._minPasswordLength;
      }
      
      public function set minPasswordLength(_arg_1:int) : void
      {
         this._minPasswordLength = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "RegistrationModelCC [";
         _local_1 += "bgResource = " + this.bgResource + " ";
         _local_1 += "enableRequiredEmail = " + this.enableRequiredEmail + " ";
         _local_1 += "maxPasswordLength = " + this.maxPasswordLength + " ";
         _local_1 += "minPasswordLength = " + this.minPasswordLength + " ";
         return _local_1 + "]";
      }
   }
}

