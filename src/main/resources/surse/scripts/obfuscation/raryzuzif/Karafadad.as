package obfuscation.raryzuzif
{
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.primitives.Plane;
   
   public class Karafadad extends BSP
   {
      
      public function Karafadad()
      {
         super();
         var _local_1:Plane = new Plane();
         createTree(_local_1);
         z = -20000;
         name = "static";
      }
   }
}

