package alternativa.tanks.camera
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public interface Rabysame extends Maf
   {
      
      function get lamyb() : Number;
      
      function set lamyb(param1:Number) : void;
      
      function deactivate() : void;
      
      function activate() : void;
      
      function muduqi(param1:Boolean) : void;
      
      function ganes(param1:Vector3, param2:Vector3) : void;
      
      function set tank(param1:Tank) : void;
      
      function get tank() : Tank;
      
      function sumojaby(param1:Kaweras) : void;
      
      function lurel() : void;
      
      function ruvuruc(param1:Vector3, param2:Vector3, param3:Vector3, param4:Vector3) : void;
   }
}

