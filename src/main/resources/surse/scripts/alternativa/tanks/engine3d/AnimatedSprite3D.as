package alternativa.tanks.engine3d
{
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.objects.Sprite3D;
   
   public class AnimatedSprite3D extends Sprite3D
   {
      
      public var qawokyb:Boolean;
      
      private var cogakegi:Vector.<Bizotevuf>;
      
      private var numFrames:int;
      
      private var fps:Number;
      
      private var currentFrame:Number = 0;
      
      public function AnimatedSprite3D(_arg_1:Number, _arg_2:Number, _arg_3:Material = null)
      {
         super(_arg_1,_arg_2,_arg_3);
         useShadowMap = false;
         useLight = false;
      }
      
      public function vuhi(_arg_1:TextureAnimation) : void
      {
         material = _arg_1.material;
         this.cogakegi = _arg_1.sakito;
         this.fps = _arg_1.fps;
         this.numFrames = this.cogakegi.length;
         this.currentFrame = 0;
         this.kiba(this.currentFrame);
      }
      
      public function tabu() : Number
      {
         return this.fps;
      }
      
      public function getNumFrames() : int
      {
         return this.numFrames;
      }
      
      public function clear() : void
      {
         this.cogakegi = null;
         material = null;
         this.numFrames = 0;
      }
      
      public function kiba(_arg_1:int) : void
      {
         var _local_2:int = _arg_1 % this.numFrames;
         this.metobe(this.cogakegi[_local_2]);
      }
      
      private function metobe(_arg_1:Bizotevuf) : void
      {
         topLeftU = _arg_1.topLeftU;
         topLeftV = _arg_1.topLeftV;
         bottomRightU = _arg_1.bottomRightU;
         bottomRightV = _arg_1.bottomRightV;
      }
      
      public function update(_arg_1:Number) : void
      {
         this.currentFrame += this.fps * _arg_1;
         if(this.currentFrame >= this.numFrames)
         {
            if(this.qawokyb)
            {
               this.currentFrame %= this.numFrames;
            }
            else
            {
               this.currentFrame = this.numFrames - 1;
            }
         }
         this.metobe(this.cogakegi[int(this.currentFrame)]);
      }
   }
}

