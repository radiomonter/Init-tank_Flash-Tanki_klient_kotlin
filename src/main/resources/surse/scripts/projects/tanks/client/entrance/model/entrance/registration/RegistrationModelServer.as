package projects.tanks.client.entrance.model.entrance.registration
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class RegistrationModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _checkUidId:Long = Long.getLong(0,300020067);
      
      private var _checkUid_uidCodec:ICodec;
      
      private var _registerId:Long = Long.getLong(0,300020068);
      
      private var _register_userUidCodec:ICodec;
      
      private var _register_passwordCodec:ICodec;
      
      private var _register_registeredUrlCodec:ICodec;
      
      private var _register_rememberMeCodec:ICodec;
      
      private var _register_referralHashCodec:ICodec;
      
      private var _register_realNameCodec:ICodec;
      
      private var _register_idNumberCodec:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function RegistrationModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function checkUid(_arg_1:String) : void
      {
         this.network = Network(OSGi.getInstance().getService(INetworker));
         this.network.send("registration;check_name;" + _arg_1);
      }
      
      public function register(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Boolean, _arg_5:String, _arg_6:String, _arg_7:String, _arg_8:String) : void
      {
         this.network.send("registration;registration;" + _arg_1 + ";" + _arg_2 + ";" + _arg_8);
      }
   }
}

