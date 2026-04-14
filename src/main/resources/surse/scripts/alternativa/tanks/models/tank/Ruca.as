package alternativa.tanks.models.tank
{
   import flash.utils.Dictionary;
   import obfuscation.jebucahu.Dego;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   internal class Ruca
   {
      
      private var kilo:Dictionary = new Dictionary();
      
      public function Ruca()
      {
         super();
      }
      
      public function fidywy(_arg_1:Tanks3DSResource) : Dego
      {
         var _local_2:Dego = this.kilo[_arg_1.id];
         if(_local_2 == null)
         {
            _local_2 = new Dego(_arg_1);
            this.kilo[_arg_1.id] = _local_2;
         }
         return _local_2;
      }
   }
}

