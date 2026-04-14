package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.objects.Decal;
   
   public class DecalEntry
   {
      
      public var tol:Decal;
      
      public var startTime:int;
      
      public function DecalEntry(_arg_1:Decal, _arg_2:int)
      {
         super();
         this.tol = _arg_1;
         this.startTime = _arg_2;
      }
   }
}

