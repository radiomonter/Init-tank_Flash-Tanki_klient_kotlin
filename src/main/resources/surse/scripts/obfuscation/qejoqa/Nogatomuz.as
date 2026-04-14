package obfuscation.qejoqa
{
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.services.tankregistry.TankUsersRegistry;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.samelosin.Fabiwo;
   
   public class Nogatomuz
   {
      
      [Inject]
      public static var derys:TankUsersRegistry;
      
      private var suvomyr:Vector3 = new Vector3();
      
      private var self:ClientObject;
      
      private var fesuhum:Number;
      
      public function Nogatomuz(_arg_1:ClientObject, _arg_2:Number)
      {
         super();
         this.self = _arg_1;
         this.fesuhum = _arg_2;
      }
      
      public function kiduzozik(_arg_1:AllGlobalGunParams) : Vector.<Lyd>
      {
         var _local_2:ClientObject = null;
         var _local_3:Vector.<Lyd> = new Vector.<Lyd>();
         this.suvomyr.cross2(_arg_1.navi,_arg_1.direction);
         for each(_local_2 in derys.wakosibi())
         {
            if(_local_2 != this.self)
            {
               this.qyzybe(_arg_1,this.suvomyr,this.wybejazav(_local_2),_local_3);
            }
         }
         return _local_3;
      }
      
      private function qyzybe(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:Tank, _arg_4:Vector.<Lyd>) : void
      {
         var _local_5:Vector3 = BattleUtils.vemoleg;
         _local_5.diff(_arg_3.qiniwu().state.position,_arg_1.hiwanu);
         var _local_6:Number = _local_5.length();
         var _local_7:Number = Math.max(0,_local_5.length() - _arg_3.wilurip());
         if(_local_7 > this.fesuhum)
         {
            return;
         }
         var _local_8:Vector3 = _arg_1.navi;
         var _local_9:Vector3 = _arg_1.direction;
         var _local_10:Number = _local_5.dot(_local_8);
         var _local_11:Number = _local_5.dot(_local_9);
         var _local_12:Number = _local_5.dot(_arg_2);
         var _local_13:Number = Math.atan2(_local_10,_local_11);
         var _local_14:Number = Math.atan2(_local_12,_local_11);
         var _local_15:Number = Math.min(_arg_3.wilurip(),_local_6);
         var _local_16:Number = Math.asin(_local_15 / _local_6);
         var _local_17:Number = _local_16;
         var _local_18:Number = _local_16;
         if(Math.abs(_local_13) > _local_17)
         {
            return;
         }
         var _local_19:Fabiwo = WeaponsManager.shotDatas[this.wybejazav(this.self).tankData.turret.id];
         var _local_20:Number = Math.max(_local_14 - _local_18,-_local_19.dyrewuneb.value);
         var _local_21:Number = Math.min(_local_14 + _local_18,_local_19.vom.value);
         if(_local_20 < _local_21)
         {
            _arg_4.push(new Lyd(_local_20,_local_21,_local_7,_arg_3));
         }
      }
      
      private function wybejazav(_arg_1:ClientObject) : Tank
      {
         var _local_2:TankModel = TankModel(OSGi.getInstance().getService(ITankModel));
         return _local_2.getTankData(_arg_1).tank;
      }
   }
}

