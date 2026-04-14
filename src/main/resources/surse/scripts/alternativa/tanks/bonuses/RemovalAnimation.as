package alternativa.tanks.bonuses
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   
   public class RemovalAnimation extends PooledObject implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const REMOVAL_ALPHA_SPEED:Number = 0.001;
      
      private var bonusMesh:BonusMesh;
      
      private var canRemove:Boolean;
      
      public function RemovalAnimation(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:BattleBonus) : void
      {
         this.bonusMesh = _arg_1.getBonusMesh();
         this.canRemove = false;
         battleService.getBattleScene3D().toqok(this,0);
         _arg_1.onPickup.addOnce(this.onBonusPickup);
         _arg_1.onRemove.addOnce(this.onBonusRemove);
      }
      
      private function onBonusPickup() : void
      {
         this.bonusMesh = null;
         this.destroy();
      }
      
      private function onBonusRemove() : void
      {
         this.canRemove = true;
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.canRemove)
         {
            this.fadeOut(_arg_2);
         }
      }
      
      private function fadeOut(_arg_1:int) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = this.bonusMesh.getAlpha();
         _local_4 -= REMOVAL_ALPHA_SPEED * _arg_1;
         if(_local_4 > 0)
         {
            this.bonusMesh.setAlpha(_local_4);
            _local_2 = this.bonusMesh.getScale();
            if(_local_2 > 0)
            {
               _local_3 = _local_2 - 0.002 * _arg_1;
               if(_local_3 < 0)
               {
                  _local_3 = 0;
               }
               this.bonusMesh.setScale(_local_3);
            }
         }
         else
         {
            this.destroy();
         }
      }
      
      private function destroy() : void
      {
         battleService.getBattleScene3D().qahakuve(this,0);
         if(this.bonusMesh != null)
         {
            this.bonusMesh.removeFromScene();
            this.bonusMesh.recycle();
            this.bonusMesh = null;
         }
         recycle();
      }
   }
}

