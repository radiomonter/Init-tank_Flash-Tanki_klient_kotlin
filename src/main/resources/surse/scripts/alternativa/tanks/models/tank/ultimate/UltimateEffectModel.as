package alternativa.tanks.models.tank.ultimate
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.effects.ultimate.SparkleSphereEffect;
   import alternativa.tanks.models.tank.ITankModel;
   import alternativa.tanks.models.tank.Num;
   import alternativa.types.Long;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.media.Sound;
   import obfuscation.rofa.ISound3DEffect;
   import obfuscation.rofa.Sound3D;
   import obfuscation.rofa.Sound3DEffect;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.SoundResource;
   
   public class UltimateEffectModel
   {
      
      private static const overClass:Class = UltimateEffectModel_overClass;
      
      private static const overBD:BitmapData = new overClass().bitmapData;
      
      private var vector:Vector3;
      
      private var battleService:BattleService;
      
      public function UltimateEffectModel()
      {
         super();
         this.vector = new Vector3();
         this.battleService = OSGi.getInstance().getService(BattleService) as BattleService;
      }
      
      public function showUltimateUsed(co:ClientObject, color:String) : void
      {
         this.createSparkleEffect(co,color);
         this.playSoundEffect(SoundResource(ResourceRegistry(OSGi.getInstance().getService(ResourceRegistry)).getResource(Long.getLong(0,1500011))).sound,ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(co));
      }
      
      private function playSoundEffect(effectSound:Sound, tankData:Num) : void
      {
         var soundEffect:ISound3DEffect = this.createSoundEffect(effectSound,tankData);
         if(soundEffect != null)
         {
            this.battleService.wikyhih(soundEffect);
         }
      }
      
      private function createSoundEffect(effectSound:Sound, tankData:Num) : ISound3DEffect
      {
         var sound:Sound3D = Sound3D.create(effectSound,1);
         return Sound3DEffect.create(new Vector3(tankData.tank.bij().repijumu().x,tankData.tank.bij().repijumu().y,tankData.tank.bij().repijumu().z),sound);
      }
      
      private function createSparkleEffect(co:ClientObject, effectColor:String) : void
      {
         var hull:Mesh = ITankModel(OSGi.getInstance().getService(ITankModel)).getTankData(co).tank.bij().repijumu();
         var texture:TextureMaterial = new TextureMaterial(overBD);
         var color:ColorTransform = UltimateModel.parseColorTransform(effectColor);
         var effect:SparkleSphereEffect = SparkleSphereEffect(this.battleService.getObjectPool().getObject(SparkleSphereEffect));
         effect.init(texture,hull,false,color);
         this.battleService.getBattleScene3D().addGraphicEffect(effect);
      }
   }
}

