package alternativa.tanks.model.item.skins
{
   import projects.tanks.client.garage.skins.AvailableSkinsItemModelBase;
   import projects.tanks.client.garage.skins.IAvailableSkinsItemModelBase;
   
   [ModelInfo]
   public class AvailableSkinsItemModel extends AvailableSkinsItemModelBase implements IAvailableSkinsItemModelBase, AvailableSkins
   {
      
      public function AvailableSkinsItemModel()
      {
         super();
      }
      
      public function getSkins() : Vector.<Object>
      {
         return getInitParam().skins;
      }
   }
}

