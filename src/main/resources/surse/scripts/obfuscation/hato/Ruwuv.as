package obfuscation.hato
{
   import alternativa.tanks.models.tank.Qemigofa;
   import flash.media.Sound;
   import obfuscation.bude.BattleTeam;
   import obfuscation.lozewaby.Guh;
   import obfuscation.syhis.Linebaz;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class Ruwuv
   {
      
      private var kyfyrid:Guh;
      
      private var rero:Linebaz;
      
      public function Ruwuv(_arg_1:Guh, _arg_2:Linebaz)
      {
         super();
         this.kyfyrid = _arg_1;
         this.rero = _arg_2;
      }
      
      private static function nysasakev(_arg_1:SoundResource) : Sound
      {
         if(_arg_1 == null)
         {
            return null;
         }
         return _arg_1.sound;
      }
      
      public function kumyqike(_arg_1:BattleTeam) : void
      {
         var _local_2:Sound = null;
         if(_arg_1 == Qemigofa.teamType)
         {
            _local_2 = nysasakev(this.rero.pointCaptureStartPositiveSound);
         }
         else
         {
            _local_2 = nysasakev(this.rero.pointCaptureStartNegativeSound);
         }
         this.kyfyrid.nekile(_local_2);
      }
      
      public function muqyjukin(_arg_1:BattleTeam) : void
      {
         var _local_2:Sound = null;
         if(_arg_1 == Qemigofa.teamType)
         {
            _local_2 = nysasakev(this.rero.pointCaptureStopNegativeSound);
         }
         else
         {
            _local_2 = nysasakev(this.rero.pointCaptureStopPositiveSound);
         }
         this.kyfyrid.nekile(_local_2);
      }
      
      public function tyvyzop(_arg_1:BattleTeam) : void
      {
         var _local_2:Sound = null;
         if(_arg_1 == Qemigofa.teamType)
         {
            _local_2 = nysasakev(this.rero.pointCapturedPositiveSound);
         }
         else
         {
            _local_2 = nysasakev(this.rero.pointCapturedNegativeSound);
         }
         this.kyfyrid.nekile(_local_2);
      }
      
      public function kope(_arg_1:BattleTeam) : void
      {
         var _local_2:Sound = null;
         if(_arg_1 == Qemigofa.teamType)
         {
            _local_2 = nysasakev(this.rero.pointNeutralizedNegativeSound);
         }
         else
         {
            _local_2 = nysasakev(this.rero.pointNeutralizedPositiveSound);
         }
         this.kyfyrid.nekile(_local_2);
      }
   }
}

