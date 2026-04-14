package alternativa.physics.collision.types
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionShape;
   
   public class RayHit
   {
      
      public var shape:CollisionShape;
      
      public var position:Vector3 = new Vector3();
      
      public var normal:Vector3 = new Vector3();
      
      public var t:Number = 0;
      
      public var staticHit:Boolean;
      
      public function RayHit()
      {
         super();
      }
      
      public function copy(_arg_1:RayHit) : void
      {
         this.shape = _arg_1.shape;
         this.position.copy(_arg_1.position);
         this.normal.copy(_arg_1.normal);
         this.t = _arg_1.t;
         this.staticHit = _arg_1.staticHit;
      }
      
      public function clear() : void
      {
         this.shape = null;
      }
      
      public function clone() : RayHit
      {
         var _local_1:RayHit = new RayHit();
         _local_1.copy(this);
         return _local_1;
      }
   }
}

