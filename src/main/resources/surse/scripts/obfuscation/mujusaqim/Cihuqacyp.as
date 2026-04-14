package obfuscation.mujusaqim
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Trigger;
   import obfuscation.kyre.Myw;
   
   public class Cihuqacyp implements Trigger
   {
      
      private static const nadygoly:Number = 250;
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var pys:Number;
      
      private var cemosyla:Hylyv;
      
      private var humyrina:Boolean;
      
      private var collisionDetector:CollisionDetector;
      
      public function Cihuqacyp(_arg_1:Vector3, _arg_2:Number, _arg_3:Hylyv, _arg_4:CollisionDetector)
      {
         super();
         this.collisionDetector = _arg_4;
         this.center = _arg_1.clone();
         this.pys = _arg_2 * _arg_2;
         this.cemosyla = _arg_3;
      }
      
      public function reset() : void
      {
         this.humyrina = false;
      }
      
      public function checkTrigger(_arg_1:Body) : void
      {
         var _local_2:Vector3 = _arg_1.state.position;
         this.vuso(_local_2);
         var _local_3:Number = _local_2.x - this.center.x;
         var _local_4:Number = _local_2.y - this.center.y;
         var _local_5:Number = _local_2.z - this.center.z;
         var _local_6:Number = _local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5;
         if(this.humyrina)
         {
            if(_local_6 > this.pys)
            {
               this.humyrina = false;
               this.cemosyla.nera();
            }
         }
         else if(_local_6 <= this.pys)
         {
            this.humyrina = true;
            this.cemosyla.jydupyv();
         }
      }
      
      private function vuso(_arg_1:Vector3) : void
      {
         var _local_2:Number = _arg_1.distanceToXYSquared(this.center);
         if(this.humyrina)
         {
            if(_local_2 > this.pys || !this.myqugu(_arg_1))
            {
               this.humyrina = false;
               this.cemosyla.nera();
            }
         }
         else if(_local_2 <= this.pys && this.myqugu(_arg_1))
         {
            this.humyrina = true;
            this.cemosyla.jydupyv();
         }
      }
      
      private function myqugu(_arg_1:Vector3) : Boolean
      {
         var _local_2:Vector3 = null;
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + nadygoly);
         if(this.collisionDetector.raycastStatic(_arg_1,Vector3.DOWN,Myw.dyhan,10000000000,null,fawevotoj))
         {
            _local_2 = fawevotoj.position;
            _local_2.z += 0.1;
            _local_3 = _local_2.subtract(_local_4);
            return !this.collisionDetector.raycastStatic(_local_4,_local_3,Myw.dyhan,1,null,fawevotoj);
         }
         return false;
      }
   }
}

