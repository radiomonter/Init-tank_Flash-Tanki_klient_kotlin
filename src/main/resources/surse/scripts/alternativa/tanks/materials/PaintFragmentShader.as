package alternativa.tanks.materials
{
   import alternativa.engine3d.core.ShadowMap;
   import alternativa.gfx.agal.FragmentShader;
   import alternativa.gfx.agal.SamplerDim;
   import alternativa.gfx.agal.SamplerFilter;
   import alternativa.gfx.agal.SamplerMipMap;
   import alternativa.gfx.agal.SamplerRepeat;
   import alternativa.gfx.agal.SamplerType;
   
   public class PaintFragmentShader extends FragmentShader
   {
      
      public function PaintFragmentShader(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean, _arg_4:Boolean, _arg_5:Boolean, _arg_6:Boolean, _arg_7:Boolean, _arg_8:Boolean, _arg_9:Boolean, _arg_10:Boolean, _arg_11:Boolean, _arg_12:Boolean, _arg_13:Boolean, _arg_14:Boolean, _arg_15:Boolean, _arg_16:Boolean, _arg_17:Boolean, _arg_18:Boolean)
      {
         var _local_19:int = 0;
         super();
         var _local_20:SamplerRepeat = !_arg_1 ? SamplerRepeat.CLAMP : SamplerRepeat.WRAP;
         var _local_21:SamplerFilter = !_arg_2 ? SamplerFilter.NEAREST : SamplerFilter.LINEAR;
         var _local_22:SamplerMipMap = !_arg_3 ? SamplerMipMap.NONE : (!_arg_2 ? SamplerMipMap.NEAREST : SamplerMipMap.LINEAR);
         var _local_23:SamplerType = !_arg_4 ? SamplerType.RGBA : SamplerType.DXT1;
         tex(ft0,v6,fs4.dim(SamplerDim.D2).repeat(_local_20).filter(_local_21).mipmap(_local_22).type(_local_23));
         tex(ft1,v0,fs6.dim(SamplerDim.D2).repeat(_local_20).filter(_local_21).mipmap(_local_22).type(_local_23));
         mul(ft2,ft0,ft1);
         mul(ft2,fc[23].w,ft2);
         sub(ft3,fc[23].z,ft0);
         sub(ft4,fc[23].z,ft1);
         mul(ft3,fc[23].w,ft3);
         mul(ft3,ft3,ft4);
         sub(ft3,fc[23].z,ft3);
         sge(ft4.x,ft1.x,fc[23].z);
         sub(ft4.y,fc[23].z,ft4.x);
         mul(ft5,ft4.x,ft3);
         mul(ft6,ft4.y,ft2);
         add(ft0,ft5,ft6);
         mov(ft0.w,ft1.w);
         tex(ft1,v0,fs0.dim(SamplerDim.D2).repeat(_local_20).filter(_local_21).mipmap(_local_22).type(_local_23));
         sub(ft2.w,fc[23].z,ft1.w);
         mul(ft0.x,ft0.x,ft2.w);
         mul(ft0.y,ft0.y,ft2.w);
         mul(ft0.z,ft0.z,ft2.w);
         add(ft0.xyz,ft0.xyz,ft1.xyz);
         mov(ft1,fc[23].x);
         mov(ft2,fc[23].x);
         mov(ft3,fc[23].x);
         mov(ft4,fc[23].x);
         mov(ft5,fc[23].x);
         mov(ft6,fc[23].x);
         if(_arg_5)
         {
            sub(ft1.w,ft0,fc[14]);
            kil(ft1.w);
         }
         if(_arg_6)
         {
            add(ft1.w,ft0,fc[18]);
            div(ft0.xyz,ft0,ft1.w);
         }
         if(_arg_7)
         {
            mul(ft0.xyz,ft0,fc[0]);
            add(ft0.xyz,ft0,fc[1]);
         }
         if(_arg_8)
         {
            mul(ft0.w,ft0,fc[0]);
         }
         if(_arg_9)
         {
            abs(ft1,v0.z);
            sat(ft1,ft1);
            sub(ft1,fc[17],ft1);
            mul(ft0.w,ft0,ft1);
         }
         if(_arg_11 || _arg_12 || _arg_13 || _arg_15)
         {
            div(ft4,v1,v1.z);
            mul(ft4.xy,ft4,fc[18]);
            add(ft4.xy,ft4,fc[18]);
         }
         if(_arg_11 || _arg_12 || _arg_13)
         {
            mul(ft3,ft4,fc[4]);
         }
         if(_arg_11 || _arg_12)
         {
            tex(ft1,ft3,fs1.dim(SamplerDim.D2).repeat(SamplerRepeat.CLAMP).filter(SamplerFilter.NEAREST).mipmap(SamplerMipMap.NONE));
         }
         if(_arg_13)
         {
            tex(ft6,ft3,fs5.dim(SamplerDim.D2).repeat(SamplerRepeat.CLAMP).filter(SamplerFilter.NEAREST).mipmap(SamplerMipMap.NONE));
         }
         if(_arg_11)
         {
            dp3(ft2,ft1,fc[17]);
            sub(ft2,ft2,v1);
            abs(ft2,ft2);
            div(ft2,ft2,fc[14]);
            sat(ft2,ft2);
            mul(ft0.w,ft0,ft2.z);
         }
         if(_arg_12)
         {
            mul(ft2,fc[12],ft1.w);
            sub(ft2,fc[17].w,ft2);
            mul(ft0.xyz,ft0,ft2);
         }
         if(_arg_15)
         {
            mov(ft5,fc[5]);
            mul(ft5.z,ft5,v2);
            mul(ft3,ft4,fc[7]);
            tex(ft1,ft3,fs3.dim(SamplerDim.D2).repeat(SamplerRepeat.WRAP).filter(SamplerFilter.NEAREST).mipmap(SamplerMipMap.NONE));
            mul(ft1.z,ft1,fc[6]);
            mul(ft2,ft1.z,ft1);
            _local_19 = 0;
            while(_local_19 < ShadowMap.numSamples)
            {
               if(_local_19 == 0)
               {
                  add(ft1,ft2,v2);
                  tex(ft1,ft1,fs2.dim(SamplerDim.D2).repeat(SamplerRepeat.CLAMP).filter(SamplerFilter.NEAREST).mipmap(SamplerMipMap.NONE));
                  dp3(ft1,ft1,ft5);
                  sat(ft1,ft1);
                  mov(ft4,ft1);
               }
               else
               {
                  if(_local_19 % 2 > 0)
                  {
                     dp3(ft3.x,ft2,fc[8]);
                     dp3(ft3.y,ft2,fc[9]);
                     add(ft1,ft3,v2);
                  }
                  else
                  {
                     dp3(ft2.x,ft3,fc[8]);
                     dp3(ft2.y,ft3,fc[9]);
                     add(ft1,ft2,v2);
                  }
                  tex(ft1,ft1,fs2.dim(SamplerDim.D2).repeat(SamplerRepeat.CLAMP).filter(SamplerFilter.NEAREST).mipmap(SamplerMipMap.NONE));
                  dp3(ft1,ft1,ft5);
                  sat(ft1,ft1);
                  add(ft4,ft4,ft1);
               }
               _local_19++;
            }
            mul(ft2,ft4,fc[6]);
            sat(ft1,v2);
            mul(ft2,ft2,ft1);
            mul(ft2.w,ft2,fc[7]);
         }
         if(_arg_10)
         {
            if(_arg_15)
            {
               sat(ft1,v1);
               max(ft2,ft2,ft1);
            }
            else
            {
               sat(ft2,v1);
            }
         }
         if(_arg_15 || _arg_10)
         {
            sub(ft2,fc[17],ft2);
            mul(ft2,fc[10],ft2.w);
            add(ft2,ft2,fc[11]);
            if(_arg_13)
            {
               add(ft6,ft6,ft6);
               add(ft2,ft2,ft6);
            }
            else if(_arg_14)
            {
               add(ft2,ft2,fc[13]);
            }
            mul(ft0.xyz,ft0,ft2);
         }
         else if(_arg_13)
         {
            add(ft2,ft6,ft6);
            mul(ft0.xyz,ft0,ft2);
         }
         else if(_arg_14)
         {
            mul(ft0.xyz,ft0,fc[13]);
         }
         if(_arg_16)
         {
            if(_arg_17)
            {
               mul(ft0.xyz,ft0,fc[13].w);
               add(ft0.xyz,ft0,fc[13]);
            }
            else
            {
               sat(ft1,v0);
               mul(ft1,ft1,fc[2]);
               if(_arg_18)
               {
                  sub(ft1,fc[17],ft1);
                  mul(ft0.w,ft0,ft1);
               }
               else
               {
                  mul(ft1.xyz,fc[2],ft1.w);
                  sub(ft1.w,fc[17],ft1);
                  mul(ft0.xyz,ft0,ft1.w);
                  add(ft0.xyz,ft0,ft1);
               }
            }
         }
         mov(oc,ft0);
      }
   }
}

