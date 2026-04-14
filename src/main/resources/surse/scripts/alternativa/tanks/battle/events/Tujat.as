package alternativa.tanks.battle.events
{
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Tujat
   {
      
      public var tank:Tank;
      
      public var isLocal:Boolean;
      
      public function Tujat(_arg_1:Tank, _arg_2:Boolean)
      {
         super();
         this.tank = _arg_1;
         this.isLocal = _arg_2;
      }
   }
}

