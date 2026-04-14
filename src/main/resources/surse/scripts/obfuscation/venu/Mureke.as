package obfuscation.venu
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.WeaponObject;
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.samona.Diqije;
   
   public class Mureke
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var weakening:DistanceWeakening;
      
      private var impactForce:Number;
      
      private var kugesofoq:Diqije;
      
      private var sfxData:Kehyhyhy;
      
      private var callback:Jihidy;
      
      private var fomyw:Vokewi;
      
      public function Mureke(_arg_1:WeaponObject, _arg_2:Diqije, _arg_3:Kehyhyhy, _arg_4:Jihidy = null)
      {
         super();
         this.weakening = _arg_1.wazalaje();
         this.impactForce = _arg_1.cywyzugej().rokakop();
         this.kugesofoq = _arg_2;
         this.sfxData = _arg_3;
         this.fomyw = null;
         this.callback = _arg_4;
      }
      
      public function zira() : Qeg
      {
         var _local_1:Qeg = Qeg(battleService.getObjectPool().getObject(Qeg));
         _local_1.init(this.impactForce,this.kugesofoq,this.sfxData,this.weakening,this.callback,this.fomyw);
         return _local_1;
      }
   }
}

