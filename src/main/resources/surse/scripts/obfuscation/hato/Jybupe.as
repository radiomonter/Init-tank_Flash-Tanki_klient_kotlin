package obfuscation.hato
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import flash.media.Sound;
   
   public class Jybupe
   {
      
      private var battleService:BattleService;
      
      private var wudehypyb:Sound;
      
      private var faguzev:Sound;
      
      private var pudeveka:Vyjazoc;
      
      private var tygo:Vyjazoc;
      
      public function Jybupe(_arg_1:BattleService, _arg_2:Sound, _arg_3:Sound)
      {
         super();
         this.battleService = _arg_1;
         this.wudehypyb = _arg_2;
         this.faguzev = _arg_3;
      }
      
      public function wowahi(_arg_1:Vector3) : void
      {
         this.fij();
         if(this.pudeveka == null)
         {
            this.pudeveka = Vyjazoc(this.battleService.getObjectPool().getObject(Vyjazoc));
            this.pudeveka.init(this.wudehypyb,_arg_1);
            this.battleService.getBattleRunner().lokezi().vakydiqip(this.pudeveka);
         }
      }
      
      public function jejipyqan(_arg_1:Vector3) : void
      {
         this.qezipag();
         if(this.tygo == null)
         {
            this.tygo = Vyjazoc(this.battleService.getObjectPool().getObject(Vyjazoc));
            this.tygo.init(this.faguzev,_arg_1);
            this.battleService.getBattleRunner().lokezi().vakydiqip(this.tygo);
         }
      }
      
      public function luqire() : void
      {
         this.qezipag();
         this.fij();
      }
      
      private function fij() : void
      {
         if(this.tygo != null)
         {
            this.tygo.kill();
            this.tygo = null;
         }
      }
      
      private function qezipag() : void
      {
         if(this.pudeveka != null)
         {
            this.pudeveka.kill();
            this.pudeveka = null;
         }
      }
   }
}

