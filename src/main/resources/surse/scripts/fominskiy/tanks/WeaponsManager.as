package fominskiy.tanks
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.register.ClientClass;
   import alternativa.tanks.models.weapon.shaft.Myqawyni;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import obfuscation.beteg.Ruzesu;
   import obfuscation.bidop.Dowefu;
   import obfuscation.ceba.Qyfyma;
   import obfuscation.dob.Gakemyna;
   import obfuscation.docecoqyb.Byjaheh;
   import obfuscation.dozas.Gek;
   import obfuscation.fatik.Ryfafapuk;
   import obfuscation.fudic.Hyfo;
   import obfuscation.hahyluzut.Powecu;
   import obfuscation.hicizuz.Hehiva;
   import obfuscation.jihadufef.Kikimy;
   import obfuscation.joh.Zuqelu;
   import obfuscation.kevidery.Jivo;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Tiwo;
   import obfuscation.qef.Paderonuv;
   import obfuscation.qevosuh.Coce;
   import obfuscation.qevosuh.Cuge;
   import obfuscation.qevosuh.Valamoh;
   import obfuscation.tuw.Weqocypoz;
   import obfuscation.venu.Vobecibyb;
   import obfuscation.wadili.Cupudiw;
   import obfuscation.wadili.Hidol;
   import obfuscation.zoniseg.RailgunSFXModel;
   import obfuscation.zusiniha.Hidyz;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.registry.ResourceRegistry;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   
   public class WeaponsManager
   {
      
      public static var resourceRegistry:ResourceRegistry = OSGi.getInstance().getService(ResourceRegistry) as ResourceRegistry;
      
      public static var modelRegistry:ModelRegistry = OSGi.getInstance().getService(ModelRegistry) as ModelRegistry;
      
      public static var shotDatas:Dictionary = new Dictionary();
      
      public static var specialEntity:Dictionary = new Dictionary();
      
      private static var railgunSFXModels:Dictionary = new Dictionary();
      
      private static var smokySFXModels:Dictionary = new Dictionary();
      
      private static var flamethrowerSFXModels:Dictionary = new Dictionary();
      
      private static var twinsSFXModels:Dictionary = new Dictionary();
      
      private static var isidaSFXModels:Dictionary = new Dictionary();
      
      private static var thunderSFXModels:Dictionary = new Dictionary();
      
      private static var frezeeSFXModels:Dictionary = new Dictionary();
      
      private static var ricochetSFXModels:Dictionary = new Dictionary();
      
      private static var shaftSFXModel:Dictionary = new Dictionary();
      
      private static var shotgunSFXModels:Dictionary = new Dictionary();
      
      private static var turretObjects:Dictionary = new Dictionary();
      
      public function WeaponsManager()
      {
         super();
      }
      
      public static function pinomo(_arg_1:ClientObject, _arg_2:ClientObject, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number) : void
      {
         var _local_7:Tiwo = OSGi.getInstance().getService(Cymone) as Tiwo;
         if(_local_7 == null)
         {
            _local_7 = new Tiwo();
            OSGi.getInstance().registerService(Cymone,_local_7);
         }
         _local_7.initObject(_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
      }
      
      public static function initBCSH(_arg_1:Object, _arg_2:IGameObject) : void
      {
         var _local_4:* = undefined;
         var _local_5:Cupudiw = null;
         if(_arg_1 == null)
         {
            return;
         }
         var _local_3:Vector.<Cupudiw> = new Vector.<Cupudiw>();
         for each(_local_4 in _arg_1.bcsh)
         {
            _local_5 = new Cupudiw();
            _local_5.brightness = _local_4.brightness;
            _local_5.contrast = _local_4.contrast;
            _local_5.hue = _local_4.hue;
            _local_5.key = _local_4.key;
            _local_5.saturation = _local_4.saturation;
            _local_3.push(_local_5);
         }
         Model.object = _arg_2;
         modelRegistry.getModel(_arg_2.gameClass.models[3]).putInitParams(new Hidol(_local_3));
         ObjectLoadListener(modelRegistry.getModel(_arg_2.gameClass.models[3])).objectLoaded();
         Model.popObject();
      }
      
      public static function initLighting(_arg_1:Object, _arg_2:IGameObject) : void
      {
         var _local_4:* = undefined;
         var _local_5:Cuge = null;
         var _local_6:* = undefined;
         var _local_7:Coce = null;
         if(_arg_1 == null)
         {
            return;
         }
         var _local_3:Vector.<Cuge> = new Vector.<Cuge>();
         for each(_local_4 in _arg_1.lighting)
         {
            _local_5 = new Cuge();
            _local_5.name = _local_4.name;
            _local_5.duzym = new Vector.<Coce>();
            for each(_local_6 in _local_4.light)
            {
               _local_7 = new Coce();
               _local_7.attenuationBegin = _local_6.attenuationBegin;
               _local_7.attenuationEnd = _local_6.attenuationEnd;
               _local_7.color = _local_6.color;
               _local_7.intensity = _local_6.intensity;
               _local_7.time = _local_6.time;
               _local_5.duzym.push(_local_7);
            }
            _local_3.push(_local_5);
         }
         Model.object = _arg_2;
         modelRegistry.getModel(_arg_2.gameClass.models[4]).putInitParams(new Valamoh(_local_3));
         Model.popObject();
      }
      
      public static function getRailgunSFX(_arg_1:ClientObject, _arg_2:Object = null) : RailgunSFXModel
      {
         var _local_3:RailgunSFXModel = null;
         var _local_4:Powecu = null;
         if(railgunSFXModels == null)
         {
            railgunSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            railgunSFXModels[_arg_1.id] = new RailgunSFXModel();
            _local_4 = new Powecu();
            _local_4.chargingPart1 = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.chargingPart1)));
            _local_4.chargingPart2 = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.chargingPart2)));
            _local_4.chargingPart3 = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.chargingPart3)));
            _local_4.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.hitMarkTexture)));
            _local_4.powTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.powTexture)));
            _local_4.ringsTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.ringsTexture)));
            _local_4.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_4.smokeImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.smokeImage)));
            _local_4.sphereTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.sphereTexture)));
            _local_4.trailImage = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.trailImage)));
            railgunSFXModels[_arg_1.id].putInitParams(_local_4);
            railgunSFXModels[_arg_1.id].objectLoadedPost(_arg_1);
         }
         return railgunSFXModels[_arg_1.id];
      }
      
      public static function getSmokySFX(_arg_1:ClientObject, _arg_2:Object = null) : Jivo
      {
         var _local_3:Jivo = null;
         var _local_4:Gakemyna = null;
         if(smokySFXModels == null)
         {
            smokySFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            _local_4 = new Gakemyna();
            _local_4.criticalHitSize = _arg_2.criticalHitSize;
            _local_4.criticalHitTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.criticalHitTexture)));
            _local_4.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionMarkTexture)));
            _local_4.explosionSize = _arg_2.explosionSize;
            _local_4.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionSound)));
            _local_4.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionTexture)));
            _local_4.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_4.shotTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotTexture)));
            smokySFXModels[_arg_1.id] = new Jivo();
            smokySFXModels[_arg_1.id].putInitParams(_local_4);
            smokySFXModels[_arg_1.id].objectLoaded(_arg_1);
         }
         return smokySFXModels[_arg_1.id];
      }
      
      public static function getFlamethrowerSFX(_arg_1:ClientObject, _arg_2:Object = null) : Paderonuv
      {
         var _local_3:Qyfyma = null;
         var _local_4:Vector.<Hyfo> = null;
         var _local_5:* = undefined;
         var _local_6:Hyfo = null;
         if(flamethrowerSFXModels == null)
         {
            flamethrowerSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            flamethrowerSFXModels[_arg_1.id] = new Paderonuv();
            _local_3 = new Qyfyma();
            _local_3.fireTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.fireTexture)));
            _local_3.flameSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.flameSound)));
            _local_3.muzzlePlaneTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.muzzlePlaneTexture)));
            flamethrowerSFXModels[_arg_1.id].putInitParams(_local_3);
            flamethrowerSFXModels[_arg_1.id].objectLoaded(_arg_1);
            _local_4 = new Vector.<Hyfo>();
            for each(_local_5 in _arg_2.colorTransform)
            {
               _local_6 = new Hyfo(_local_5.redMultiplier,_local_5.greenMultiplier,_local_5.blueMultiplier,_local_5.alphaMultiplier,_local_5.redOffset,_local_5.greenOffset,_local_5.blueOffset,_local_5.alphaOffset,_local_5.t);
               _local_4.push(_local_6);
            }
            flamethrowerSFXModels[_arg_1.id].initColorTransform(_arg_1,_local_4);
         }
         return flamethrowerSFXModels[_arg_1.id];
      }
      
      public static function getTwinsSFX(_arg_1:ClientObject, _arg_2:Object = null) : Vobecibyb
      {
         var _local_3:Hidyz = null;
         if(twinsSFXModels == null)
         {
            twinsSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            twinsSFXModels[_arg_1.id] = new Vobecibyb();
            _local_3 = new Hidyz();
            _local_3.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionTexture)));
            _local_3.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.hitMarkTexture)));
            _local_3.muzzleFlashTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.muzzleFlashTexture)));
            _local_3.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_3.shotTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotTexture)));
            twinsSFXModels[_arg_1.id].putInitParams(_local_3);
            twinsSFXModels[_arg_1.id].objectLoadedPost(_arg_1);
         }
         return twinsSFXModels[_arg_1.id];
      }
      
      public static function getIsidaSFX(_arg_1:ClientObject, _arg_2:Object = null) : Ruzesu
      {
         var _local_3:Weqocypoz = null;
         if(isidaSFXModels == null)
         {
            isidaSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            isidaSFXModels[_arg_1.id] = new Ruzesu();
            _local_3 = new Weqocypoz();
            _local_3.damagingBall = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.damagingBall)));
            _local_3.damagingRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.damagingRay)));
            _local_3.damagingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.damagingSound)));
            _local_3.healingBall = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.healingBall)));
            _local_3.healingRay = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.healingRay)));
            _local_3.healingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.healingSound)));
            _local_3.idleSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.idleSound)));
            isidaSFXModels[_arg_1.id].putInitParams(_local_3);
            isidaSFXModels[_arg_1.id].objectLoadedPost(_arg_1);
         }
         return isidaSFXModels[_arg_1.id];
      }
      
      public static function getThunderSFX(_arg_1:ClientObject, _arg_2:Object = null) : Kikimy
      {
         var _local_3:Hehiva = null;
         if(thunderSFXModels == null)
         {
            thunderSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            thunderSFXModels[_arg_1.id] = new Kikimy();
            _local_3 = new Hehiva();
            _local_3.explosionMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionMarkTexture)));
            _local_3.explosionSize = _arg_2.explosionSize;
            _local_3.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionSound)));
            _local_3.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionTexture)));
            _local_3.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_3.shotTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotTexture)));
            thunderSFXModels[_arg_1.id].putInitParams(_local_3);
            thunderSFXModels[_arg_1.id].objectLoaded(_arg_1);
         }
         return thunderSFXModels[_arg_1.id];
      }
      
      public static function getFrezeeSFXModel(_arg_1:ClientObject, _arg_2:Object = null) : Gek
      {
         var _local_3:Dowefu = null;
         if(frezeeSFXModels == null)
         {
            frezeeSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            frezeeSFXModels[_arg_1.id] = new Gek();
            _local_3 = new Dowefu();
            _local_3.particleSpeed = _arg_2.particleSpeed;
            _local_3.particleTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.particleTextureResource)));
            _local_3.planeTextureResource = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.planeTextureResource)));
            _local_3.shotSoundResource = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSoundResource)));
            frezeeSFXModels[_arg_1.id].putInitParams(_local_3);
            frezeeSFXModels[_arg_1.id].objectLoaded(_arg_1);
         }
         return frezeeSFXModels[_arg_1.id];
      }
      
      public static function getRicochetSFXModel(_arg_1:ClientObject, _arg_2:Object = null) : Ryfafapuk
      {
         var _local_3:Ryfafapuk = null;
         var _local_4:Zuqelu = null;
         if(ricochetSFXModels == null)
         {
            ricochetSFXModels = new Dictionary();
         }
         if(_arg_2 != null)
         {
            ricochetSFXModels[_arg_1.id] = new Ryfafapuk();
            _local_4 = new Zuqelu();
            _local_4.bumpFlashTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.bumpFlashTexture)));
            _local_4.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionTexture)));
            _local_4.kywibe = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionSound)));
            _local_4.ricochetSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.ricochetSound)));
            _local_4.shotFlashTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotFlashTexture)));
            _local_4.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_4.shotTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotTexture)));
            _local_4.tailTrailTexutre = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.tailTrailTexutre)));
            ricochetSFXModels[_arg_1.id].putInitParams(_local_4);
            ricochetSFXModels[_arg_1.id].objectLoadedPost(_arg_1);
         }
         return ricochetSFXModels[_arg_1.id];
      }
      
      public static function getShaftSFX(_arg_1:ClientObject, _arg_2:Object = null) : Myqawyni
      {
         var _local_3:Myqawyni = null;
         var _local_4:Byjaheh = null;
         if(shaftSFXModel == null)
         {
            shaftSFXModel = new Dictionary();
         }
         if(_arg_2 != null)
         {
            shaftSFXModel[_arg_1.id] = new Myqawyni();
            _local_4 = new Byjaheh();
            _local_4.explosionSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionSound)));
            _local_4.explosionTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.explosionTexture)));
            _local_4.hitMarkTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.hitMarkTexture)));
            _local_4.muzzleFlashTexture = MultiframeImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.muzzleFlashTexture)));
            _local_4.shotSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.shotSound)));
            _local_4.targetingSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.targetingSound)));
            _local_4.trailTexture = ImageResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.trailTexture)));
            _local_4.zoomModeSound = SoundResource(resourceRegistry.getResource(Long.getLong(0,_arg_2.zoomModeSound)));
            shaftSFXModel[_arg_1.id].putInitParams(_local_4);
            shaftSFXModel[_arg_1.id].objectLoadedPost(_arg_1);
         }
         return shaftSFXModel[_arg_1.id];
      }
      
      public static function getObjectFor(_arg_1:String) : ClientObject
      {
         if(turretObjects[_arg_1] == null)
         {
            turretObjects[_arg_1] = initObject(_arg_1);
         }
         return turretObjects[_arg_1];
      }
      
      public static function clearSFXModel(_arg_1:ClientObject) : void
      {
         if(_arg_1 == null)
         {
            return;
         }
         if(shaftSFXModel != null)
         {
            if(shaftSFXModel[_arg_1.id] != null)
            {
               shaftSFXModel[_arg_1.id].objectUnloaded(_arg_1);
               delete shaftSFXModel[_arg_1.id];
            }
         }
         if(thunderSFXModels != null)
         {
            if(thunderSFXModels[_arg_1.id] != null)
            {
               thunderSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete thunderSFXModels[_arg_1.id];
            }
         }
         if(ricochetSFXModels != null)
         {
            if(ricochetSFXModels[_arg_1.id] != null)
            {
               ricochetSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete ricochetSFXModels[_arg_1.id];
            }
         }
         if(frezeeSFXModels != null)
         {
            if(frezeeSFXModels[_arg_1.id] != null)
            {
               frezeeSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete frezeeSFXModels[_arg_1.id];
            }
         }
         if(isidaSFXModels != null)
         {
            if(isidaSFXModels[_arg_1.id] != null)
            {
               isidaSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete isidaSFXModels[_arg_1.id];
            }
         }
         if(twinsSFXModels != null)
         {
            if(twinsSFXModels[_arg_1.id] != null)
            {
               twinsSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete twinsSFXModels[_arg_1.id];
            }
         }
         if(flamethrowerSFXModels != null)
         {
            if(flamethrowerSFXModels[_arg_1.id] != null)
            {
               flamethrowerSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete flamethrowerSFXModels[_arg_1.id];
            }
         }
         if(smokySFXModels != null)
         {
            if(smokySFXModels[_arg_1.id] != null)
            {
               smokySFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete smokySFXModels[_arg_1.id];
            }
         }
         if(railgunSFXModels != null)
         {
            if(railgunSFXModels[_arg_1.id] != null)
            {
               railgunSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete railgunSFXModels[_arg_1.id];
            }
         }
         if(shotgunSFXModels != null)
         {
            if(shotgunSFXModels[_arg_1.id] != null)
            {
               shotgunSFXModels[_arg_1.id].objectUnloaded(_arg_1);
               delete shotgunSFXModels[_arg_1.id];
            }
         }
      }
      
      private static function initObject(_arg_1:String) : ClientObject
      {
         return new ClientObject(_arg_1,new ClientClass(_arg_1,null,_arg_1,null),_arg_1,null);
      }
      
      public static function destroy() : void
      {
         isidaSFXModels = null;
         twinsSFXModels = null;
         flamethrowerSFXModels = null;
         smokySFXModels = null;
         railgunSFXModels = null;
         thunderSFXModels = null;
         ricochetSFXModels = null;
         frezeeSFXModels = null;
         shaftSFXModel = null;
         shotgunSFXModels = null;
      }
   }
}

