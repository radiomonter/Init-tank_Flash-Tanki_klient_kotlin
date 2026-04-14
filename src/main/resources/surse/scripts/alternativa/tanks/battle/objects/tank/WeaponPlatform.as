package alternativa.tanks.battle.objects.tank
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.tankskin.TankSkin;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapon.BasicGlobalGunParams;
   import obfuscation.bude.BattleTeam;
   
   public interface WeaponPlatform
   {
      
      function gytamy(param1:AllGlobalGunParams, param2:int = 0) : void;
      
      function bume(param1:BasicGlobalGunParams, param2:int = 0) : void;
      
      function qiniwu() : Body;
      
      function getynos(param1:int = 0) : Vector3;
      
      function falevetos() : Vector3;
      
      function holuzorow(param1:int = 0) : Number;
      
      function qenokeru() : Object3D;
      
      function stopMovement() : void;
      
      function finypa(param1:Boolean) : void;
      
      function camite(param1:Vector3, param2:int = 0) : void;
      
      function sypibi() : int;
      
      function qigaqesa(param1:Boolean) : void;
      
      function bij() : TankSkin;
      
      function weka() : void;
      
      function fufyvi(param1:int = 7) : void;
      
      function get teamType() : BattleTeam;
   }
}

