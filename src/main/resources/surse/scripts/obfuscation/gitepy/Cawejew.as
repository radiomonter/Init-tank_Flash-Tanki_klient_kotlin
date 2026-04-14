package obfuscation.gitepy
{
   import alternativa.tanks.models.weapon.shaft.Byjujoqum;
   import alternativa.tanks.models.weapon.shaft.Qyj;
   
   public class Cawejew implements Boc
   {
      
      private var weapon:Byjujoqum;
      
      private var sulocaw:int;
      
      private var cemalihi:int;
      
      public function Cawejew(_arg_1:Byjujoqum, _arg_2:int)
      {
         super();
         this.weapon = _arg_1;
         this.sulocaw = _arg_2;
      }
      
      public function enter(_arg_1:int) : void
      {
         this.cemalihi = _arg_1 + this.sulocaw;
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         if(this.weapon.mofufuqo())
         {
            this.weapon.rawa(Qyj.STOP);
         }
         else if(_arg_1 >= this.cemalihi && this.weapon.nase(_arg_1) == this.weapon.jymon())
         {
            this.weapon.rawa(Qyj.SWITCH);
         }
      }
      
      public function exit() : void
      {
      }
      
      public function rawa(_arg_1:Qyj, _arg_2:*) : void
      {
         switch(_arg_1)
         {
            case Qyj.TRIGGER_RELEASE:
               this.weapon.rawa(Qyj.TRIGGER_RELEASE);
         }
      }
   }
}

