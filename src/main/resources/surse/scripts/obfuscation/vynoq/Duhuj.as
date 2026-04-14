package obfuscation.vynoq
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Weapon;
   
   public interface Duhuj
   {
      
      function start(param1:int) : void;
      
      function stop(param1:int) : void;
      
      function onTick(param1:Weapon, param2:Vector.<Body>, param3:Vector.<Number>, param4:Vector.<Vector3>, param5:int) : void;
   }
}

