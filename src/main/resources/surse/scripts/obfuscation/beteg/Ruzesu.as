package obfuscation.beteg
{
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.object.ClientObject;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.engine3d.Bizotevuf;
   import alternativa.tanks.engine3d.EffectsMaterialRegistry;
   import alternativa.tanks.engine3d.TextureAnimation;
   import alternativa.tanks.utils.GraphicsUtils;
   import flash.display.BitmapData;
   import flash.filters.BitmapFilter;
   import obfuscation.rokal.Riwizy;
   import obfuscation.tuw.Gowifivuq;
   import obfuscation.tuw.Sifemi;
   import obfuscation.tuw.Weqocypoz;
   import obfuscation.vecuhamep.Jijapib;
   import platform.client.fp10.core.resource.types.MultiframeImageResource;
   
   public class Ruzesu extends Sifemi implements Gowifivuq, Jaj
   {
      
      [Inject]
      public static var suner:EffectsMaterialRegistry;
      
      [Inject]
      public static var battleService:BattleService;
      
      public function Ruzesu()
      {
         super();
      }
      
      private static function wylo(_arg_1:BitmapData, _arg_2:BitmapFilter = null) : TextureMaterial
      {
         var _local_3:BitmapData = _arg_2 != null ? GraphicsUtils.createFilteredImage(_arg_1,_arg_2) : _arg_1;
         var _local_4:TextureMaterial = suner.getMaterial(_local_3);
         _local_4.repeat = true;
         return _local_4;
      }
      
      private static function vuzy(_arg_1:Vector.<Bizotevuf>) : Vector.<Bizotevuf>
      {
         var _local_2:Vector.<Bizotevuf> = new Vector.<Bizotevuf>();
         var _local_3:int = _arg_1.length - 1;
         while(_local_3 >= 0)
         {
            _local_2.push(_arg_1[_local_3]);
            _local_3--;
         }
         return _local_2;
      }
      
      [Obfuscation(rename="false")]
      public function objectLoadedPost(_arg_1:ClientObject) : void
      {
         var _local_2:Weqocypoz = getInitParam();
         var _local_3:Jijapib = Jijapib(object.adapt(Jijapib));
         var _local_4:Tany = new Tany();
         var _local_5:MultiframeImageResource = _local_2.healingBall;
         var _local_6:TextureMaterial = wylo(_local_2.healingBall.data);
         var _local_7:TextureMaterial = wylo(_local_2.healingBall.data,_local_3.createFilter("hss"));
         var _local_8:TextureMaterial = wylo(_local_2.healingRay.data,_local_3.createFilter("hs"));
         var _local_9:TextureMaterial = wylo(_local_2.damagingBall.data,_local_3.createFilter("dss"));
         var _local_10:TextureMaterial = wylo(_local_2.damagingRay.data,_local_3.createFilter("ds"));
         var _local_11:Vector.<Bizotevuf> = GraphicsUtils.getUVFramesFromTexture(_local_6.texture,_local_5.frameWidth,_local_5.frameHeight,_local_5.numFrames);
         var _local_12:Vector.<Bizotevuf> = vuzy(_local_11);
         _local_4.pihiru = new TextureAnimation(_local_6,_local_11,_local_5.fps);
         _local_4.idleSound = _local_2.idleSound.sound;
         _local_4.doko = new TextureAnimation(_local_7,_local_11,_local_5.fps);
         _local_4.bamigifor = new TextureAnimation(_local_7,_local_12,_local_5.fps);
         _local_4.rukycodyt = _local_8;
         _local_4.bupog = _local_2.healingSound.sound;
         _local_4.wabo = new TextureAnimation(_local_9,_local_12,_local_5.fps);
         _local_4.qyzy = new TextureAnimation(_local_9,_local_11,_local_5.fps);
         _local_4.hijej = _local_10;
         _local_4.habynud = _local_2.damagingSound.sound;
         var _local_13:Riwizy = Riwizy(object.adapt(Riwizy));
         _local_4.ryzywopev = _local_13.jaqirynu("start");
         _local_4.robojy = _local_13.jaqirynu("loop");
         _local_4.jicoqi = _local_13.jaqirynu("friendStart");
         _local_4.muti = _local_13.jaqirynu("friendLoop");
         _local_4.gikukequ = _local_13.jaqirynu("enemyStart");
         _local_4.dekigy = _local_13.jaqirynu("enemyLoop");
         _local_4.kufobavi = _local_13.jaqirynu("friendBeam");
         _local_4.kezamiryj = _local_13.jaqirynu("enemyBeam");
         _arg_1.putParams(Tany,_local_4);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         var _local_2:Tany = Tany(_arg_1.getParams(Tany));
         suner.releaseMaterial(_local_2.pihiru.material);
         suner.releaseMaterial(_local_2.doko.material);
         suner.releaseMaterial(_local_2.bamigifor.material);
         suner.releaseMaterial(_local_2.rukycodyt);
         suner.releaseMaterial(_local_2.wabo.material);
         suner.releaseMaterial(_local_2.qyzy.material);
         suner.releaseMaterial(_local_2.hijej);
      }
      
      public function givyjadif(_arg_1:ClientObject) : Homas
      {
         return new Cenu(battleService,Tany(_arg_1.getParams(Tany)));
      }
   }
}

