package platform.client.fp10.core.network.connection
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.types.Long;
   import platform.client.fp10.core.network.ICommandHandler;
   
   public class ConnectionInitializers
   {
      
      private var _protocol:IProtocol;
      
      private var _commandCodec:ICodec;
      
      private var _commandHandler:ICommandHandler;
      
      private var _secure:Boolean;
      
      private var _connectionId:Long;
      
      private var _protectionContext:IProtectionContext;
      
      public function ConnectionInitializers(_arg_1:IProtocol, _arg_2:ICodec, _arg_3:ICommandHandler, _arg_4:Boolean, _arg_5:Long, _arg_6:IProtectionContext)
      {
         super();
         this._protocol = _arg_1;
         this._commandCodec = _arg_2;
         this._commandHandler = _arg_3;
         this._secure = _arg_4;
         this._connectionId = _arg_5;
         this._protectionContext = _arg_6;
      }
      
      public function get protocol() : IProtocol
      {
         return this._protocol;
      }
      
      public function get commandCodec() : ICodec
      {
         return this._commandCodec;
      }
      
      public function get commandHandler() : ICommandHandler
      {
         return this._commandHandler;
      }
      
      public function get secure() : Boolean
      {
         return this._secure;
      }
      
      public function get protectionContext() : IProtectionContext
      {
         return this._protectionContext;
      }
      
      public function get connectionId() : Long
      {
         return this._connectionId;
      }
   }
}

