package obfuscation.garud
{
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.BitMask;
   import alternativa.tanks.utils.MathUtils;
   
   public class Giwomo
   {
      
      public static const cohenylic:int = 0;
      
      public static const hecega:int = 1;
      
      public static const lisihusah:int = 2;
      
      public static const tyn:int = 3;
      
      public static const qab:int = 4;
      
      protected var kyzoje:int;
      
      protected var zeh:int;
      
      private var tank:Tank;
      
      private var rituq:BitMask = new BitMask();
      
      public function Giwomo(_arg_1:Tank)
      {
         super();
         this.tank = _arg_1;
      }
      
      public function isEnabled() : Boolean
      {
         return this.rituq.isEmpty();
      }
      
      public function lock(_arg_1:int) : void
      {
         var _local_2:Boolean = this.isEnabled();
         this.rituq.setBits(_arg_1);
         if(_local_2 && !this.isEnabled())
         {
            this.vunew(0);
         }
      }
      
      public function unlock(_arg_1:int) : void
      {
         var _local_2:Boolean = this.isEnabled();
         this.rituq.clearBits(_arg_1);
         if(this.isEnabled() && !_local_2)
         {
            this.vunew(this.kyzoje);
         }
      }
      
      public function ligirom() : int
      {
         return !this.isEnabled() ? int(0) : int(this.kyzoje);
      }
      
      public function rolo(_arg_1:int) : void
      {
         this.kyzoje = _arg_1;
         if(this.isEnabled())
         {
            this.vunew(_arg_1);
         }
      }
      
      private function vunew(_arg_1:int) : void
      {
         var _local_2:int = this.zeh;
         this.zeh = _arg_1;
         var _local_3:int = MathUtils.getBitValue(_arg_1,cohenylic) - MathUtils.getBitValue(_arg_1,hecega);
         var _local_4:Number = MathUtils.getBitValue(_arg_1,lisihusah) - MathUtils.getBitValue(_arg_1,tyn);
         this.tank.wumuwis(_local_3,_local_4,MathUtils.getBitValue(_arg_1,qab) == 1);
         if(_local_2 != this.zeh)
         {
            this.verimiji(this.zeh);
         }
      }
      
      protected function verimiji(_arg_1:int) : void
      {
      }
      
      protected function wybejazav() : Tank
      {
         return this.tank;
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         this.tank = null;
      }
   }
}

