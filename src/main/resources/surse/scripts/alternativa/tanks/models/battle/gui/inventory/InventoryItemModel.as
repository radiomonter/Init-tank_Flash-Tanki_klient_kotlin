package alternativa.tanks.models.battle.gui.inventory
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.dovowori.Jekuruv;
   import obfuscation.dovowori.Kyfyr;
   import obfuscation.gopepelaw.Dipyfeg;
   import obfuscation.gopepelaw.Zivunet;
   import obfuscation.modo.Bibeza;
   
   public class InventoryItemModel extends Kyfyr implements Jekuruv, Dipyfeg
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var jokuma:Zivunet;
      
      private var huqitac:Dictionary = new Dictionary();
      
      private var qyluvun:TankModel;
      
      public function InventoryItemModel()
      {
         super();
         _interfaces.push(IModel,Jekuruv,Dipyfeg);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Long, _arg_3:int, _arg_4:int, _arg_5:int, _arg_6:int) : void
      {
         var _local_9:IModelService = null;
         if(this.jokuma == null)
         {
            _local_9 = IModelService(OSGi.getInstance().getService(IModelService));
            this.jokuma = Zivunet(_local_9.getModelsByInterface(Zivunet)[0]);
            this.qyluvun = TankModel(OSGi.getInstance().getService(ITankModel));
         }
         var _local_7:InventoryItem = new InventoryItem(_arg_1,_arg_5,_arg_3,(_arg_6 + _arg_4) * 1000);
         this.huqitac[_arg_1] = _local_7;
         var _local_8:int = _arg_5 - 1;
         this.jokuma.hisug(_local_7,_local_8);
      }
      
      [Obfuscation(rename="false")]
      public function activated(_arg_1:ClientObject, _arg_2:int, _arg_3:Boolean = false) : void
      {
         var _local_4:InventoryItem = this.huqitac[_arg_1];
         if(_local_4 == null)
         {
            return;
         }
         _local_4.bukicab(_arg_2);
         if(_arg_3)
         {
            --_local_4.count;
         }
         this.jokuma.hidige(_local_4);
      }
      
      [Obfuscation(rename="false")]
      public function updateCount(_arg_1:ClientObject, _arg_2:int) : void
      {
         var _local_3:InventoryItem = this.huqitac[_arg_1];
         if(_local_3 != null)
         {
            if(_local_3.count <= 0 && _arg_2 > 0)
            {
               InventoryModel(IModelService(OSGi.getInstance().getService(IModelService)).getModelsByInterface(Bibeza)[0]).initItemSlot(_local_3);
            }
            _local_3.count = _arg_2;
            InventoryModel(IModelService(OSGi.getInstance().getService(IModelService)).getModelsByInterface(Bibeza)[0]).itemUpdateCount(_local_3);
         }
      }
      
      public function zekoqow(_arg_1:InventoryItem) : void
      {
         if(_arg_1.setasen())
         {
            this.activate(_arg_1.getClientObject());
         }
      }
      
      private function activate(_arg_1:ClientObject) : void
      {
         battleEventDispatcher.dispatchEvent(Vegepos.figahe);
         Network(OSGi.getInstance().getService(INetworker)).send("battle;activate_item;" + _arg_1.id);
      }
   }
}

