package obfuscation.mobakobup
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import alternativa.tanks.models.weapon.Qygebiko;
   import alternativa.tanks.models.weapon.WeaponConst;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.IWeaponCommonModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.tankparts.weapon.common.WeaponCommonModelBase;
   import obfuscation.garud.Hoqeg;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Sev;
   
   public class Tiwo extends WeaponCommonModelBase implements IWeaponCommonModelBase, Cymone
   {
      
      private var dijobesi:TankModel;
      
      public function Tiwo()
      {
         super();
         _interfaces.push(IModel,IWeaponCommonModelBase,IObjectLoadListener,Cymone,Qygebiko);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         this.dijobesi = OSGi.getInstance().getService(ITankModel) as TankModel;
         var _local_6:Vodujyse = new Vodujyse(_arg_5,_arg_4,_arg_2 * WeaponConst.hetohiky.getNumber(),_arg_3 * WeaponConst.hetohiky.getNumber());
         _arg_1.putParams(Tiwo,_local_6);
      }
      
      public function hak(_arg_1:Num) : Hoqeg
      {
         var _local_3:Rib = null;
         var _local_2:* = BattleController.lymyb(_arg_1.turret);
         var _local_4:Hoqeg = Hoqeg(_arg_1.user.getParams(Hoqeg));
         if(_local_4 == null)
         {
            _local_3 = new Rib(true,this.dijobesi,_arg_1);
            _arg_1.user.putParams(Rib,_local_3);
            if(_local_2 is Sev)
            {
               _local_4 = _local_2.createLocalTurretController(_local_3,_arg_1);
            }
            else
            {
               _local_4 = new Hoqeg(_local_3);
            }
            _arg_1.user.putParams(Hoqeg,_local_4);
         }
         return _local_4;
      }
      
      public function honyna(_arg_1:ClientObject) : Vodujyse
      {
         return Vodujyse(_arg_1.getParams(Tiwo));
      }
      
      public function mafukuryd(_arg_1:ClientObject) : Number
      {
         return this.honyna(_arg_1).fotulite();
      }
      
      public function cavedo(_arg_1:ClientObject) : Number
      {
         return this.honyna(_arg_1).mikepal();
      }
   }
}

