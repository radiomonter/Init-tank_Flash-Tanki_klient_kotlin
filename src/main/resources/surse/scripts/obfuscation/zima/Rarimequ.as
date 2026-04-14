package obfuscation.zima
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import alternativa.tanks.models.weapon.shared.Zyzeri;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.samelosin.Fabiwo;
   
   public class Rarimequ implements Mol
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const purihynuv:Number = 0.000001;
      
      private const sokeh:Number = 10000;
      
      private var qowir:CommonTargetEvaluator;
      
      private var vypycira:Zyzeri;
      
      private var bycuqobak:Number;
      
      public function Rarimequ(_arg_1:String)
      {
         super();
         this.qowir = battleService.rep();
         this.vypycira = battleService.bepupyba();
         var _local_2:Fabiwo = WeaponsManager.shotDatas[_arg_1];
         this.bycuqobak = Math.max(_local_2.dyrewuneb.value,_local_2.vom.value);
      }
      
      public function roruqily(_arg_1:Tank, _arg_2:Number, _arg_3:Number) : Number
      {
         var _local_4:Body = _arg_1.qiniwu();
         var _local_5:Number = this.qowir.roruqily(_local_4,_arg_2,_arg_3,this.sokeh,this.bycuqobak);
         return this.vypycira.bokepowan(_local_4) + _local_5 * this.purihynuv;
      }
   }
}

