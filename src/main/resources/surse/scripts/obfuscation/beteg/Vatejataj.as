package obfuscation.beteg
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.events.Baba;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Mawi;
   import alternativa.tanks.battle.events.Senyveky;
   import alternativa.tanks.battle.events.Vegepos;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.battle.objects.tank.Weapon;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.IWeaponModel;
   import alternativa.tanks.models.weapon.shared.Lerih;
   import flash.utils.Dictionary;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.hasitaze.Fije;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.hasitaze.Qufami;
   import obfuscation.hasitaze.Rajyc;
   import obfuscation.kofen.Vector3d;
   import obfuscation.migyqis.Jaquz;
   
   public class Vatejataj extends Fije implements Qufami, BattleEventListener, IWeaponModel, Gicegepy
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      private var vemoleg:Vector3 = new Vector3();
      
      private var localHitPoint:Vector3d = new Vector3d();
      
      private var tov:Dictionary = new Dictionary();
      
      private var dejysa:Baba;
      
      public function Vatejataj()
      {
         super();
         this.dejysa = new Baba(battleEventDispatcher,this);
         this.dejysa.jikina(Senyveky,this.serupunil);
         this.dejysa.jikina(Mawi,this.divy);
         this.dejysa.bijoja();
      }
      
      private static function fireru(_arg_1:ClientObject) : Homas
      {
         var _local_2:Jaj = WeaponsManager.getIsidaSFX(_arg_1);
         return _local_2.givyjadif(_arg_1);
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_2:Rajyc = getInitParam();
         _local_2.radius = BattleUtils.pamo(_local_2.radius);
         _arg_1.putParams(Rajyc,_local_2);
      }
      
      [Obfuscation(rename="false")]
      public function juvilyvyb(_arg_1:ClientObject, _arg_2:Gypuza, _arg_3:Jaquz) : void
      {
         this.rojad(_arg_1,_arg_2,_arg_3);
      }
      
      [Obfuscation(rename="false")]
      public function kycohafo(_arg_1:ClientObject) : void
      {
         var _local_2:Nuri = this.suvyvuq(_arg_1);
         if(_local_2 != null)
         {
            _local_2.stop();
         }
      }
      
      [Obfuscation(rename="false")]
      public function doverizu(_arg_1:ClientObject) : void
      {
         var _local_2:Nuri = this.suvyvuq(_arg_1);
         _local_2.doverizu();
      }
      
      public function kyqyqemy(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Num = TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(_arg_1);
         var _local_3:Homas = fireru(_arg_1);
         return new Futybywil(_arg_1,_local_2.turret.getParams(Rajyc) as Rajyc,new Lerih(),_local_3,this);
      }
      
      public function zigaguj(_arg_1:ClientObject) : Weapon
      {
         var _local_2:Weapon = new Nuri(fireru(_arg_1));
         _arg_1.putParams(Nuri,_local_2);
         return _local_2;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         this.dejysa.handleBattleEvent(_arg_1);
      }
      
      public function kaludapy(_arg_1:int, _arg_2:RayHit) : void
      {
         var _local_3:Body = null;
         var _local_4:Tank = null;
         if(_arg_2 != null)
         {
            _local_3 = _arg_2.shape.body;
            _local_4 = _local_3.tank;
            _local_4.fif(_arg_2.position);
            server.juvilyvyb(_arg_1,_local_4.bebosaca(),_local_4.incarnation,this.fejewewa(_arg_2));
         }
         else
         {
            server.doverizu(_arg_1);
         }
      }
      
      public function stop(_arg_1:int) : void
      {
         server.qadazudas(_arg_1);
      }
      
      public function onTick(_arg_1:int, _arg_2:RayHit) : void
      {
         this.dejysa.dispatchEvent(Vegepos.figahe);
         var _local_3:Body = _arg_2.shape.body;
         var _local_4:Tank = _local_3.tank;
         server.hivuca(_arg_1,_local_4.incarnation,BattleUtils.tazotipo(_local_3.state.position),this.fejewewa(_arg_2));
      }
      
      private function rojad(_arg_1:ClientObject, _arg_2:Gypuza, _arg_3:Jaquz) : void
      {
         var _local_4:Tank = null;
         var _local_5:Vector3 = null;
         var _local_6:Vector3d = null;
         var _local_7:Nuri = this.suvyvuq(_arg_1);
         if(_local_7 != null)
         {
            if(_arg_2 != Gypuza.IDLE)
            {
               if(_arg_3 != null && _arg_3.target != null)
               {
                  _local_4 = this.tov[_arg_3.target.id];
               }
            }
            if(_arg_2 == Gypuza.IDLE || _local_4 != null)
            {
               _local_5 = this.vemoleg;
               _local_6 = _arg_3.localHitPoint;
               _local_5.reset(_local_6.x,_local_6.y,_local_6.z);
               _local_7.jagu(_arg_2,_local_4,_local_5);
            }
            else
            {
               _local_7.stop();
            }
         }
      }
      
      private function fejewewa(_arg_1:RayHit) : Vector3d
      {
         var _local_2:Body = _arg_1.shape.body;
         var _local_3:Vector3 = BattleUtils.vemoleg;
         _local_3.copy(_arg_1.position);
         BattleUtils.globalToLocal(_local_2,_local_3);
         BattleUtils.colufugi(_local_3,this.localHitPoint);
         return this.localHitPoint;
      }
      
      private function serupunil(_arg_1:Senyveky) : void
      {
         this.tov[_arg_1.tank.bebosaca().id] = _arg_1.tank;
      }
      
      private function divy(_arg_1:Mawi) : void
      {
         delete this.tov[_arg_1.tank.bebosaca().id];
      }
      
      private function suvyvuq(_arg_1:ClientObject) : Nuri
      {
         return Nuri(_arg_1.getParams(Nuri));
      }
   }
}

