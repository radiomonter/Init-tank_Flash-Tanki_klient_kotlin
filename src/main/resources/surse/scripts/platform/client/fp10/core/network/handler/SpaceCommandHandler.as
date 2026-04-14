package platform.client.fp10.core.network.handler
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.osgi.service.logging.Logger;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import platform.client.fp10.core.network.ICommandSender;
   import platform.client.fp10.core.network.command.SpaceOpenedCommand;
   import platform.client.fp10.core.network.connection.ConnectionCloseStatus;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.service.transport.ITransportService;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.impl.Space;
   
   public class SpaceCommandHandler implements ISpaceCommandHandler
   {
      
      [Inject]
      public static var logService:LogService;
      
      private static var logger:Logger;
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      [Inject]
      public static var modelRegistry:ModelRegistry;
      
      [Inject]
      public static var protocol:IProtocol;
      
      [Inject]
      public static var transportService:ITransportService;
      
      private var space:Space;
      
      private var commandSender:ICommandSender;
      
      private var hashCode:ByteArray;
      
      private var longCodec:ICodec;
      
      public function SpaceCommandHandler(_arg_1:ByteArray)
      {
         super();
         this.hashCode = _arg_1;
         this.longCodec = protocol.getCodec(new TypeCodecInfo(Long,false));
         logger = logger || logService.getLogger("space");
      }
      
      public function setSpace(_arg_1:Space) : void
      {
         this.space = _arg_1;
      }
      
      public function onConnectionOpen(_arg_1:ICommandSender) : void
      {
         this.commandSender = _arg_1;
         _arg_1.sendCommand(new SpaceOpenedCommand(this.space.id,this.hashCode));
      }
      
      public function onConnectionClose(_arg_1:ConnectionCloseStatus, _arg_2:String = null) : void
      {
         spaceRegistry.currentSpace = this.space;
         this.destroyAllObjects();
         spaceRegistry.removeSpace(this.space);
         this.commandSender = null;
      }
      
      public function executeCommand(param1:Object) : void
      {
         var methodId:Long = null;
         var object:IGameObject = null;
         var message:String = null;
         methodId = null;
         object = null;
         var command:Object = param1;
         var buffer:ProtocolBuffer = ProtocolBuffer(command);
         var objectId:Long = Long(this.longCodec.decode(buffer));
         methodId = Long(this.longCodec.decode(buffer));
         object = this.space.getObject(objectId);
         if(object != null)
         {
            try
            {
               spaceRegistry.currentSpace = this.space;
               modelRegistry.invoke(object,methodId,buffer);
            }
            catch(e:Error)
            {
               throw new Error("Command execution error. Object id=" + object.id + ", method id=" + methodId + ", Error=" + e.getStackTrace());
            }
            return;
         }
         message = "Вызов метода модели поведения для незагруженного объекта (objectId: " + objectId + ", methodId: " + methodId + ")";
         throw new Error(message);
      }
      
      private function destroyAllObjects() : void
      {
         var _local_1:Vector.<IGameObject> = null;
         var _local_2:int = 0;
         if(this.space.objects.length > 0)
         {
            _local_1 = this.space.objects.slice();
            _local_2 = _local_1.length - 1;
            while(_local_2 >= 0)
            {
               this.space.destroyObject(_local_1[_local_2].id);
               _local_2--;
            }
         }
      }
   }
}

