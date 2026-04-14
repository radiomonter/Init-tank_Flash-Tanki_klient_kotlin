package alternativa.tanks.models.bonus.region
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renderer;
   
   public class GoldBonusRegion extends BonusRegion implements Renderer
   {
      
      public static const SHOW_TIME:int = 1000;
      
      public static const HIDE_TIME:int = 3000;
      
      private var showing:Boolean;
      
      private var hiding:Boolean;
      
      private var removeAfterHide:Boolean;
      
      private var _alphaMultiplier:BonusRegionAlphaMultiplier;
      
      public function GoldBonusRegion(_arg_1:Mesh, _arg_2:Vector3)
      {
         super(_arg_1,_arg_2,true);
         this._alphaMultiplier = new BonusRegionAlphaMultiplier();
      }
      
      override public function addToGame() : void
      {
         super.addToGame();
         battleService.getBattleScene3D().toqok(this,0);
      }
      
      override public function removeFromGame() : void
      {
         super.removeFromGame();
         battleService.getBattleScene3D().qahakuve(this,0);
      }
      
      override public function hide() : void
      {
         this.hiding = true;
         this._alphaMultiplier.init(battleService.getBattleRunner().hulivyjam(),HIDE_TIME,1);
      }
      
      override public function show() : void
      {
         this.showing = true;
         this._alphaMultiplier.init(battleService.getBattleRunner().hulivyjam(),SHOW_TIME,0);
      }
      
      override public function hideAndRemoveFromGame() : void
      {
         this.removeAfterHide = true;
         this.hide();
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         if(this.showing)
         {
            mesh.alpha = this.calculateShowingAlphaForTime(_arg_1);
            if(mesh.alpha == 1)
            {
               this.showing = false;
            }
         }
         if(this.hiding)
         {
            mesh.alpha = this.calculateHidingAlphaForTime(_arg_1);
            if(mesh.alpha == 0)
            {
               this.hiding = false;
               if(this.removeAfterHide)
               {
                  this.removeFromGame();
               }
            }
         }
      }
      
      private function calculateHidingAlphaForTime(_arg_1:int) : Number
      {
         return this._alphaMultiplier.getAlpha(_arg_1,false);
      }
      
      private function calculateShowingAlphaForTime(_arg_1:int) : Number
      {
         return this._alphaMultiplier.getAlpha(_arg_1,true);
      }
   }
}

