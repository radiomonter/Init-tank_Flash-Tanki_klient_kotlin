package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public interface ITankModel
   {
      
      function getTankData(param1:ClientObject) : Num;
      
      function update(param1:Tank, param2:int, param3:int, param4:Number, param5:Number, param6:Vector3) : void;
   }
}

