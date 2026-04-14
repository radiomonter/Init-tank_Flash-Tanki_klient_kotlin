package obfuscation.jiw
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.core.RayIntersectionData;
   import alternativa.math.Matrix4;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.BattleView;
   import alternativa.tanks.battle.scene3d.Renderer;
   import obfuscation.juha.Pyni;
   
   use namespace alternativa3d;
   
   public class Quwuhyby implements Renderer
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static const pok:ConsoleVarFloat = new ConsoleVarFloat("ph_scale",0.12,0.00001,10);
      
      private static const winuly:ConsoleVarFloat = new ConsoleVarFloat("pfh_scale",0.1,0.00001,10);
      
      private static const m:Matrix4 = new Matrix4();
      
      private static const m1:Matrix4 = new Matrix4();
      
      private static const v:Vector3 = new Vector3();
      
      private static const kajywino:Vector3 = new Vector3();
      
      private static const sinesi:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private var camera:Camera3D;
      
      private var tag:Vector.<Huzyd> = new Vector.<Huzyd>();
      
      public function Quwuhyby(_arg_1:Camera3D)
      {
         super();
         this.camera = _arg_1;
      }
      
      private static function dyfevaze(_arg_1:Camera3D, _arg_2:Vector3) : Number
      {
         var _local_3:Number = Math.cos(_arg_1.rotationX);
         var _local_4:Number = Math.sin(_arg_1.rotationX);
         var _local_5:Number = Math.cos(_arg_1.rotationY);
         var _local_6:Number = Math.sin(_arg_1.rotationY);
         var _local_7:Number = Math.cos(_arg_1.rotationZ);
         var _local_8:Number = Math.sin(_arg_1.rotationZ);
         var _local_9:Number = _local_7 * _local_6 * _local_3 + _local_8 * _local_4;
         var _local_10:Number = -_local_7 * _local_4 + _local_6 * _local_8 * _local_3;
         var _local_11:Number = _local_5 * _local_3;
         var _local_12:Number = -_local_9 * _arg_1.x - _local_10 * _arg_1.y - _local_11 * _arg_1.z;
         var _local_13:Number = _arg_1.view.width * 0.5;
         var _local_14:Number = _arg_1.view.height * 0.5;
         var _local_15:Number = Math.sqrt(_local_13 * _local_13 + _local_14 * _local_14) / Math.tan(_arg_1.fov * 0.5);
         var _local_16:Number = _local_9 * _arg_2.x + _local_10 * _arg_2.y + _local_11 * _arg_2.z + _local_12;
         return _local_15 / _local_16;
      }
      
      private static function piq(_arg_1:Object3D) : Matrix4
      {
         var _local_2:Number = Math.cos(_arg_1.rotationX);
         var _local_3:Number = Math.sin(_arg_1.rotationX);
         var _local_4:Number = Math.cos(_arg_1.rotationY);
         var _local_5:Number = Math.sin(_arg_1.rotationY);
         var _local_6:Number = Math.cos(_arg_1.rotationZ);
         var _local_7:Number = Math.sin(_arg_1.rotationZ);
         var _local_8:Number = _local_6 * _local_5;
         var _local_9:Number = _local_7 * _local_5;
         var _local_10:Number = _local_4 * _arg_1.scaleX;
         var _local_11:Number = _local_3 * _arg_1.scaleY;
         var _local_12:Number = _local_2 * _arg_1.scaleY;
         var _local_13:Number = _local_2 * _arg_1.scaleZ;
         var _local_14:Number = _local_3 * _arg_1.scaleZ;
         m1.m00 = _local_6 * _local_10;
         m1.m01 = _local_8 * _local_11 - _local_7 * _local_12;
         m1.m02 = _local_8 * _local_13 + _local_7 * _local_14;
         m1.m03 = _arg_1.x;
         m1.m10 = _local_7 * _local_10;
         m1.m11 = _local_9 * _local_11 + _local_6 * _local_12;
         m1.m12 = _local_9 * _local_13 - _local_6 * _local_14;
         m1.m13 = _arg_1.y;
         m1.m20 = -_local_5 * _arg_1.scaleX;
         m1.m21 = _local_4 * _local_11;
         m1.m22 = _local_4 * _local_13;
         m1.m23 = _arg_1.z;
         return m1;
      }
      
      public function show() : void
      {
         var _local_1:Huzyd = null;
         for each(_local_1 in this.tag)
         {
            _local_1.visible = true;
         }
      }
      
      public function nonobili(_arg_1:Huzyd) : void
      {
         _arg_1.visible = false;
         battleService.getBattleView().jod(_arg_1);
         this.tag.push(_arg_1);
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Huzyd = null;
         var _local_4:Matrix4 = this.caja();
         for each(_local_3 in this.tag)
         {
            this.lakiho(_local_3,_local_4);
         }
      }
      
      private function lakiho(_arg_1:Huzyd, _arg_2:Matrix4) : void
      {
         var _local_7:BattleView = null;
         var _local_3:Number = NaN;
         _arg_1.nikigali(v);
         v.transform4(_arg_2);
         this.guwogalic(v);
         var _local_4:Number = 15;
         var _local_5:Number = this.poq();
         var _local_6:Boolean = this.duvum(v.x,v.y,_local_4,_local_5);
         if(v.z > 0 && _local_6)
         {
            _local_3 = this.sepe(_arg_1.pac());
            if(_local_3 == 0)
            {
               _arg_1.visible = false;
               _arg_1.alpha = 0;
            }
            else
            {
               _arg_1.visible = true;
               _arg_1.alpha = _local_3;
            }
         }
         else
         {
            _arg_1.alpha = 1;
            _arg_1.visible = false;
         }
         _local_7 = battleService.getBattleView();
         _arg_1.x = int(v.x + _local_7.gitis() / 2 - 12);
         _arg_1.y = int(v.y + _local_7.boh() / 2 - 12);
         _arg_1.update();
      }
      
      private function sepe(_arg_1:Pyni) : Number
      {
         var _local_4:RayIntersectionData = null;
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         _arg_1.readPosition(kajywino);
         var _local_5:Number = dyfevaze(this.camera,kajywino);
         if(_local_5 < winuly.value)
         {
            return 1;
         }
         sinesi.reset(this.camera.x,this.camera.y,this.camera.z);
         direction.diff(kajywino,sinesi);
         _local_3 = direction.length();
         direction.normalize();
         _local_4 = battleService.getBattleScene3D().raycast(sinesi,direction,battleService.paluhu());
         if(_local_4 != null && _local_4.time < _local_3)
         {
            _local_2 = 1;
         }
         else if(_local_5 > pok.value)
         {
            _local_2 = 0;
         }
         else
         {
            _local_2 = (pok.value - _local_5) / (pok.value - winuly.value);
         }
         return _local_2;
      }
      
      private function guwogalic(_arg_1:Vector3) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         if(_arg_1.z > 0.001)
         {
            _arg_1.x = _arg_1.x * this.camera.viewSizeX / _arg_1.z;
            _arg_1.y = _arg_1.y * this.camera.viewSizeY / _arg_1.z;
         }
         else if(_arg_1.z < -0.001)
         {
            _arg_1.x = -_arg_1.x * this.camera.viewSizeX / _arg_1.z;
            _arg_1.y = -_arg_1.y * this.camera.viewSizeY / _arg_1.z;
         }
         else
         {
            _local_2 = battleService.getBattleView().hagetity();
            _local_3 = Math.sqrt(_arg_1.x * _arg_1.x + _arg_1.y * _arg_1.y);
            _arg_1.x *= _local_2 / _local_3;
            _arg_1.y *= _local_2 / _local_3;
         }
      }
      
      private function poq() : int
      {
         switch(battleService.getBattleView().sagiwe())
         {
            case BattleView.juz:
               return 70;
            case BattleView.juz - 1:
               return 40;
            default:
               return 15;
         }
      }
      
      private function duvum(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number) : Boolean
      {
         var _local_5:BattleView = battleService.getBattleView();
         var _local_6:Number = _local_5.gitis() / 2 - _arg_3;
         var _local_7:Number = _local_5.boh() / 2 - _arg_4;
         return _arg_1 >= -_local_6 && _arg_1 <= _local_6 && _arg_2 >= -_local_7 && _arg_2 <= _local_7;
      }
      
      private function caja() : Matrix4
      {
         var _local_1:Number = NaN;
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = this.camera.viewSizeX / this.camera.focalLength;
         var _local_6:Number = this.camera.viewSizeY / this.camera.focalLength;
         var _local_7:Number = Math.cos(this.camera.rotationX);
         var _local_8:Number = Math.sin(this.camera.rotationX);
         _local_1 = Math.cos(this.camera.rotationY);
         _local_2 = Math.sin(this.camera.rotationY);
         _local_3 = Math.cos(this.camera.rotationZ);
         var _local_9:Number = Math.sin(this.camera.rotationZ);
         var _local_10:Number = _local_3 * _local_2;
         var _local_11:Number = _local_9 * _local_2;
         var _local_12:Number = _local_1 * this.camera.scaleX;
         var _local_13:Number = _local_8 * this.camera.scaleY;
         var _local_14:Number = _local_7 * this.camera.scaleY;
         var _local_15:Number = _local_7 * this.camera.scaleZ;
         _local_4 = _local_8 * this.camera.scaleZ;
         m.m00 = _local_3 * _local_12 * _local_5;
         m.m01 = (_local_10 * _local_13 - _local_9 * _local_14) * _local_6;
         m.m02 = _local_10 * _local_15 + _local_9 * _local_4;
         m.m03 = this.camera.x;
         m.m10 = _local_9 * _local_12 * _local_5;
         m.m11 = (_local_11 * _local_13 + _local_3 * _local_14) * _local_6;
         m.m12 = _local_11 * _local_15 - _local_3 * _local_4;
         m.m13 = this.camera.y;
         m.m20 = -_local_2 * this.camera.scaleX * _local_5;
         m.m21 = _local_1 * _local_13 * _local_6;
         m.m22 = _local_1 * _local_15;
         m.m23 = this.camera.z;
         var _local_16:Object3D = this.camera;
         while(_local_16._parent != null)
         {
            _local_16 = _local_16._parent;
            m.append(piq(_local_16));
         }
         m.invert();
         return m;
      }
   }
}

