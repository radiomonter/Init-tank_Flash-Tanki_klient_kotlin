package alternativa.tanks.models.weapon.shared
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import flash.utils.Dictionary;
   
   public class Qytary implements IRayCollisionFilter
   {
      
      public var beji:Body;
      
      private var targets:Dictionary = new Dictionary();
      
      private var mozyhi:Dictionary = new Dictionary();
      
      public function Qytary()
      {
         super();
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.beji != _arg_1 && this.targets[_arg_1] == null && this.mozyhi[_arg_1] == null;
      }
      
      public function qipulen(_arg_1:Body) : void
      {
         this.targets[_arg_1] = true;
      }
      
      public function noryf(_arg_1:Body) : void
      {
         this.mozyhi[_arg_1] = true;
      }
      
      public function kavyn() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.targets)
         {
            delete this.targets[_local_1];
         }
      }
      
      public function gubetuv() : void
      {
         var _local_1:* = undefined;
         for(_local_1 in this.mozyhi)
         {
            delete this.mozyhi[_local_1];
         }
      }
   }
}

