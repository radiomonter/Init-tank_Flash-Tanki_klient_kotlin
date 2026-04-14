package alternativa.tanks.models.weapon
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.models.tank.TankModel;
   import fominskiy.tanks.WeaponsManager;
   import obfuscation.cefivofyh.DistanceWeakening;
   import obfuscation.cefivofyh.Puwid;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   import obfuscation.samelosin.Fabiwo;
   
   public class WeaponObject
   {
      
      protected var remote:Boolean = false;
      
      protected var object:ClientObject;
      
      public function WeaponObject(_arg_1:ClientObject)
      {
         super();
         this.object = _arg_1;
      }
      
      public function qegotody() : int
      {
         var _local_1:Fabiwo = WeaponsManager.shotDatas[this.nac().turret.id];
         return _local_1.reloadMsec.value;
      }
      
      public function fubu() : Number
      {
         var _local_1:Fabiwo = WeaponsManager.shotDatas[this.nac().turret.id];
         return _local_1.vom.value;
      }
      
      public function daqe() : Number
      {
         var _local_1:Fabiwo = WeaponsManager.shotDatas[this.nac().turret.id];
         return _local_1.dyrewuneb.value;
      }
      
      public function cywyzugej() : Vodujyse
      {
         return this.fek().honyna(this.nac().turret);
      }
      
      public function fek() : Cymone
      {
         var _local_1:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         return Cymone(_local_1.getModelsByInterface(Cymone)[0]);
      }
      
      public function wazalaje() : DistanceWeakening
      {
         var _local_1:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_2:Puwid = Puwid(_local_1.getModelsByInterface(Puwid)[0]);
         return _local_2.wawosale(this.nac().turret);
      }
      
      public function nac() : Num
      {
         return TankModel(OSGi.getInstance().getService(ITankModel)).getTankData(this.object);
      }
      
      public function veraqof(_arg_1:ClientObject) : void
      {
         this.object = _arg_1;
      }
      
      public function getObject() : ClientObject
      {
         return this.object;
      }
      
      public function isAlive() : Boolean
      {
         return true;
      }
      
      public function isLocal() : Boolean
      {
         return !this.remote;
      }
      
      public function mynoqiwu() : void
      {
         this.remote = true;
      }
   }
}

