package alternativa.tanks.models.weapon.shaft
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.WeaponObject;
   import fominskiy.tanks.WeaponsManager;
   
   public class Wyd extends WeaponObject
   {
      
      public function Wyd(_arg_1:ClientObject)
      {
         super(_arg_1);
      }
      
      public function fireru() : Roguqine
      {
         var _local_1:Mili = WeaponsManager.getShaftSFX(object);
         return _local_1.fireru(object);
      }
   }
}

