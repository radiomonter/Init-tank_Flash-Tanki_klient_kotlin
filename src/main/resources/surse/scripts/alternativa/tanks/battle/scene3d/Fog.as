package alternativa.tanks.battle.scene3d
{
   import alternativa.engine3d.core.Camera3D;
   
   public class Fog
   {
      
      public var color:int = 10543615;
      
      public var alpha:Number = 0.25;
      
      public var secofep:Number = 0;
      
      public var hajymohel:Number = 10000;
      
      private var camera:Camera3D;
      
      public function Fog(_arg_1:Camera3D)
      {
         super();
         this.camera = _arg_1;
      }
      
      public function enable() : void
      {
         if(this.color != 0)
         {
            this.camera.fogNear = this.secofep;
            this.camera.fogFar = this.hajymohel;
            this.camera.fogAlpha = this.alpha;
            this.camera.fogColor = this.color;
         }
      }
      
      public function disable() : void
      {
         this.camera.fogNear = 0;
         this.camera.fogFar = 1000000;
         this.camera.fogAlpha = 0;
      }
      
      public function setup(_arg_1:int, _arg_2:Number, _arg_3:Number, _arg_4:Number) : void
      {
         this.color = _arg_1;
         this.alpha = _arg_2;
         this.secofep = _arg_3;
         this.hajymohel = _arg_4;
      }
   }
}

