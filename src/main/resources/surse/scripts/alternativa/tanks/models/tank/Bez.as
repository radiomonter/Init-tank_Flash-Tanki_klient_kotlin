package alternativa.tanks.models.tank
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.BodyState;
   import alternativa.tanks.battle.BattleRunner;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.PostPhysicsController;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.Vibu;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.kyre.Wyhe;
   
   public class Bez extends BattleRunnerProvider implements PostPhysicsController
   {
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private static const naq:Number = 2;
      
      private static const necuraf:EncryptedInt = new EncryptedIntImpl(1000);
      
      private static const vynezyref:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const rynivitoq:Number = 500;
      
      private static const najylob:Number = 200;
      
      private static const sogaty:Number = rynivitoq * rynivitoq;
      
      private static const lacesed:Number = 300000;
      
      private var tank:Tank;
      
      private var cuhom:int;
      
      private var mozuq:Vector3 = new Vector3();
      
      private var mefomaquj:Number;
      
      private var tov:Dictionary;
      
      private var qejefiw:int;
      
      private var riseb:Boolean;
      
      private var posoqegy:Boolean;
      
      private var dejysa:Baba;
      
      private var hifyzih:Boolean = false;
      
      public function Bez(_arg_1:Tank, _arg_2:Dictionary)
      {
         super();
         this.tank = _arg_1;
         this.tov = _arg_2;
         this.posoqegy = true;
         this.dejysa = new Baba(battleEventDispatcher);
         this.dejysa.jikina(Vibu,this.hoc);
         this.dejysa.bijoja();
      }
      
      private function hoc(_arg_1:Object) : void
      {
         this.posoqegy = true;
      }
      
      public function reset() : void
      {
         this.cuhom = fahysemas().hulivyjam();
         this.mozuq.copy(this.zyso());
         this.qejefiw = this.tank.hot().legugequp + this.tank.tanazisom().legugequp;
         this.riseb = this.tank.tosakena() || this.tank.bozydene();
         this.mefomaquj = this.nase();
      }
      
      public function jatil(_arg_1:Number) : void
      {
         var _local_2:Body = null;
         var _local_3:Boolean = this.soqydyna() || this.posoqegy;
         this.posoqegy = false;
         if(this.tank.bozydene())
         {
            for each(_local_2 in this.tank.bic())
            {
            }
         }
         if(this.gezoc() || this.tank.qycehy())
         {
            this.gipibos();
         }
         if(_local_3 || this.wucycup())
         {
            this.pofobo(_local_3);
            this.hifyzih = false;
         }
      }
      
      private function gezoc() : Boolean
      {
         return Zicoha.fyfujuwub(this.mozuq,this.tank.qiniwu().state.position);
      }
      
      private function gipibos() : void
      {
         this.cuhom = fahysemas().hulivyjam() - BattleRunner.rasomil;
         this.mozuq.copy(this.tipihu());
         this.dijobesi().kaj(true);
      }
      
      private function tipihu() : Vector3
      {
         return this.tank.qiniwu().prevState.position;
      }
      
      private function wucycup() : Boolean
      {
         return this.bimaje() || this.hifyzih;
      }
      
      private function soqydyna() : Boolean
      {
         return this.qiwo() || this.logos() || this.fulikebig() || this.huwy() || this.qeroba() || this.fyrok() || this.tank.lidelej() || this.tank.ruf();
      }
      
      public function pyhukal() : void
      {
         this.hifyzih = true;
      }
      
      private function qeroba() : Boolean
      {
         var _local_1:Boolean = this.tank.tosakena() || this.tank.bozydene();
         return _local_1 != this.riseb;
      }
      
      private function huwy() : Boolean
      {
         var _local_1:int = this.tank.hot().legugequp + this.tank.tanazisom().legugequp;
         return this.qejefiw == 0 && _local_1 != 0 || this.qejefiw != 0 && _local_1 == 0;
      }
      
      private function bimaje() : Boolean
      {
         return fahysemas().hulivyjam() - this.cuhom >= vynezyref.getInt();
      }
      
      private function qiwo() : Boolean
      {
         return this.mozuq.distanceToXYSquared(this.zyso()) > sogaty;
      }
      
      private function logos() : Boolean
      {
         return Math.abs(this.mozuq.z - this.zyso().z) > najylob;
      }
      
      private function pofobo(_arg_1:Boolean) : void
      {
         this.reset();
         this.dijobesi().lysi(_arg_1);
      }
      
      private function zyso() : Vector3
      {
         return this.tank.qiniwu().state.position;
      }
      
      private function fyrok() : Boolean
      {
         var _local_1:Number = this.nase() - this.mefomaquj;
         return _local_1 > lacesed;
      }
      
      private function fulikebig() : Boolean
      {
         var _local_1:int = necuraf.getInt();
         return this.hovu() && getTimer() - this.cuhom > _local_1;
      }
      
      private function nase() : Number
      {
         var _local_1:BodyState = this.tank.qiniwu().state;
         var _local_2:Number = _local_1.position.z * Math.abs(fahysemas().nifa());
         var _local_3:Number = _local_1.velocity.length();
         var _local_4:Number = _local_3 * _local_3 * 0.5;
         return _local_4 + _local_2;
      }
      
      private function hovu() : Boolean
      {
         var _local_1:Tank = null;
         var _local_2:Body = null;
         var _local_3:BodyState = null;
         var _local_10:* = undefined;
         var _local_4:Body = this.tank.qiniwu();
         var _local_5:BodyState = _local_4.state;
         var _local_6:Number = this.tank.wilurip();
         var _local_7:Number = naq;
         for each(var _loc11_ in this.tov)
         {
            _local_10 = _loc11_;
            _loc11_;
            _local_1 = _local_10;
            _local_10;
            if(this.tank != _local_1)
            {
               _local_2 = _local_1.qiniwu();
               _local_3 = _local_2.state;
               if(Wyhe.test(_local_5.position,_local_5.velocity,_local_6,_local_3.position,_local_3.velocity,_local_1.wilurip(),_local_7))
               {
                  return true;
               }
            }
         }
         return false;
      }
      
      private function dijobesi() : TankModel
      {
         return TankModel(OSGi.getInstance().getService(ITankModel));
      }
   }
}

