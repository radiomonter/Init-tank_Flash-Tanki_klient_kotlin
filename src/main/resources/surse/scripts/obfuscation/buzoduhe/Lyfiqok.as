package obfuscation.buzoduhe
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.weapon.WeaponConst;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.kyre.Vuwuci;
   import obfuscation.pekyfo.Buf;
   import obfuscation.pekyfo.Byma;
   import obfuscation.pekyfo.Sah;
   
   public class Lyfiqok extends Sah implements Buf, Vokewi
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const qisyhalol:Vector3 = new Vector3();
      
      private static const lalozu:Vector3 = new Vector3();
      
      private static const vector:Vector3 = new Vector3();
      
      private static const fawevotoj:RayHit = new RayHit();
      
      public function Lyfiqok()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         var _local_3:Luvidiki = null;
         var _local_2:Byma = getInitParam();
         if(_local_2 != null)
         {
            _local_3 = new Luvidiki(BattleUtils.pamo(_local_2.radiusOfMaxSplashDamage),BattleUtils.pamo(_local_2.splashDamageRadius),_local_2.minSplashDamagePercent,_local_2.impactForce * WeaponConst.hetohiky.getNumber());
         }
         _arg_1.putParams(Luvidiki,_local_3);
      }
      
      public function byf(_arg_1:ClientObject, _arg_2:Vector3, _arg_3:Number, _arg_4:Body, _arg_5:Vector.<String> = null, _arg_6:Vector.<Number> = null) : Boolean
      {
         var _local_7:Vuwuci = null;
         var _local_8:Body = null;
         var _local_9:Tank = null;
         var _local_10:Vector3 = null;
         var _local_11:Number = NaN;
         var _local_12:Luvidiki = Luvidiki(_arg_1.getParams(Luvidiki));
         if(_local_12 == null)
         {
            return false;
         }
         var _local_13:Number = _local_12.wozoj() * _local_12.wozoj();
         var _local_14:TanksCollisionDetector = battleService.getBattleRunner().soc();
         for each(_local_7 in _local_14.getTankBodies())
         {
            _local_8 = _local_7.body;
            _local_9 = _local_8.tank;
            if(_local_9.state == ClientTankState.neqahi && _local_8 != _arg_4)
            {
               _local_10 = _local_9.qiniwu().state.position;
               qisyhalol.diff(_local_10,_arg_2);
               _local_11 = qisyhalol.lengthSqr();
               if(_local_11 <= _local_13)
               {
                  if(!this.qoz(_local_9,_arg_2))
                  {
                     if(_arg_5 != null && _arg_6 != null)
                     {
                        _arg_5.push(_local_9.bebosaca().id);
                        _arg_6.push(Math.sqrt(_local_11) * 0.01);
                     }
                     lalozu.copy(qisyhalol);
                     lalozu.normalize();
                     _local_9.tyvedyz(_local_9.qiniwu().state.position,lalozu,_arg_3 * _local_12.rokakop(Math.sqrt(_local_11)));
                  }
               }
            }
         }
         return true;
      }
      
      private function qoz(_arg_1:Tank, _arg_2:Vector3) : Boolean
      {
         var _local_3:Body = _arg_1.qiniwu();
         var _local_4:Number = 0.75 * _arg_1.ruh();
         return this.qoru(_arg_2,_local_3,0) && this.qoru(_arg_2,_local_3,-_local_4) && this.qoru(_arg_2,_local_3,_local_4);
      }
      
      private function qoru(_arg_1:Vector3, _arg_2:Body, _arg_3:Number) : Boolean
      {
         vector.reset(0,_arg_3,0);
         vector.transform3(_arg_2.baseMatrix);
         vector.add(_arg_2.state.position);
         vector.subtract(_arg_1);
         var _local_4:TanksCollisionDetector = battleService.getBattleRunner().soc();
         return _local_4.raycastStatic(_arg_1,vector,Myw.dyhan,1,null,fawevotoj);
      }
   }
}

