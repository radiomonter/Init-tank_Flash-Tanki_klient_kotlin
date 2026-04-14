package alternativa.tanks.materials
{
   import alternativa.engine3d.alternativa3d;
   import alternativa.engine3d.core.Camera3D;
   import alternativa.engine3d.core.MipMapping;
   import alternativa.engine3d.core.Object3D;
   import alternativa.engine3d.materials.*;
   import alternativa.gfx.core.BitmapTextureResource;
   import alternativa.gfx.core.Device;
   import alternativa.gfx.core.IndexBufferResource;
   import alternativa.gfx.core.ProgramResource;
   import alternativa.gfx.core.VertexBufferResource;
   import flash.display.BitmapData;
   import flash.display3D.Context3DProgramType;
   import flash.display3D.Context3DVertexBufferFormat;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   
   use namespace alternativa3d;
   
   public class PaintMaterial extends TextureMaterial
   {
      
      protected var fragConst:Vector.<Number>;
      
      private var programs:Dictionary = new Dictionary();
      
      protected var spriteSheetBitmap:BitmapData;
      
      protected var lightMapBitmap:BitmapData;
      
      protected var spriteSheetResource:BitmapTextureResource;
      
      protected var lightMapResource:BitmapTextureResource;
      
      public function PaintMaterial(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:BitmapData, _arg_4:int = 0)
      {
         super(_arg_3,true,true,_arg_4);
         this.spriteSheetBitmap = _arg_1;
         this.lightMapBitmap = _arg_2;
         this.spriteSheetResource = TextureResourcesRegistry.getTextureResource(_arg_1,alternativa3d::_mipMapping > 0,true,false);
         this.lightMapResource = TextureResourcesRegistry.getTextureResource(_arg_2,alternativa3d::_mipMapping > 0,true,false);
         this.fragConst = Vector.<Number>([0,0.5,1,2,0.999,0.999,0,0]);
         uvTransformConst[0] = _arg_3.width / _arg_1.width;
         uvTransformConst[5] = _arg_3.height / _arg_1.height;
         alternativa3d::_mipMapping = !this.spriteSheetResource.mipMapping ? int(0) : int(MipMapping.PER_PIXEL);
      }
      
      override alternativa3d function get transparent() : Boolean
      {
         return false;
      }
      
      override public function set mipMapping(_arg_1:int) : void
      {
         _mipMapping = _arg_1;
         textureResource = TextureResourcesRegistry.getTextureResource(bitmap,_mipMapping > 0,repeat,_hardwareMipMaps);
         this.spriteSheetResource = TextureResourcesRegistry.getTextureResource(this.spriteSheetBitmap,_mipMapping > 0,true,false);
         this.lightMapResource = TextureResourcesRegistry.getTextureResource(this.lightMapBitmap,_mipMapping > 0,true,false);
      }
      
      override alternativa3d function drawOpaque(_arg_1:Camera3D, _arg_2:VertexBufferResource, _arg_3:IndexBufferResource, _arg_4:int, _arg_5:int, _arg_6:Object3D) : void
      {
         var _local_7:BitmapData = texture;
         if(_local_7 == null && _textureATF == null)
         {
            return;
         }
         var _local_8:Device = _arg_1.device;
         var _local_9:Boolean = _arg_1.fogAlpha > 0 && _arg_1.fogStrength > 0;
         var _local_10:Boolean = !_arg_1.view.constrained && _arg_1.ssao && _arg_1.ssaoStrength > 0 && _arg_6.useDepth;
         var _local_11:Boolean = !_arg_1.view.constrained && _arg_1.directionalLight != null && _arg_1.directionalLightStrength > 0 && _arg_6.useLight;
         var _local_12:Boolean = !_arg_1.view.constrained && _arg_1.shadowMap != null && _arg_1.shadowMapStrength > 0 && _arg_6.useLight && _arg_6.useShadowMap;
         var _local_13:Boolean = !_arg_1.view.constrained && _arg_1.deferredLighting && _arg_1.deferredLightingStrength > 0 && _arg_6.useDepth && _arg_6.useLight;
         var _local_14:Boolean = alphaTestThreshold > 0 && this.transparent;
         _local_8.setProgram(this.getProgram(!_local_14,false,false,false,_arg_1.view.quality,repeat,_mipMapping > 0,_arg_6.concatenatedColorTransform != null,false,_local_9,false,_local_10,_local_11,_local_12,_local_7 == null,false,_local_13,false,_arg_1.view.correction,_arg_6.concatenatedBlendMode != "normal",_local_14,false));
         _local_8.setTextureAt(0,textureResource);
         uvCorrection[0] = textureResource.correctionU;
         uvCorrection[1] = textureResource.correctionV;
         if(_local_10)
         {
            _local_8.setTextureAt(1,_arg_1.depthMap);
         }
         else
         {
            _local_8.setTextureAt(1,null);
         }
         if(_local_12)
         {
            _local_8.setTextureAt(2,_arg_1.shadowMap.map);
            _local_8.setTextureAt(3,_arg_1.shadowMap.noise);
         }
         else
         {
            _local_8.setTextureAt(2,null);
            _local_8.setTextureAt(3,null);
         }
         _local_8.setTextureAt(4,this.spriteSheetResource);
         _local_8.setTextureAt(6,this.lightMapResource);
         if(_local_13)
         {
            _local_8.setTextureAt(5,_arg_1.lightMap);
         }
         else
         {
            _local_8.setTextureAt(5,null);
         }
         _local_8.setVertexBufferAt(0,_arg_2,0,Context3DVertexBufferFormat.FLOAT_3);
         _local_8.setVertexBufferAt(1,_arg_2,3,Context3DVertexBufferFormat.FLOAT_2);
         if(_local_11)
         {
            _local_8.setVertexBufferAt(2,_arg_2,5,Context3DVertexBufferFormat.FLOAT_3);
         }
         else
         {
            _local_8.setVertexBufferAt(2,null);
         }
         _local_8.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_arg_6.transformConst,3,false);
         _local_8.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,uvCorrection,1);
         _local_8.setProgramConstantsFromVector(Context3DProgramType.VERTEX,14,uvTransformConst,2);
         _local_8.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,23,this.fragConst,2,false);
         if(_arg_6.concatenatedColorTransform != null)
         {
            _local_8.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,_arg_6.colorConst,2,false);
         }
         if(_local_14)
         {
            fragmentConst[3] = alphaTestThreshold;
            _local_8.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,14,fragmentConst,1,false);
         }
         try
         {
            _local_8.drawTriangles(_arg_3,_arg_4,_arg_5);
         }
         catch(e:Error)
         {
         }
         ++_arg_1.numDraws;
         _arg_1.numTriangles += _arg_5;
      }
      
      override alternativa3d function drawTransparent(_arg_1:Camera3D, _arg_2:VertexBufferResource, _arg_3:IndexBufferResource, _arg_4:int, _arg_5:int, _arg_6:Object3D, _arg_7:Boolean = false) : void
      {
         var _local_8:BitmapData = texture;
         if(_local_8 == null && _textureATF == null)
         {
            return;
         }
         var _local_9:Device = _arg_1.device;
         var _local_10:Boolean = _arg_1.fogAlpha > 0 && _arg_1.fogStrength > 0;
         var _local_11:Boolean = !_arg_1.view.constrained && _arg_1.softTransparency && _arg_1.softTransparencyStrength > 0 && _arg_6.softAttenuation > 0;
         var _local_12:Boolean = !_arg_1.view.constrained && _arg_1.ssao && _arg_1.ssaoStrength > 0 && _arg_6.useDepth;
         var _local_13:Boolean = !_arg_1.view.constrained && _arg_1.directionalLight != null && _arg_1.directionalLightStrength > 0 && _arg_6.useLight;
         var _local_14:Boolean = !_arg_1.view.constrained && _arg_1.shadowMap != null && _arg_1.shadowMapStrength > 0 && _arg_6.useLight && _arg_6.useShadowMap;
         var _local_15:Boolean = !_arg_1.view.constrained && _arg_1.deferredLighting && _arg_1.deferredLightingStrength > 0;
         var _local_16:Boolean = _local_15 && _arg_6.useDepth && _arg_6.useLight;
         _local_9.setProgram(this.getProgram(false,false,false,false,_arg_1.view.quality,repeat,_mipMapping > 0,_arg_6.concatenatedColorTransform != null,_arg_6.concatenatedAlpha < 1,_local_10,_local_11,_local_12,_local_13,_local_14,_local_8 == null,_local_8 == null && _textureATFAlpha != null,_local_16,false,_arg_1.view.correction,_arg_6.concatenatedBlendMode != "normal",false,_arg_7));
         _local_9.setTextureAt(0,textureResource);
         uvCorrection[0] = textureResource.correctionU;
         uvCorrection[1] = textureResource.correctionV;
         if(_local_12 || _local_11)
         {
            _local_9.setTextureAt(1,_arg_1.depthMap);
         }
         else
         {
            _local_9.setTextureAt(1,null);
         }
         if(_local_14)
         {
            _local_9.setTextureAt(2,_arg_1.shadowMap.map);
            _local_9.setTextureAt(3,_arg_1.shadowMap.noise);
         }
         else
         {
            _local_9.setTextureAt(2,null);
            _local_9.setTextureAt(3,null);
         }
         _local_9.setTextureAt(4,this.spriteSheetResource);
         _local_9.setTextureAt(6,this.lightMapResource);
         if(_local_16)
         {
            _local_9.setTextureAt(5,_arg_1.lightMap);
         }
         else
         {
            _local_9.setTextureAt(5,null);
         }
         _local_9.setVertexBufferAt(0,_arg_2,0,Context3DVertexBufferFormat.FLOAT_1);
         _local_9.setVertexBufferAt(1,null);
         _local_9.setVertexBufferAt(2,null);
         _local_9.setProgramConstantsFromVector(Context3DProgramType.VERTEX,0,_arg_6.transformConst,3,false);
         _local_9.setProgramConstantsFromVector(Context3DProgramType.VERTEX,4,uvCorrection,1);
         _local_9.setProgramConstantsFromVector(Context3DProgramType.VERTEX,14,uvTransformConst,2);
         _local_9.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,23,this.fragConst,2,false);
         if(_local_11)
         {
            fragmentConst[2] = _arg_6.softAttenuation;
            _local_9.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,14,fragmentConst,1);
         }
         if(_arg_6.concatenatedColorTransform != null)
         {
            _local_9.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,_arg_6.colorConst,2,false);
         }
         else if(_arg_6.concatenatedAlpha < 1)
         {
            _local_9.setProgramConstantsFromVector(Context3DProgramType.FRAGMENT,0,_arg_6.colorConst,1);
         }
         _local_9.drawTriangles(_arg_3,_arg_4,_arg_5);
         ++_arg_1.numDraws;
         _arg_1.numTriangles += _arg_5;
      }
      
      override public function disposeResource() : void
      {
         if(textureResource != null)
         {
            textureResource.dispose();
            textureResource = null;
         }
         if(this.spriteSheetResource != null)
         {
            this.spriteSheetResource.dispose();
            this.spriteSheetResource = null;
         }
         if(this.lightMapResource != null)
         {
            this.lightMapResource.dispose();
            this.lightMapResource = null;
         }
      }
      
      override public function dispose() : void
      {
         this.disposeResource();
         this.spriteSheetBitmap = null;
         this.lightMapBitmap = null;
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
            _local_24 = new PaintFragmentShader(_arg_6,_arg_5,_arg_7,_arg_15,_arg_21,!_arg_1 && !_arg_16 && !_arg_15,_arg_8,_arg_9,_arg_3,_arg_13,_arg_11,_arg_12,_arg_17,_arg_18,_arg_14,_arg_10,_arg_2,_arg_20).agalcode;
            _local_26 = new ProgramResource(_local_23,_local_24);
            this.programs[_local_25] = _local_26;
         }
         return _local_26;
      }
   }
}

