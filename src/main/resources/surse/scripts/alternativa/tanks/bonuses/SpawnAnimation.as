package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class SpawnAnimation extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const ALPHA_SPEED:Number = 0.001;
      
      private var bonus:BattleBonus;
      
      private var alpha:Number = 0;
      
      public function SpawnAnimation(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function start(_arg_1:BattleBonus) : void
      {
         this.bonus = _arg_1;
         this.alpha = 0;
         _arg_1.onDestroy.add(this.destroy);
         battleService.getBattleScene3D().toqok(this,0);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.alpha += ALPHA_SPEED * _arg_2;
         if(this.alpha > 1)
         {
            this.alpha = 1;
         }
         this.bonus.setAlpha(this.alpha);
         if(this.alpha >= 1)
         {
            this.destroy();
         }
      }
      
      private function destroy() : void
      {
         battleService.getBattleScene3D().qahakuve(this,0);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

