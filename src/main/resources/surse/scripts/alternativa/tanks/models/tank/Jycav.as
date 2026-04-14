package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.objects.tank.tankskin.Lehumoryg;
   import flash.utils.Dictionary;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   internal class Jycav
   {
      
      private var numoq:Dictionary = new Dictionary();
      
      public function Jycav()
      {
         super();
      }
      
      public function cipylu(_arg_1:Tanks3DSResource) : Lehumoryg
      {
         var _local_2:Lehumoryg = this.numoq[_arg_1.id];
         if(_local_2 == null)
         {
            _local_2 = new Lehumoryg(_arg_1);
            this.numoq[_arg_1.id] = _local_2;
         }
         return _local_2;
      }
   }
}

