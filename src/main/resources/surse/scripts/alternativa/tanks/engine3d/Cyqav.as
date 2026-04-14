package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.utils.TextureMaterialRegistry;
   
   public class Cyqav implements BattleEventListener
   {
      
      private var registry:TextureMaterialRegistry;
      
      public function Cyqav(_arg_1:TextureMaterialRegistry)
      {
         super();
         this.registry = _arg_1;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.registry.clear();
         TextureResourcesRegistry.releaseTextureResources();
      }
   }
}

