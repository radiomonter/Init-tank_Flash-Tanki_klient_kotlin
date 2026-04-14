package obfuscation.kajiz
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.zoniseg.Vakog;
   
   public class Wega extends Vopefow implements Locit
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var fesuhum:Number;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var dytetaman:Vakog = new Vakog();
      
      private var gete:RayHit = new RayHit();
      
      private var tegihyp:Vector.<RayHit> = new Vector.<RayHit>();
      
      private var self:ClientObject;
      
      public function Wega(_arg_1:ClientObject, _arg_2:Number)
      {
         this.self = _arg_1;
         super(_arg_2,this.dytetaman);
         this.fesuhum = _arg_2;
         this.collisionDetector = battleService.getBattleRunner().soc();
      }
      
      public function quty(_arg_1:AllGlobalGunParams, _arg_2:Vector3) : Vector.<RayHit>
      {
         this.dytetaman.addBody(this.wybejazav(this.self).qiniwu());
         this.tegihyp.length = 0;
         while(raycast(_arg_1,_arg_2,this.gete))
         {
            this.tegihyp.push(this.gete.clone());
            if(this.gete.staticHit)
            {
               break;
            }
            this.dytetaman.addBody(this.gete.shape.body);
         }
         this.dytetaman.clear();
         return this.tegihyp;
      }
      
      private function wybejazav(_arg_1:ClientObject) : Tank
      {
         var _local_2:ITankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         return _local_2.getTankData(_arg_1).tank;
      }
   }
}

