package obfuscation.kajiz
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   
   public interface Locit
   {
      
      function quty(param1:AllGlobalGunParams, param2:Vector3) : Vector.<RayHit>;
      
      function sab() : void;
   }
}

