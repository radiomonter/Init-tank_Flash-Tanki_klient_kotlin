package obfuscation.rofa
{
   import alternativa.engine3d.core.Light3D;
   import alternativa.engine3d.lights.OmniLight;
   import alternativa.engine3d.lights.SpotLight;
   import alternativa.engine3d.lights.TubeLight;
   import obfuscation.qevosuh.Coce;
   
   public final class LightAnimation
   {
      
      private var sakito:int;
      
      private var time:Vector.<uint>;
      
      private var intensity:Vector.<Number>;
      
      private var color:Vector.<uint>;
      
      private var attenuationBegin:Vector.<Number>;
      
      private var attenuationEnd:Vector.<Number>;
      
      public function LightAnimation(_arg_1:Vector.<Coce>)
      {
         var _local_2:Coce = null;
         var _local_3:int = 0;
         super();
         this.sakito = _arg_1.length;
         this.intensity = new Vector.<Number>(this.sakito,true);
         this.color = new Vector.<uint>(this.sakito,true);
         this.attenuationBegin = new Vector.<Number>(this.sakito,true);
         this.attenuationEnd = new Vector.<Number>(this.sakito,true);
         this.time = new Vector.<uint>(this.sakito,true);
         while(_local_3 < this.sakito)
         {
            _local_2 = _arg_1[_local_3];
            this.intensity[_local_3] = Number(_local_2.intensity);
            this.color[_local_3] = uint(_local_2.color);
            this.attenuationBegin[_local_3] = Number(_local_2.attenuationBegin);
            this.attenuationEnd[_local_3] = Number(_local_2.attenuationEnd);
            this.time[_local_3] = uint(_local_2.time);
            _local_3++;
         }
      }
      
      private static function sugaz(_arg_1:Number, _arg_2:Number, _arg_3:Number) : Number
      {
         return _arg_1 + (_arg_2 - _arg_1) * _arg_3;
      }
      
      private static function pygalab(_arg_1:uint, _arg_2:uint, _arg_3:Number) : uint
      {
         var _local_4:Number = (_arg_1 >> 16 & 0xFF) / 255;
         var _local_5:Number = (_arg_1 >> 8 & 0xFF) / 255;
         var _local_6:Number = (_arg_1 & 0xFF) / 255;
         var _local_7:Number = (_arg_2 >> 16 & 0xFF) / 255;
         var _local_8:Number = (_arg_2 >> 8 & 0xFF) / 255;
         var _local_9:Number = (_arg_2 & 0xFF) / 255;
         var _local_10:int = sugaz(_local_4,_local_7,_arg_3) * 255;
         var _local_11:int = sugaz(_local_5,_local_8,_arg_3) * 255;
         var _local_12:int = sugaz(_local_6,_local_9,_arg_3) * 255;
         return _local_10 << 16 | _local_11 << 8 | _local_12;
      }
      
      private function pemekuwi(_arg_1:Number) : Number
      {
         var _local_2:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = 0;
         if(_arg_1 < this.time[this.sakito - 1])
         {
            _local_2 = 0;
            while(_local_2 < this.sakito - 1)
            {
               _local_3 = this.time[_local_2];
               _local_4 = this.time[_local_2 + 1];
               if(_arg_1 >= _local_3 && _arg_1 < _local_4)
               {
                  _local_5 = (_arg_1 - _local_3) / (_local_4 - _local_3);
                  _local_6 = _local_2 + _local_5;
                  break;
               }
               _local_2++;
            }
         }
         else
         {
            _local_6 = this.sakito - 1;
         }
         return _local_6;
      }
      
      public function tun() : int
      {
         return this.sakito;
      }
      
      private function cutorowy(_arg_1:int) : int
      {
         return _arg_1 < this.sakito ? int(_arg_1) : int(this.sakito - 1);
      }
      
      private function figuh(_arg_1:Number, _arg_2:SpotLight) : void
      {
         var _local_3:int = this.cutorowy(Math.floor(_arg_1));
         var _local_4:int = this.cutorowy(Math.ceil(_arg_1));
         var _local_5:Number = _arg_1 - _local_3;
         var _local_6:Number = this.intensity[_local_3];
         var _local_7:Number = this.intensity[_local_4];
         var _local_8:uint = this.color[_local_3];
         var _local_9:uint = this.color[_local_4];
         var _local_10:Number = this.attenuationBegin[_local_3];
         var _local_11:Number = this.attenuationBegin[_local_4];
         var _local_12:Number = this.attenuationEnd[_local_3];
         var _local_13:Number = this.attenuationEnd[_local_4];
         _arg_2.intensity = sugaz(_local_6,_local_7,_local_5);
         _arg_2.color = pygalab(_local_8,_local_9,_local_5);
         _arg_2.attenuationBegin = sugaz(_local_10,_local_11,_local_5);
         _arg_2.attenuationEnd = sugaz(_local_12,_local_13,_local_5);
      }
      
      private function kyz(_arg_1:Number, _arg_2:OmniLight) : void
      {
         var _local_3:int = this.cutorowy(Math.floor(_arg_1));
         var _local_4:int = this.cutorowy(Math.ceil(_arg_1));
         var _local_5:Number = _arg_1 - _local_3;
         var _local_6:Number = this.intensity[_local_3];
         var _local_7:Number = this.intensity[_local_4];
         var _local_8:uint = this.color[_local_3];
         var _local_9:uint = this.color[_local_4];
         var _local_10:Number = this.attenuationBegin[_local_3];
         var _local_11:Number = this.attenuationBegin[_local_4];
         var _local_12:Number = this.attenuationEnd[_local_3];
         var _local_13:Number = this.attenuationEnd[_local_4];
         _arg_2.intensity = sugaz(_local_6,_local_7,_local_5);
         _arg_2.color = pygalab(_local_8,_local_9,_local_5);
         _arg_2.attenuationBegin = sugaz(_local_10,_local_11,_local_5);
         _arg_2.attenuationEnd = sugaz(_local_12,_local_13,_local_5);
      }
      
      private function kozyd(_arg_1:Number, _arg_2:TubeLight) : void
      {
         var _local_3:int = this.cutorowy(Math.floor(_arg_1));
         var _local_4:int = this.cutorowy(Math.ceil(_arg_1));
         var _local_5:Number = _arg_1 - _local_3;
         var _local_6:Number = this.intensity[_local_3];
         var _local_7:Number = this.intensity[_local_4];
         var _local_8:uint = this.color[_local_3];
         var _local_9:uint = this.color[_local_4];
         var _local_10:Number = this.attenuationBegin[_local_3];
         var _local_11:Number = this.attenuationBegin[_local_4];
         var _local_12:Number = this.attenuationEnd[_local_3];
         var _local_13:Number = this.attenuationEnd[_local_4];
         _arg_2.intensity = sugaz(_local_6,_local_7,_local_5);
         _arg_2.color = pygalab(_local_8,_local_9,_local_5);
         _arg_2.attenuationBegin = sugaz(_local_10,_local_11,_local_5);
         _arg_2.attenuationEnd = sugaz(_local_12,_local_13,_local_5);
      }
      
      public function raci(_arg_1:Light3D, _arg_2:int, _arg_3:int = -1) : void
      {
         var _local_4:Number = 1;
         if(_arg_3 > 0 && this.sakito > 0)
         {
            _local_4 = this.time[this.sakito - 1] / _arg_3;
         }
         var _local_5:Number = this.pemekuwi(_arg_2 * _local_4);
         this.gafa(_arg_1,_local_5);
      }
      
      private function gafa(_arg_1:Light3D, _arg_2:Number) : void
      {
         if(_arg_1 is OmniLight)
         {
            this.kyz(_arg_2,OmniLight(_arg_1));
         }
         else if(_arg_1 is SpotLight)
         {
            this.figuh(_arg_2,SpotLight(_arg_1));
         }
         else if(_arg_1 is TubeLight)
         {
            this.kozyd(_arg_2,TubeLight(_arg_1));
         }
         _arg_1.calculateBounds();
      }
      
      public function tudy() : int
      {
         return this.time[this.sakito - 1];
      }
   }
}

