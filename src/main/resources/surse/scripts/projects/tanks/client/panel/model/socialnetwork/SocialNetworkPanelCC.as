package projects.tanks.client.panel.model.socialnetwork
{
   public class SocialNetworkPanelCC
   {
      
      private var _passwordCreated:Boolean;
      
      private var _socialNetworkParams:Vector.<SocialNetworkPanelParams>;
      
      public function SocialNetworkPanelCC(_arg_1:Boolean = false, _arg_2:Vector.<SocialNetworkPanelParams> = null)
      {
         super();
         this._passwordCreated = _arg_1;
         this._socialNetworkParams = _arg_2;
      }
      
      public function get passwordCreated() : Boolean
      {
         return this._passwordCreated;
      }
      
      public function set passwordCreated(_arg_1:Boolean) : void
      {
         this._passwordCreated = _arg_1;
      }
      
      public function get socialNetworkParams() : Vector.<SocialNetworkPanelParams>
      {
         return this._socialNetworkParams;
      }
      
      public function set socialNetworkParams(_arg_1:Vector.<SocialNetworkPanelParams>) : void
      {
         this._socialNetworkParams = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "SocialNetworkPanelCC [";
         _local_1 += "passwordCreated = " + this.passwordCreated + " ";
         _local_1 += "socialNetworkParams = " + this.socialNetworkParams + " ";
         return _local_1 + "]";
      }
   }
}

