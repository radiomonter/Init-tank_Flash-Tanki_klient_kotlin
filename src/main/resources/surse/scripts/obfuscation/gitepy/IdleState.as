package obfuscation.gitepy
{
   import alternativa.tanks.models.weapon.shaft.Byjujoqum;
   import alternativa.tanks.models.weapon.shaft.Hefad;
   import alternativa.tanks.models.weapon.shaft.Qyj;
   
   public class IdleState implements Boc
   {
      
      private var weapon:Byjujoqum;
      
      private var piru:Boolean;
      
      public function IdleState(_arg_1:Byjujoqum)
      {
         super();
         this.weapon = _arg_1;
      }
      
      public function enter(_arg_1:int) : void
      {
         this.piru = this.weapon.sybefe();
         this.weapon.cunaro(Hefad.RECHARGE);
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         if(this.piru)
         {
            this.lacoqik();
         }
      }
      
      public function exit() : void
      {
      }
      
      public function rawa(_arg_1:Qyj, _arg_2:*) : void
      {
         switch(_arg_1)
         {
            case Qyj.TRIGGER_PULL:
               this.zuqihafiq();
               return;
            case Qyj.TRIGGER_RELEASE:
               this.megosil();
         }
      }
      
      private function zuqihafiq() : void
      {
         if(!this.piru)
         {
            this.piru = true;
            this.lacoqik();
         }
      }
      
      private function megosil() : void
      {
         this.piru = false;
      }
      
      private function lacoqik() : void
      {
         if(this.weapon.fibanewe())
         {
            this.weapon.rawa(Qyj.READY_TO_SHOOT);
            this.piru = false;
         }
      }
   }
}

