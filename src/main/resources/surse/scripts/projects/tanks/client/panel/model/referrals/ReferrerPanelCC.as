package projects.tanks.client.panel.model.referrals
{
   public class ReferrerPanelCC
   {
      
      private var _hash:String;
      
      private var _host:String;
      
      public function ReferrerPanelCC(_arg_1:String = null, _arg_2:String = null)
      {
         super();
         this._hash = _arg_1;
         this._host = _arg_2;
      }
      
      public function get hash() : String
      {
         return this._hash;
      }
      
      public function set hash(_arg_1:String) : void
      {
         this._hash = _arg_1;
      }
      
      public function get host() : String
      {
         return this._host;
      }
      
      public function set host(_arg_1:String) : void
      {
         this._host = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ReferrerPanelCC [";
         _local_1 += "hash = " + this.hash + " ";
         _local_1 += "host = " + this.host + " ";
         return _local_1 + "]";
      }
   }
}

