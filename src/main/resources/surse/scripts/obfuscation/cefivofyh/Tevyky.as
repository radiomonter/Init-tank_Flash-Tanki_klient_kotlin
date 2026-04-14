package obfuscation.cefivofyh
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleUtils;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.weakening.IWeaponWeakeningModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.weakening.WeaponWeakeningModelBase;
   
   public class Tevyky extends WeaponWeakeningModelBase implements IWeaponWeakeningModelBase, Puwid
   {
      
      public function Tevyky()
      {
         super();
         _interfaces.push(IModel,IWeaponWeakeningModelBase,Puwid);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         var _local_5:Desek = new Desek();
         _local_5.muku = isNaN(_arg_2) ? 0 : BattleUtils.pamo(_arg_2);
         _local_5.cuqutel = isNaN(_arg_4) ? 1 : BattleUtils.pamo(_arg_4);
         _local_5.nudonywo = isNaN(_arg_3) ? 0 : _arg_3;
         _local_5.rowurasof = _local_5.cuqutel - _local_5.muku;
         if(_local_5.nudonywo > 100)
         {
            _local_5.nudonywo = 100;
         }
         _arg_1.putParams(Tevyky,_local_5);
      }
      
      public function sygyta(_arg_1:ClientObject, _arg_2:Number) : Number
      {
         var _local_3:Desek = _arg_1.getParams(Tevyky) as Desek;
         if(_local_3.rowurasof <= 0)
         {
            return 1;
         }
         if(_arg_2 <= _local_3.muku)
         {
            return 1;
         }
         if(_arg_2 >= _local_3.cuqutel)
         {
            return 0.01 * _local_3.nudonywo;
         }
         return 0.01 * (_local_3.nudonywo + (_local_3.cuqutel - _arg_2) * (100 - _local_3.nudonywo) / _local_3.rowurasof);
      }
      
      public function ridofefac(_arg_1:ClientObject) : Number
      {
         var _local_2:Desek = Desek(_arg_1.getParams(Tevyky));
         return _local_2.muku * 100;
      }
      
      public function wawosale(_arg_1:ClientObject) : DistanceWeakening
      {
         var _local_2:Desek = Desek(_arg_1.getParams(Tevyky));
         return new DistanceWeakening(_local_2.muku,_local_2.cuqutel,_local_2.nudonywo);
      }
   }
}

