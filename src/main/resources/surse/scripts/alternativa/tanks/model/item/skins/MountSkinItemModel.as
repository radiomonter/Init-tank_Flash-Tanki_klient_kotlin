package alternativa.tanks.model.item.skins
{
   import projects.tanks.client.garage.skins.IMountSkinItemModelBase;
   import projects.tanks.client.garage.skins.MountSkinItemModelBase;
   
   [ModelInfo]
   public class MountSkinItemModel extends MountSkinItemModelBase implements IMountSkinItemModelBase, MountSkin
   {
      
      public function MountSkinItemModel()
      {
         super();
      }
      
      public function getMountedSkin() : Object
      {
         return getInitParam().item;
      }
      
      public function mount(_arg_1:Object) : void
      {
         getInitParam().item = _arg_1;
         server.mountSkin(_arg_1);
      }
   }
}

