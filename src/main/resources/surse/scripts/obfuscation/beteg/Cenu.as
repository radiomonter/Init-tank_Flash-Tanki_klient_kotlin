package obfuscation.beteg
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.hasitaze.Gypuza;
   import obfuscation.rofa.Dujezomi;
   import obfuscation.rofa.MuzzlePositionProvider;
   import obfuscation.rofa.OmniStreamLightEffect;
   
   public class Cenu implements Homas
   {
      
      private var battleService:BattleService;
      
      private var sfxData:Tany;
      
      private var turret:Object3D;
      
      private var tovy:Vector3;
      
      private var qabude:Vector3 = new Vector3();
      
      private var ceb:Jebijege;
      
      private var hyq:Poqihalo;
      
      private var gojerilek:OmniStreamLightEffect;
      
      private var lirigym:Dujezomi;
      
      private var zugicyr:Gypuza;
      
      public function Cenu(_arg_1:BattleService, _arg_2:Tany)
      {
         super();
         this.battleService = _arg_1;
         this.sfxData = _arg_2;
      }
      
      public function init(_arg_1:Object3D, _arg_2:Vector3) : void
      {
         this.turret = _arg_1;
         this.tovy = _arg_2.clone();
      }
      
      public function goqida(_arg_1:Gypuza, _arg_2:Tank = null, _arg_3:Vector3 = null) : void
      {
         this.tuvin(true,_arg_1);
         this.wykenubek(_arg_1,_arg_2,_arg_3);
         this.hyq.type = _arg_1;
      }
      
      public function gav(_arg_1:Gypuza, _arg_2:Tank = null, _arg_3:Vector3 = null) : void
      {
         this.tuvin(false,_arg_1);
         this.wykenubek(_arg_1,_arg_2,_arg_3);
         this.hyq.type = _arg_1;
      }
      
      private function tuvin(_arg_1:Boolean, _arg_2:Gypuza) : void
      {
         if(this.ceb == null)
         {
            this.wezaraquz(_arg_1);
            this.vos();
            this.hez(_arg_2);
         }
         else if(_arg_2 != this.zugicyr)
         {
            this.hez(_arg_2);
         }
      }
      
      private function hez(_arg_1:Gypuza) : void
      {
         if(this.gojerilek != null)
         {
            this.kysomyfeb();
         }
         this.gojerilek = OmniStreamLightEffect(this.battleService.getObjectPool().getObject(OmniStreamLightEffect));
         var _local_2:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_2.init(this.turret,this.tovy);
         switch(_arg_1)
         {
            case Gypuza.DAMAGING:
               this.gojerilek.init(_local_2,this.sfxData.gikukequ,this.sfxData.dekigy);
               break;
            case Gypuza.HEALING:
               this.gojerilek.init(_local_2,this.sfxData.jicoqi,this.sfxData.muti);
               break;
            default:
               this.gojerilek.init(_local_2,this.sfxData.ryzywopev,this.sfxData.robojy);
         }
         this.zugicyr = _arg_1;
         this.battleService.addGraphicEffect(this.gojerilek);
      }
      
      private function kysomyfeb() : void
      {
         this.gojerilek.stop();
         this.gojerilek = null;
      }
      
      private function wezaraquz(_arg_1:Boolean) : void
      {
         this.ceb = Jebijege(this.battleService.getObjectPool().getObject(Jebijege));
         if(_arg_1)
         {
            this.ceb.musi(this.sfxData,this.turret,this.tovy);
         }
         else
         {
            this.ceb.gizahenyh(this.sfxData,this.turret,this.tovy);
         }
         this.battleService.addGraphicEffect(this.ceb);
      }
      
      private function vos() : void
      {
         this.hyq = Poqihalo(this.battleService.getObjectPool().getObject(Poqihalo));
         this.hyq.init(this.sfxData,this.turret);
         this.battleService.wikyhih(this.hyq);
      }
      
      private function wykenubek(_arg_1:Gypuza, _arg_2:Tank, _arg_3:Vector3) : void
      {
         var _local_4:Mesh = null;
         if(_arg_1 == Gypuza.IDLE)
         {
            this.ceb.zawymi(_arg_1);
         }
         else
         {
            _local_4 = _arg_2.repijumu();
            this.qabude.copy(_arg_3);
            this.qabude.subtract(_arg_2.kanybeq());
            this.ceb.zawymi(_arg_1,_local_4,this.qabude);
         }
         this.hazikad(_arg_1,_arg_2,this.qabude);
      }
      
      private function hazikad(_arg_1:Gypuza, _arg_2:Tank, _arg_3:Vector3) : void
      {
         if(this.lirigym != null)
         {
            this.lirigym.kill();
            this.lirigym = null;
         }
         if(_arg_1 == Gypuza.IDLE || _arg_1 == Gypuza.OFF)
         {
            return;
         }
         var _local_4:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         var _local_5:MuzzlePositionProvider = MuzzlePositionProvider(this.battleService.getObjectPool().getObject(MuzzlePositionProvider));
         _local_4.init(this.turret,this.tovy);
         _local_5.init(_arg_2.repijumu(),_arg_3);
         this.lirigym = Dujezomi(this.battleService.getObjectPool().getObject(Dujezomi));
         switch(_arg_1)
         {
            case Gypuza.DAMAGING:
               this.lirigym.init(_local_4,_local_5,this.sfxData.kezamiryj,true);
               break;
            case Gypuza.HEALING:
               this.lirigym.init(_local_4,_local_5,this.sfxData.kufobavi,true);
         }
         this.battleService.addGraphicEffect(this.lirigym);
      }
      
      public function tesebelyd() : void
      {
         if(this.ceb != null)
         {
            this.ceb.stop();
            this.hyq.kill();
            this.gojerilek.stop();
            if(this.lirigym != null)
            {
               this.lirigym.kill();
            }
            this.ceb = null;
            this.hyq = null;
            this.gojerilek = null;
            this.lirigym = null;
         }
      }
   }
}

