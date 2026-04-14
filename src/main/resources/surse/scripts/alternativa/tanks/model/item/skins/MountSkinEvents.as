package alternativa.tanks.model.item.skins
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class MountSkinEvents implements MountSkin
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function MountSkinEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getMountedSkin() : Object
      {
         var result:Object = null;
         var i:int = 0;
         var m:MountSkin = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = MountSkin(this.impl[i]);
               result = m.getMountedSkin();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function mount(skin:Object) : void
      {
         var i:int = 0;
         var m:MountSkin = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = MountSkin(this.impl[i]);
               m.mount(skin);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

