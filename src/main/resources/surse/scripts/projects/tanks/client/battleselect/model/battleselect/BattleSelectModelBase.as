package projects.tanks.client.battleselect.model.battleselect
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class BattleSelectModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:BattleSelectModelServer;
      
      private var client:IBattleSelectModelBase = IBattleSelectModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300090011);
      
      private var _battleItemsPacketJoinSuccessId:Long = Long.getLong(0,300090026);
      
      private var _selectId:Long = Long.getLong(0,300090027);
      
      private var _select_itemCodec:ICodec;
      
      public function BattleSelectModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new BattleSelectModelServer(IModel(this));
         this._select_itemCodec = this._protocol.getCodec(new TypeCodecInfo(IGameObject,false));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._battleItemsPacketJoinSuccessId:
               this.client.battleItemsPacketJoinSuccess();
               return;
            case this._selectId:
               this.client.select(String(this._select_itemCodec.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

