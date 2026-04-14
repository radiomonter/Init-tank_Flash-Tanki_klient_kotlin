package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class GroundSpawnRenderer extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const SCALE_SPEED:Number = 0.005;
      
      private var bonus:BattleBonus;
      
      private var param:Number;
      
      public function GroundSpawnRenderer(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function start(_arg_1:BattleBonus) : void
      {
         this.bonus = _arg_1;
         this.param = 0;
         _arg_1.onRemove.add(this.destroy);
         _arg_1.onPickup.add(this.destroy);
         _arg_1.onDestroy.add(this.destroy);
         battleService.getBattleScene3D().toqok(this,0);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.param += SCALE_SPEED * _arg_2;
         if(this.param > 1)
         {
            this.param = 1;
         }
         var _local_3:BonusMesh = this.bonus.getBonusMesh();
         _local_3.setScale(this.param);
         _local_3.setAlpha(this.param);
         if(this.param == 1)
         {
            this.startFlashAnimation();
            this.destroy();
         }
      }
      
      private function startFlashAnimation() : void
      {
         var _local_1:SpawnFlashRenderer = SpawnFlashRenderer(battleService.getObjectPool().getObject(SpawnFlashRenderer));
         _local_1.start(this.bonus);
      }
      
      private function destroy() : void
      {
         battleService.getBattleScene3D().qahakuve(this,0);
         this.bonus.onRemove.remove(this.destroy);
         this.bonus.onPickup.remove(this.destroy);
         this.bonus.onDestroy.remove(this.destroy);
         this.bonus = null;
         recycle();
      }
   }
}

