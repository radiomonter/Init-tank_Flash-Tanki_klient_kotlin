package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Shadow;
   import alternativa.tanks.utils.MathUtils;
   import flash.utils.Dictionary;
   
   public class AmbientShadows
   {
      
      private static const havanibuv:Number = 7000;
      
      private static const vedatuteb:Number = 4000;
      
      private static const nabovimyd:Number = 2000;
      
      private static const nyrico:Number = 1000;
      
      private static const vupukaqyq:Number = 0.01;
      
      private static const halatan:Number = 60;
      
      private static const pyfubumiz:Number = 20;
      
      private const shadows:Dictionary = new Dictionary();
      
      private var camera:Camera3D;
      
      private var nearDistance:Number = 4000;
      
      private var farDistance:Number = 7000;
      
      private var enabled:Boolean;
      
      private var color:int;
      
      private var alpha:Number = 0.85;
      
      public function AmbientShadows(_arg_1:Camera3D)
      {
         super();
         this.camera = _arg_1;
         this.fytoviki();
      }
      
      public function setup(_arg_1:int) : void
      {
         this.color = _arg_1;
      }
      
      public function add(_arg_1:Shadow) : void
      {
         _arg_1.color = this.color;
         _arg_1.alpha = this.alpha;
         _arg_1.nearDistance = this.nearDistance;
         _arg_1.farDistance = this.farDistance;
         this.shadows[_arg_1] = true;
         if(this.enabled)
         {
            this.camera.addShadow(_arg_1);
         }
      }
      
      public function remove(_arg_1:Shadow) : void
      {
         delete this.shadows[_arg_1];
         if(this.enabled)
         {
            this.camera.removeShadow(_arg_1);
         }
      }
      
      public function enable() : void
      {
         var _local_1:* = undefined;
         if(!this.enabled)
         {
            this.enabled = true;
            for(_local_1 in this.shadows)
            {
               this.camera.addShadow(_local_1);
            }
         }
      }
      
      public function disable() : void
      {
         var _local_1:* = undefined;
         if(this.enabled)
         {
            this.enabled = false;
            for(_local_1 in this.shadows)
            {
               this.camera.removeShadow(_local_1);
            }
         }
      }
      
      public function wavy(_arg_1:Number) : void
      {
         this.ciw(_arg_1);
         this.zyne();
      }
      
      private function ciw(_arg_1:Number) : void
      {
         var _local_2:Number = MathUtils.clamp((_arg_1 - pyfubumiz) / (halatan - pyfubumiz),0,1);
         var _local_3:Number = nyrico + _local_2 * (vedatuteb - nyrico);
         this.nearDistance += (_local_3 - this.nearDistance) * vupukaqyq;
         var _local_4:Number = nabovimyd + _local_2 * (havanibuv - nabovimyd);
         this.farDistance += (_local_4 - this.farDistance) * vupukaqyq;
      }
      
      private function zyne() : void
      {
         var _local_1:* = undefined;
         var _local_2:* = null;
         for(_local_2 in this.shadows)
         {
            _local_2.nearDistance = this.nearDistance;
            _local_2.farDistance = this.farDistance;
         }
      }
      
      private function fytoviki() : void
      {
      }
   }
}

