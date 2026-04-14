package alternativa.tanks.model.item.skins
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class MountSkinAdapt implements MountSkin
   {
      
      private var object:IGameObject;
      
      private var impl:MountSkin;
      
      public function MountSkinAdapt(_arg_1:IGameObject, _arg_2:MountSkin)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getMountedSkin() : Object
      {
         var result:Object = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getMountedSkin();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function mount(skin:Object) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.mount(skin);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

