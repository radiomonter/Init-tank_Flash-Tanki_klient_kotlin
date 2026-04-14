package alternativa.tanks.models.bonus.region
{
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   
   public class BonusRegion
   {
      
      [Inject]
      public static var battleService:BattleService = BattleService(OSGi.getInstance().getService(BattleService));
      
      protected var mesh:Mesh;
      
      protected var position:Vector3;
      
      public function BonusRegion(_arg_1:Mesh, _arg_2:Vector3, _arg_3:Boolean)
      {
         super();
         this.mesh = _arg_1;
         this.position = _arg_2;
         _arg_1.visible = _arg_3;
      }
      
      public function addToGame() : void
      {
         battleService.getBattleScene3D().addObject(this.mesh);
      }
      
      public function removeFromGame() : void
      {
         battleService.getBattleScene3D().removeObject(this.mesh);
         this.mesh = null;
      }
      
      public function showForce() : void
      {
         this.mesh.visible = true;
      }
      
      public function hideForce() : void
      {
         this.mesh.visible = false;
      }
      
      public function show() : void
      {
         this.mesh.visible = true;
      }
      
      public function hide() : void
      {
         this.mesh.visible = false;
      }
      
      public function hideAndRemoveFromGame() : void
      {
         this.hide();
         this.removeFromGame();
      }
      
      public function getPosition() : Vector3
      {
         return this.position;
      }
   }
}

