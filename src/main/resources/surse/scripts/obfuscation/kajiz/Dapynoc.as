package obfuscation.kajiz
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.RayCollisionFilter;
   
   public class Dapynoc extends Vopefow implements Locit
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var poz:RayCollisionFilter = new RayCollisionFilter();
      
      private var gete:RayHit = new RayHit();
      
      private var dol:Vector.<RayHit> = new Vector.<RayHit>();
      
      private var self:ClientObject;
      
      public function Dapynoc(_arg_1:ClientObject, _arg_2:Number)
      {
         super(_arg_2,this.poz);
         this.self = _arg_1;
      }
      
      public function quty(_arg_1:AllGlobalGunParams, _arg_2:Vector3) : Vector.<RayHit>
      {
         this.poz.nugagos = this.wybejazav(this.self).qiniwu();
         this.gete.clear();
         this.dol.length = 0;
         if(raycast(_arg_1,_arg_2,this.gete))
         {
            this.dol.push(this.gete.clone());
         }
         return this.dol;
      }
      
      private function wybejazav(_arg_1:ClientObject) : Tank
      {
         return ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1).tank;
      }
   }
}

