package obfuscation.rofa
{
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureMaterial;
   import alternativa.math.Vector3;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.utils.TextureMaterialRegistry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import forms.ranks.BigRankIcon;
   import obfuscation.kyre.Myw;
   import obfuscation.sujovigup.Fujypyvet;
   import obfuscation.sujovigup.Jugegev;
   import obfuscation.sujovigup.Rajola;
   import projects.tanks.clients.flash.commons.models.gpu.GPUCapabilities;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.user.IUserInfoService;
   
   public class Tyno
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      [Inject]
      public static var userInfoService:IUserInfoService;
      
      [Inject]
      public static var suner:TextureMaterialRegistry;
      
      private static const cuziq:Class = Vuduvoze;
      
      private static const loku:BitmapData = new cuziq().bitmapData;
      
      private static const zycog:Class = Hadaroq;
      
      private static const kedenilad:BitmapData = new zycog().bitmapData;
      
      private static const vufo:Class = Kuqonyq;
      
      private static const hysob:BitmapData = new vufo().bitmapData;
      
      private static const origin:Vector3 = new Vector3();
      
      private static const suvomyr:Vector3 = new Vector3(0,0,1);
      
      private static const fawevotoj:RayHit = new RayHit();
      
      public function Tyno()
      {
         super();
      }
      
      private static function welyvyp(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : Number
      {
         origin.reset(_arg_1,_arg_2,_arg_3);
         var _local_5:CollisionDetector = battleService.getBattleRunner().soc();
         if(_local_5.raycastStatic(origin,suvomyr,Myw.dyhan,_arg_4,null,fawevotoj))
         {
            return fawevotoj.t;
         }
         return _arg_4;
      }
      
      public function piqyqeqeb(_arg_1:Tank, _arg_2:int) : void
      {
         var _local_3:Object3D = _arg_1.bij().rocipaga();
         var _local_4:Number = this.vahojydir(_local_3.x,_local_3.y,_local_3.z);
         this.furylac(_local_4,_local_3);
         this.createLabel(_arg_1.tankData.userName,_local_4,_arg_2,_local_3);
         this.nawajidi(_local_4,_local_3);
         this.socetut(_local_3);
      }
      
      private function vahojydir(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         var _local_4:Number = 500;
         var _local_5:Number = 2000;
         var _local_6:Number = welyvyp(_arg_1,_arg_2,_arg_3,_local_5);
         return Math.max(_local_4,_local_6);
      }
      
      private function furylac(_arg_1:Number, _arg_2:Object3D) : void
      {
         var _local_5:Fujypyvet = null;
         var _local_11:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_6:int = 6;
         var _local_7:Number = 90;
         var _local_8:Number = 0;
         var _local_9:Number = Math.PI * 2 / _local_6;
         var _local_10:TextureMaterial = suner.getMaterial(loku);
         while(_local_11 < _local_6)
         {
            _local_3 = Math.sin(_local_8) * _local_7;
            _local_4 = Math.cos(_local_8) * _local_7;
            _local_5 = Fujypyvet(battleService.getObjectPool().getObject(Fujypyvet));
            _local_5.init(500,200,30,_arg_1,0.8,0.5,_local_3,_local_4,-50,_arg_2,_local_10);
            battleService.getBattleScene3D().addGraphicEffect(_local_5);
            _local_8 += _local_9;
            _local_11++;
         }
      }
      
      private function createLabel(_arg_1:String, _arg_2:Number, _arg_3:int, _arg_4:Object3D) : void
      {
         var _local_5:BigRankIcon = new BigRankIcon();
         var _local_6:Boolean = userInfoService.hasPremium(_arg_1);
         _local_5.init(_local_6,_arg_3);
         var _local_7:BitmapData = new BitmapData(_local_5.width,_local_5.height,true,0);
         _local_7.draw(_local_5);
         var _local_8:TextureMaterial = new TextureMaterial(_local_7,false,true,MipMapping.PER_PIXEL,1);
         var _local_9:Jugegev = Jugegev(battleService.getObjectPool().getObject(Jugegev));
         _local_9.init(500,270,270,0,_arg_2 * 0.8,_arg_2 * 0.15,0.35,0,0,50,_arg_4,_local_8,BlendMode.NORMAL);
         battleService.getBattleScene3D().addGraphicEffect(_local_9);
      }
      
      private function nawajidi(_arg_1:Number, _arg_2:Object3D) : void
      {
         var _local_3:int = 0;
         var _local_5:TextureMaterial = null;
         var _local_6:int = 0;
         var _local_11:Jugegev = null;
         var _local_4:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Number = NaN;
         var _local_9:Number = NaN;
         var _local_10:Number = NaN;
         if(GPUCapabilities.gpuEnabled)
         {
            _local_3 = 15;
            _local_4 = 100;
            _local_5 = suner.getMaterial(kedenilad);
            _local_6 = 0;
            while(_local_6 < _local_3)
            {
               _local_7 = Math.PI * 2 * Math.random();
               _local_8 = Math.sin(_local_7) * _local_4;
               _local_9 = Math.cos(_local_7) * _local_4;
               _local_10 = -110 * _local_6 - 50;
               _local_11 = Jugegev(battleService.getObjectPool().getObject(Jugegev));
               _local_11.init(400,150,150,_local_7,_arg_1 * 0.7,_arg_1 * 0.15,0.7,_local_8,_local_9,_local_10,_arg_2,_local_5,BlendMode.ADD);
               battleService.getBattleScene3D().addGraphicEffect(_local_11);
               _local_6++;
            }
         }
      }
      
      private function socetut(_arg_1:Object3D) : void
      {
         var _local_2:TextureMaterial = suner.getMaterial(hysob);
         var _local_3:Rajola = Rajola(battleService.getObjectPool().getObject(Rajola));
         _local_3.init(900,220,3,true,_arg_1,_local_2);
         battleService.getBattleScene3D().addGraphicEffect(_local_3);
      }
   }
}

