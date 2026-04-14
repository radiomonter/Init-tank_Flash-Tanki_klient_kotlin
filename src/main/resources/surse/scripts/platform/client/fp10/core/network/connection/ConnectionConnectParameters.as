package platform.client.fp10.core.network.connection
{
   public class ConnectionConnectParameters
   {
      
      private var _host:String;
      
      private var _ports:Vector.<int>;
      
      public function ConnectionConnectParameters(_arg_1:String, _arg_2:Vector.<int>)
      {
         super();
         this._host = _arg_1;
         this._ports = _arg_2;
      }
      
      public function get host() : String
      {
         return this._host;
      }
      
      public function get ports() : Vector.<int>
      {
         return this._ports;
      }
      
      public function toString() : String
      {
         return "[host=" + String(this._host) + " ports=" + String(this._ports) + "]";
      }
   }
}

