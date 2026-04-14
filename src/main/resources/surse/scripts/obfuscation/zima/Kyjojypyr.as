package obfuscation.zima
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.samelosin.Fabiwo;
   
   public class Kyjojypyr implements Mol
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const rynivitoq:Number = 10000000000;
      
      private var qowir:CommonTargetEvaluator;
      
      private var bycuqobak:Number;
      
      public function Kyjojypyr(_arg_1:String)
      {
         super();
         this.qowir = battleService.rep();
         var _local_2:Fabiwo = WeaponsManager.shotDatas[_arg_1];
         this.bycuqobak = Math.max(_local_2.dyrewuneb.value,_local_2.vom.value);
      }
      
      public function roruqily(_arg_1:Tank, _arg_2:Number, _arg_3:Number) : Number
      {
         return this.qowir.roruqily(_arg_1.qiniwu(),_arg_2,_arg_3,this.rynivitoq,this.bycuqobak);
      }
   }
}

