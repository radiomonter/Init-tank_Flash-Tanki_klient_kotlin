package obfuscation.zima
{
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.WeaponObject;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.samelosin.Fabiwo;
   
   public class Jig implements Mol
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var qowir:CommonTargetEvaluator;
      
      private var bycuqobak:Number;
      
      private var vubucoz:Number;
      
      public function Jig(_arg_1:WeaponObject)
      {
         super();
         this.qowir = battleService.rep();
         this.vubucoz = this.mosez(_arg_1);
         var _local_2:Fabiwo = WeaponsManager.shotDatas[_arg_1.nac().turret.id];
         this.bycuqobak = Math.max(_local_2.dyrewuneb.value,_local_2.vom.value);
      }
      
      public function roruqily(_arg_1:Tank, _arg_2:Number, _arg_3:Number) : Number
      {
         return this.qowir.roruqily(_arg_1.qiniwu(),_arg_2,_arg_3,this.vubucoz,this.bycuqobak);
      }
      
      protected function mosez(_arg_1:WeaponObject) : Number
      {
         return _arg_1.wazalaje().mosez();
      }
   }
}

