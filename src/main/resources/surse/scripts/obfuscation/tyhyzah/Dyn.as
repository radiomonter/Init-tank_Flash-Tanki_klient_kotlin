package obfuscation.tyhyzah
{
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.CommonTargetEvaluator;
   import alternativa.tanks.models.weapon.shared.Qunomili;
   import obfuscation.hasitaze.Rajyc;
   import obfuscation.zima.Mol;
   
   public class Dyn implements Mol
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private const purihynuv:Number = 0.0001;
      
      private const pazuvid:Number = 50;
      
      private const nojobawac:Number = 100;
      
      private var qowir:CommonTargetEvaluator;
      
      private var vypycira:Qunomili;
      
      private var bycuqobak:Number;
      
      private var vubucoz:Number;
      
      private var target:Tank;
      
      public function Dyn(_arg_1:Rajyc)
      {
         super();
         this.qowir = battleService.rep();
         this.vypycira = battleService.hacuqajy();
         this.vubucoz = _arg_1.radius - this.pazuvid;
         this.bycuqobak = _arg_1.coneAngle;
      }
      
      public function juvilyvyb(_arg_1:Tank) : void
      {
         this.target = _arg_1;
      }
      
      public function doverizu() : void
      {
         this.target = null;
      }
      
      public function roruqily(_arg_1:Tank, _arg_2:Number, _arg_3:Number) : Number
      {
         if(_arg_1.tankData.health == 0)
         {
            return 0;
         }
         var _local_4:Body = _arg_1.qiniwu();
         var _local_5:Number = this.qowir.roruqily(_local_4,_arg_2,_arg_3,this.vubucoz,this.bycuqobak);
         return this.vypycira.roruqily(_local_4) + _local_5 * this.purihynuv + this.cewigoh(_arg_1);
      }
      
      private function cewigoh(_arg_1:Tank) : Number
      {
         return _arg_1 != this.target ? Number(0) : Number(this.nojobawac);
      }
   }
}

