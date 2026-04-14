package projects.tanks.client.panel.model.bonus.showing.items
{
   import platform.client.fp10.core.type.IGameObject;
   
   public class BonusItemsShowingCC
   {
      
      private var _bonuses:Vector.<IGameObject>;
      
      public function BonusItemsShowingCC(_arg_1:Vector.<IGameObject> = null)
      {
         super();
         this._bonuses = _arg_1;
      }
      
      public function get bonuses() : Vector.<IGameObject>
      {
         return this._bonuses;
      }
      
      public function set bonuses(_arg_1:Vector.<IGameObject>) : void
      {
         this._bonuses = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusItemsShowingCC [";
         _local_1 += "bonuses = " + this.bonuses + " ";
         return _local_1 + "]";
      }
   }
}

