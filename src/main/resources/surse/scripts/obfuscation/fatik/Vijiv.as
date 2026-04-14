package obfuscation.fatik
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.WeaponObject;
   import obfuscation.buzoduhe.Vokewi;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.kewic.Pafijoban;
   
   public class Vijiv
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var impactForce:Number;
      
      private var sfxData:Lujimarem;
      
      private var weakening:DistanceWeakening;
      
      private var callback:Vanebegum;
      
      private var fomyw:Vokewi;
      
      private var padu:Pafijoban;
      
      public function Vijiv(_arg_1:WeaponObject, _arg_2:Pafijoban, _arg_3:Lujimarem, _arg_4:Vanebegum = null)
      {
         super();
         this.padu = _arg_2;
         this.impactForce = _arg_1.cywyzugej().rokakop();
         this.sfxData = _arg_3;
         this.weakening = _arg_1.wazalaje();
         this.fomyw = null;
         this.callback = _arg_4;
      }
      
      public function zira() : Pizafi
      {
         var _local_1:Pizafi = Pizafi(battleService.getObjectPool().getObject(Pizafi));
         _local_1.init(this.impactForce,this.padu,this.sfxData,this.weakening,this.callback,this.fomyw);
         return _local_1;
      }
   }
}

