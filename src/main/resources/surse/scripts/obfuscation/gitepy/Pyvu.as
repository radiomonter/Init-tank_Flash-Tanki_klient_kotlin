package obfuscation.gitepy
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.Tank;
   
   public class Pyvu
   {
      
      private var tank:Tank;
      
      private var cyziwaf:Vector3 = new Vector3();
      
      private var fowesudyw:Vector3 = new Vector3();
      
      public function Pyvu()
      {
         super();
      }
      
      public function reme(_arg_1:Vector3, _arg_2:Tank = null) : void
      {
         this.cyziwaf.copy(_arg_1);
         this.tank = _arg_2;
         if(this.gapyfagy())
         {
            this.fowesudyw.copy(_arg_1);
            BattleUtils.globalToLocal(_arg_2.qiniwu(),this.fowesudyw);
         }
      }
      
      public function gapyfagy() : Boolean
      {
         return this.tank != null && this.tank.bij().repijumu() != null;
      }
      
      public function wybejazav() : Tank
      {
         return this.tank;
      }
      
      public function lopajujyp() : Vector3
      {
         return this.cyziwaf;
      }
      
      public function heli() : Vector3
      {
         return this.fowesudyw;
      }
      
      public function reset() : void
      {
         this.tank = null;
         this.cyziwaf.reset();
         this.fowesudyw.reset();
      }
   }
}

