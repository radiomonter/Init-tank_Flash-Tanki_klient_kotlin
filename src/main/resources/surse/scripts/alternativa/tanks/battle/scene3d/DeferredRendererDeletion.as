package alternativa.tanks.battle.scene3d
{
   import alternativa.tanks.battle.DeferredAction;
   
   public class DeferredRendererDeletion implements DeferredAction
   {
      
      private var melefyni:RenderGroup;
      
      private var renderer:Renderer;
      
      public function DeferredRendererDeletion(_arg_1:RenderGroup, _arg_2:Renderer)
      {
         super();
         this.melefyni = _arg_1;
         this.renderer = _arg_2;
      }
      
      public function execute() : void
      {
         this.melefyni.qahakuve(this.renderer);
      }
   }
}

