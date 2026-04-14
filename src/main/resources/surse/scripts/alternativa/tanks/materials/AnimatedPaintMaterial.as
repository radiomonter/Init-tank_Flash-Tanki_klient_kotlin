package alternativa.tanks.materials
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.TextureResourcesRegistry;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display.BitmapData;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   use namespace alternativa3d;
   
   public class AnimatedPaintMaterial extends PaintMaterial
   {
      
      private var programs:Dictionary = new Dictionary();
      
      private var lastFrame:int = -1;
      
      private var fps:int;
      
      private var numFrames:int;
      
      private var numFramesX:int;
      
      private var numFramesY:int;
      
      private var currentFrame:Number;
      
      public var scaleX:Number;
      
      public var scaleY:Number;
      
      private var time:int;
      
      private var frameWidth:Number;
      
      private var frameHeight:Number;
      
      public function AnimatedPaintMaterial(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:BitmapData, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:int, _arg_8:int = 0)
      {
         super(_arg_1,_arg_2,_arg_3,_arg_8);
         this.numFramesX = _arg_4;
         this.numFramesY = _arg_5;
         this.fps = _arg_6;
         this.numFrames = _arg_7;
         this.currentFrame = 0;
         this.scaleX = _arg_3.width / _arg_1.width;
         this.scaleY = _arg_3.height / _arg_1.height;
         this.frameWidth = 1 / _arg_4;
         this.frameHeight = 1 / _arg_5;
         fragConst = Vector.<Number>([0,0.5,1,2,this.frameWidth,this.frameHeight,0,0]);
      }
      
      public function update() : void
      {
         var _local_1:int = getTimer();
         var _local_2:int = _local_1 - this.time;
         this.time = _local_1;
         this.currentFrame += _local_2 / 1000 * this.fps;
         this.currentFrame %= this.numFrames;
         if(this.lastFrame == this.currentFrame)
         {
            return;
         }
         var _local_3:int = this.currentFrame % this.numFramesX;
         var _local_4:int = int(this.currentFrame / this.numFramesY);
         this.lastFrame = this.currentFrame;
         uvTransformConst[0] = this.scaleX;
         uvTransformConst[1] = 0;
         uvTransformConst[2] = _local_3 * this.frameWidth;
         uvTransformConst[3] = 0;
         uvTransformConst[4] = 0;
         uvTransformConst[5] = this.scaleY;
         uvTransformConst[6] = _local_4 * this.frameHeight;
         uvTransformConst[7] = 0;
         fragConst[6] = uvTransformConst[2];
         fragConst[7] = uvTransformConst[6];
      }
      
      override public function set mipMapping(_arg_1:int) : void
      {
         _mipMapping = 0;
         textureResource = TextureResourcesRegistry.getTextureResource(bitmap,_arg_1,repeat,_hardwareMipMaps);
         spriteSheetResource = TextureResourcesRegistry.getTextureResource(spriteSheetBitmap,false,true,false);
         lightMapResource = TextureResourcesRegistry.getTextureResource(lightMapBitmap,_arg_1,true,false);
      }
      
      override alternativa3d function drawOpaque(_arg_1:Camera3D, _arg_2:VertexBufferResource, _arg_3:IndexBufferResource, _arg_4:int, _arg_5:int, _arg_6:Object3D) : void
      {
         this.update();
         super.alternativa3d::drawOpaque(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
      }
      
      override alternativa3d function drawTransparent(_arg_1:Camera3D, _arg_2:VertexBufferResource, _arg_3:IndexBufferResource, _arg_4:int, _arg_5:int, _arg_6:Object3D, _arg_7:Boolean = false) : void
      {
         super.alternativa3d::drawTransparent(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5,_arg_6,_arg_7);
      }
      
      override protected function getProgram(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean, _arg_15:Boolean, _arg_16:Boolean, _arg_17:Boolean, _arg_18:Boolean, _arg_19:Boolean, _arg_20:Boolean, _arg_21:Boolean, _arg_22:Boolean) : ProgramResource
      {
         var _local_23:ByteArray = null;
         var _local_24:ByteArray = null;
         var _local_25:* = int(_arg_1) | int(_arg_2) << 1 | int(_arg_3) << 2 | int(_arg_4) << 3 | int(_arg_5) << 4 | int(_arg_6) << 5 | int(_arg_7) << 6 | int(_arg_8) << 7 | int(_arg_9) << 8 | int(_arg_10) << 9 | int(_arg_11) << 10 | int(_arg_12) << 11 | int(_arg_13) << 12 | int(_arg_14) << 13 | int(_arg_15) << 14 | int(_arg_16) << 15 | int(_arg_17) << 16 | int(_arg_18) << 17 | int(_arg_19) << 18 | int(_arg_20) << 19 | int(_arg_21) << 20 | int(_arg_22) << 21;
         var _local_26:ProgramResource = this.programs[_local_25];
         if(_local_26 == null)
         {
            _local_23 = new PaintVertexShader(!_arg_22,_arg_14 || _arg_11 || _arg_12 || _arg_17,_arg_13,_arg_4,_arg_14,_arg_10,_arg_2,_arg_3,_arg_3,_arg_19).agalcode;
            _local_24 = new AnimatedPaintFragmentShader(_arg_6,_arg_5,_arg_7,_arg_15,_arg_21,!_arg_1 && !_arg_16 && !_arg_15,_arg_8,_arg_9,_arg_3,_arg_13,_arg_11,_arg_12,_arg_17,_arg_18,_arg_14,_arg_10,_arg_2,_arg_20).agalcode;
            _local_26 = new ProgramResource(_local_23,_local_24);
            this.programs[_local_25] = _local_26;
         }
         return _local_26;
      }
   }
}

