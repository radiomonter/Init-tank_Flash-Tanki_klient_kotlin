package alternativa.startup
{
   public class ConnectionParameters
   {
      
      public var serverAddress:String;
      
      public var serverPorts:Vector.<int>;
      
      public var serverHttpPorts:Vector.<int>;
      
      public var resourcesRootURL:String;
      
      public var secure:Boolean;
      
      public var recoveryEnabled:Boolean;
      
      public function ConnectionParameters(_arg_1:String, _arg_2:Vector.<int>, _arg_3:Vector.<int>, _arg_4:String, _arg_5:Boolean, _arg_6:Boolean)
      {
         super();
         this.serverAddress = _arg_1;
         this.serverPorts = _arg_2;
         this.serverHttpPorts = _arg_3;
         this.resourcesRootURL = _arg_4;
         this.secure = _arg_5;
         this.recoveryEnabled = _arg_6;
      }
   }
}

