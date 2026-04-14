package obfuscation.kyt
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.bonuses.BattleBonus;
   import alternativa.tanks.bonuses.BattleBonusData;
   import alternativa.tanks.bonuses.Bonus;
   import alternativa.types.Long;
   import alternativa.utils.TextureMaterialRegistry;
   import com.alternativaplatform.projects.tanks.client.warfare.models.common.bonuscommon.BonusCommonModelBase;
   import com.alternativaplatform.projects.tanks.client.warfare.models.common.bonuscommon.IBonusCommonModelBase;
   import flash.display.BitmapData;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.resource.types.StubBitmapData;
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class Kijuro extends BonusCommonModelBase implements IBonusCommonModelBase, IObjectLoadListener
   {
      
      [Inject]
      public static var suner:TextureMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const tynygagiq:Number = 4;
      
      private var sapubyly:BattleBonusData;
      
      private var gag:BattleBonusData;
      
      public function Kijuro()
      {
         super();
         _interfaces.push(IModel,IBonusCommonModelBase,IObjectLoadListener);
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:Long, _arg_3:Long, _arg_4:int, _arg_5:Long, _arg_6:Long, _arg_7:Long, _arg_8:Object) : void
      {
         this.gag = new BattleBonusData();
         this.gag.boxMesh = this.gimuzobo(_arg_2);
         this.gag.parachuteOuterMesh = this.gimuzobo(_arg_6);
         this.gag.parachuteInnerMesh = this.gimuzobo(_arg_5);
         this.gag.cordsMaterial = suner.getMaterial(ImageResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_arg_3)).data);
         this.gag.cordsMaterial.resolution = 5;
         if(SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_arg_7)) != null)
         {
            this.gag.pickupSound = SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_arg_7)).sound;
         }
         this.gag.lifeTimeMs = _arg_4 * 1000;
         this.gag.attenuationBegin = _arg_8.attenuationBegin;
         this.gag.attenuationEnd = _arg_8.attenuationEnd;
         this.gag.lightIntensity = _arg_8.intensity;
         this.gag.lightColor = _arg_8.lightColor;
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
      }
      
      public function tohubyfoj(_arg_1:String) : Bonus
      {
         var _local_2:BattleBonus = BattleBonus(battleService.getObjectPool().getObject(BattleBonus));
         _local_2.init(_arg_1,_arg_1,this.gag,battleService);
         return _local_2;
      }
      
      private function gimuzobo(_arg_1:Long) : Mesh
      {
         var _local_2:Tanks3DSResource = Tanks3DSResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(_arg_1));
         var _local_3:Mesh = Mesh(_local_2.objects[0]);
         var _local_4:BitmapData = _local_2.getTextureForObject(0);
         if(_local_4 == null)
         {
            _local_4 = new StubBitmapData(65280);
         }
         var _local_5:Mesh = Mesh(_local_3.clone());
         var _local_6:TextureMaterial = suner.getMaterial(_local_4);
         _local_6.resolution = 1;
         _local_5.setMaterialToAllFaces(_local_6);
         return _local_5;
      }
   }
}

