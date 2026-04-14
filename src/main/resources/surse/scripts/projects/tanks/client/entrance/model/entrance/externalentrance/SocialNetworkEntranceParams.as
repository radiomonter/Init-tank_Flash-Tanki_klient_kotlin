package projects.tanks.client.entrance.model.entrance.externalentrance
{
   public class SocialNetworkEntranceParams
   {
      
      private var _authorizationUrl:String;
      
      private var _snId:String;
      
      public function SocialNetworkEntranceParams(_arg_1:String = null, _arg_2:String = null)
      {
         super();
         this._authorizationUrl = _arg_1;
         this._snId = _arg_2;
      }
      
      public function get authorizationUrl() : String
      {
         return this._authorizationUrl;
      }
      
      public function set authorizationUrl(_arg_1:String) : void
      {
         this._authorizationUrl = _arg_1;
      }
      
      public function get snId() : String
      {
         return this._snId;
      }
      
      public function set snId(_arg_1:String) : void
      {
         this._snId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "SocialNetworkEntranceParams [";
         _local_1 += "authorizationUrl = " + this.authorizationUrl + " ";
         _local_1 += "snId = " + this.snId + " ";
         return _local_1 + "]";
      }
   }
}

