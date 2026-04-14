package platform.client.fp10.core.protocol.codec
{
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.registry.SpaceRegistry;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.impl.NotLoadedGameObject;
   
   public class GameObjectCodec implements ICodec
   {
      
      [Inject]
      public static var spaceRegistry:SpaceRegistry;
      
      private var longCodec:ICodec;
      
      public function GameObjectCodec()
      {
         super();
      }
      
      public function init(_arg_1:IProtocol) : void
      {
         this.longCodec = _arg_1.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function encode(_arg_1:ProtocolBuffer, _arg_2:Object) : void
      {
         this.longCodec.encode(_arg_1,IGameObject(_arg_2).id);
      }
      
      public function decode(_arg_1:ProtocolBuffer) : Object
      {
         var _local_2:Long = Long(this.longCodec.decode(_arg_1));
         var _local_3:IGameObject = spaceRegistry.currentSpace.getObject(_local_2);
         if(_local_3 != null)
         {
            return _local_3;
         }
         return new NotLoadedGameObject(_local_2,spaceRegistry.currentSpace);
      }
   }
}

