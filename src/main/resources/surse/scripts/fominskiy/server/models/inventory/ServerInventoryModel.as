package fominskiy.server.models.inventory
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.models.battle.gui.inventory.InventoryItemModel;
   import alternativa.tanks.models.battle.gui.inventory.InventoryModel;
   import flash.utils.Dictionary;
   import obfuscation.gopepelaw.Dipyfeg;
   import obfuscation.modo.Bibeza;
   
   public class ServerInventoryModel
   {
      
      private var inventoryModel:InventoryModel;
      
      private var inventoryItemModel:InventoryItemModel;
      
      private var modelsService:IModelService;
      
      private var _objects:Dictionary;
      
      public function ServerInventoryModel()
      {
         super();
      }
      
      public function init() : void
      {
         this.modelsService = IModelService(OSGi.getInstance().getService(IModelService));
         this.inventoryModel = InventoryModel(this.modelsService.getModelsByInterface(Bibeza)[0]);
         this.inventoryItemModel = InventoryItemModel(this.modelsService.getModelsByInterface(Dipyfeg)[0]);
         this._objects = new Dictionary();
      }
      
      public function initInventory(_arg_1:Array) : void
      {
         var _local_2:ServerInventoryData = null;
         var _local_3:ClientObject = null;
         this.inventoryModel.objectLoaded(null);
         for each(_local_2 in _arg_1)
         {
            _local_3 = this.getClientObject(_local_2.id);
            this.inventoryItemModel.initObject(_local_3,null,_local_2.count,_local_2.itemEffectTime,_local_2.slotId,_local_2.itemRestSec);
            this._objects[_local_2.id] = _local_3;
         }
      }
      
      public function updateCount(_arg_1:String, _arg_2:int) : void
      {
         this.inventoryItemModel.updateCount(this._objects[_arg_1],_arg_2);
      }
      
      public function activateDependedCooldown(_arg_1:String, _arg_2:int) : void
      {
         this.inventoryModel.activateDependedCooldown(this.getID(_arg_1),_arg_2);
      }
      
      public function activateCooldown(_arg_1:String, _arg_2:int) : void
      {
         this.inventoryModel.activateCooldown(this.getID(_arg_1),_arg_2);
         this.inventoryModel.changeEffectTime(this.getID(_arg_1),_arg_2,true,false);
      }
      
      public function activateItem(_arg_1:String, _arg_2:int, _arg_3:Boolean = false) : void
      {
         this.inventoryItemModel.activated(this._objects[_arg_1],_arg_2,_arg_3);
      }
      
      public function enableEffect(itemIndex:int, duration:int) : void
      {
      }
      
      public function getID(_arg_1:String) : int
      {
         switch(_arg_1)
         {
            case "health":
               return 0;
            case "armor":
               return 1;
            case "double_damage":
               return 2;
            case "n2o":
               return 3;
            case "mine":
               return 4;
            case "gold":
               return 5;
            default:
               return -1;
         }
      }
      
      private function getClientObject(_arg_1:String) : ClientObject
      {
         return new ClientObject(_arg_1,null,_arg_1,null);
      }
   }
}

