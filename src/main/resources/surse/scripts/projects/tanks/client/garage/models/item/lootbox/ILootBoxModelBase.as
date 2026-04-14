package projects.tanks.client.garage.models.item.lootbox
{
   public interface ILootBoxModelBase
   {
      
      function openSuccessful(param1:Vector.<LootBoxReward>) : void;
      
      function updateCount(param1:int) : void;
   }
}

