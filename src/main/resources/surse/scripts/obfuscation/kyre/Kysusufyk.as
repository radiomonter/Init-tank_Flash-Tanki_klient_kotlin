package obfuscation.kyre
{
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.physics.PhysicsMaterial;
   import alternativa.physics.ShapeContact;
   import alternativa.physics.collision.primitives.CollisionBox;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Nun;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Kysusufyk
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const nahad:Number = 12.5;
      
      private static const contacts:Vector.<ShapeContact> = new Vector.<ShapeContact>();
      
      private var tank:Tank;
      
      private var kuni:CollisionBox;
      
      private var hameqe:Boolean;
      
      private var vov:Boolean;
      
      private var pokeh:Boolean;
      
      public function Kysusufyk(_arg_1:Vuwuci)
      {
         super();
         this.tank = _arg_1.body.tank;
         var _local_2:Vector3 = this.tank.sipobujif().hs.clone();
         _local_2.z += nahad;
         this.kuni = new CollisionBox(_local_2,-1,PhysicsMaterial.DEFAULT_MATERIAL);
         this.kuni.body = this.tank.qiniwu();
      }
      
      public function wuqevylov() : void
      {
         var _local_1:ShapeContact = null;
         var _local_2:Number = NaN;
         this.hameqe = this.vov;
         this.fodunaz();
         var _local_3:TanksCollisionDetector = battleService.getBattleRunner().soc();
         _local_3.cagijep(this.kuni,contacts);
         var _local_4:Number = 0;
         for each(_local_1 in contacts)
         {
            if(_local_1.shape1 == this.kuni)
            {
               _local_2 = _local_1.normal.dot(Vector3.Z_AXIS);
            }
            else
            {
               _local_2 = _local_1.normal.dot(Vector3.DOWN);
            }
            _local_4 = Math.max(_local_4,_local_2);
            _local_1.dispose();
         }
         this.pokeh = contacts.length > 0;
         contacts.length = 0;
         this.vov = _local_4 < Nun.ferecojih;
      }
      
      private function fodunaz() : void
      {
         var _local_1:CollisionBox = this.tank.sipobujif();
         var _local_2:Matrix4 = this.kuni.transform;
         _local_2.copy(_local_1.transform);
         _local_2.m03 -= _local_2.m02 * nahad;
         _local_2.m13 -= _local_2.m12 * nahad;
         _local_2.m23 -= _local_2.m22 * nahad;
         this.kuni.calculateAABB();
      }
      
      public function gikemad() : Boolean
      {
         return this.vov;
      }
      
      public function qycehy() : Boolean
      {
         return this.vov && !this.hameqe;
      }
      
      public function lidelej() : Boolean
      {
         return this.hameqe && !this.vov;
      }
      
      public function ruf() : Boolean
      {
         return this.vov && this.pokeh;
      }
   }
}

