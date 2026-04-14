package projects.tanks.client.panel.model.socialnetwork
{
   public class SocialNetworkPanelParams
   {
      
      private var _authorizationUrl:String;
      
      private var _linkExists:Boolean;
      
      private var _snId:String;
      
      public function SocialNetworkPanelParams(_arg_1:String = null, _arg_2:Boolean = false, _arg_3:String = null)
      {
         super();
         this._authorizationUrl = _arg_1;
         this._linkExists = _arg_2;
         this._snId = _arg_3;
      }
      
      public function get authorizationUrl() : String
      {
         return this._authorizationUrl;
      }
      
      public function set authorizationUrl(_arg_1:String) : void
      {
         this._authorizationUrl = _arg_1;
      }
      
      public function get linkExists() : Boolean
      {
         return this._linkExists;
      }
      
      public function set linkExists(_arg_1:Boolean) : void
      {
         this._linkExists = _arg_1;
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
         var _local_1:* = "SocialNetworkPanelParams [";
         _local_1 += "authorizationUrl = " + this.authorizationUrl + " ";
         _local_1 += "linkExists = " + this.linkExists + " ";
         _local_1 += "snId = " + this.snId + " ";
         return _local_1 + "]";
      }
   }
}

