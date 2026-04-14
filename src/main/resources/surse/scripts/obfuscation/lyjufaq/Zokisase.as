package obfuscation.lyjufaq
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.bez.Lij;
   
   public class Zokisase extends PooledObject
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private var states:Vector.<Lij> = new Vector.<Lij>();
      
      private var toci:Vector3 = new Vector3();
      
      private var tibirise:Vector3 = new Vector3();
      
      private var loned:Vector3 = new Vector3();
      
      private var pyvef:Vector3 = new Vector3();
      
      private var lyqu:int;
      
      private var startTime:int;
      
      private var qaquraj:int;
      
      private var qybagok:Boolean;
      
      public function Zokisase(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function kygo() : Vector3
      {
         return this.toci;
      }
      
      public function katykuner() : Vector3
      {
         return this.tibirise;
      }
      
      public function bujew() : int
      {
         return this.qaquraj;
      }
      
      public function cyfozij() : int
      {
         return battleService.getBattleRunner().hulivyjam() + BattleRunner.rasomil - this.startTime - this.qaquraj;
      }
      
      public function start(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.states.length = 0;
         this.toci.copy(_arg_1);
         this.tibirise.copy(_arg_2);
         this.startTime = battleService.getBattleRunner().hulivyjam();
         this.qaquraj = 0;
         this.qybagok = true;
      }
      
      public function updateState(_arg_1:Vector3, _arg_2:Vector3, _arg_3:int = 666666) : void
      {
         if(Zicoha.fyfujuwub(this.toci,_arg_1))
         {
            this.saqufu();
         }
         this.loned.copy(_arg_1);
         this.pyvef.copy(_arg_2);
         this.lyqu = battleService.getBattleRunner().hulivyjam() + Math.min(_arg_3,BattleRunner.rasomil) - this.startTime;
         this.qybagok = false;
      }
      
      public function ges() : Vector.<Lij>
      {
         this.saqufu();
         return this.states;
      }
      
      public function saqufu() : void
      {
         if(!this.qybagok)
         {
            this.states.push(new Lij(this.lyqu,this.pyvef.toVector3d(),this.loned.toVector3d()));
            this.qaquraj = this.lyqu;
            this.toci.copy(this.loned);
            this.tibirise.copy(this.pyvef);
            this.qybagok = true;
         }
      }
      
      public function destroy() : void
      {
         this.states.length = 0;
         recycle();
      }
   }
}

