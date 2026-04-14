package alternativa.tanks.models.weapons.targeting
{
   import alternativa.object.ClientObject;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapons.targeting.priority.Fylem;
   import obfuscation.kajiz.Dapynoc;
   import obfuscation.qejoqa.Sohok;
   import obfuscation.zima.Jig;
   
   public class Qibakid extends Fetajid
   {
      
      public function Qibakid(_arg_1:ClientObject, _arg_2:WeaponObject, _arg_3:Number)
      {
         var _local_4:Fylem = new Fylem(new Jig(_arg_2));
         super(new Sohok(_arg_1,_arg_3,_local_4),new Dapynoc(_arg_1,_arg_3),_local_4);
      }
   }
}

