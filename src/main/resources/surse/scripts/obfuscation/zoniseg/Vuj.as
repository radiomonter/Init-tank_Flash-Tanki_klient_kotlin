package obfuscation.zoniseg
{
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Vuj
   {
      
      private static const nyp:int = 210;
      
      private static const qidozu:int = 30;
      
      private const cache:Object = {};
      
      public function Vuj()
      {
         super();
      }
      
      private static function luf(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource) : String
      {
         return _arg_1.id.toString() + "_" + _arg_2.id.toString() + "_" + _arg_3.id.toString();
      }
      
      private static function createTexture(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource) : BitmapData
      {
         var _local_9:int = 0;
         var _local_4:BitmapData = _arg_1.data;
         var _local_5:BitmapData = _arg_2.data;
         var _local_6:BitmapData = _arg_3.data;
         var _local_7:BitmapData = new BitmapData(nyp * qidozu,nyp,true,0);
         var _local_8:String = BlendMode.NORMAL;
         while(_local_9 < qidozu)
         {
            wej(_local_4,_local_7,_local_9,nyp,_local_8);
            mabav(_local_5,_local_7,_local_9,nyp,_local_8);
            man(_local_6,_local_7,_local_9,nyp,_local_8);
            _local_9++;
         }
         return _local_7;
      }
      
      private static function wej(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:String) : void
      {
         var _local_6:ColorTransform = new ColorTransform();
         if(_arg_3 < 14)
         {
            _local_6.alphaMultiplier = _arg_3 / 14;
         }
         else if(_arg_3 < 25)
         {
            _local_6.alphaMultiplier = 1;
         }
         else
         {
            _local_6.alphaMultiplier = 1 - (_arg_3 - 24) / 5;
         }
         var _local_7:Matrix = new Matrix();
         _local_7.tx = _arg_3 * _arg_4 + 0.5 * (_arg_4 - _arg_1.width);
         _local_7.ty = 0.5 * (_arg_4 - _arg_1.height);
         _arg_2.draw(_arg_1,_local_7,_local_6,_arg_5,null,true);
      }
      
      private static function mabav(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:String) : void
      {
         var _local_6:ColorTransform = new ColorTransform();
         if(_arg_3 < 5)
         {
            _local_6.alphaMultiplier = _arg_3 / 5;
         }
         else if(_arg_3 < 25)
         {
            _local_6.alphaMultiplier = 1;
         }
         else
         {
            _local_6.alphaMultiplier = 1 - (_arg_3 - 24) / 5;
         }
         var _local_7:Matrix = new Matrix();
         _local_7.translate(-0.5 * _arg_1.width,-0.5 * _arg_1.height);
         _local_7.rotate(2 * _arg_3 * Math.PI / 180);
         _local_7.translate(_arg_3 * _arg_4 + 0.5 * _arg_4,0.5 * _arg_4);
         _arg_2.draw(_arg_1,_local_7,_local_6,_arg_5,null,true);
      }
      
      private static function man(_arg_1:BitmapData, _arg_2:BitmapData, _arg_3:int, _arg_4:int, _arg_5:String) : void
      {
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:ColorTransform = new ColorTransform();
         if(_arg_3 < 24)
         {
            _local_6 = _arg_3 / 24;
            _local_8.alphaMultiplier = _local_6;
            _local_7 = 0.4 + 0.6 * _local_6;
         }
         else if(_arg_3 < 25)
         {
            _local_8.alphaMultiplier = 1;
            _local_7 = 1;
         }
         else
         {
            _local_6 = 1 - (_arg_3 - 24) / 5;
            _local_8.alphaMultiplier = _local_6;
            _local_7 = 0.2 + 0.8 * _local_6;
         }
         var _local_9:Matrix = new Matrix();
         _local_9.translate(-0.5 * _arg_1.width,-0.5 * _arg_1.height);
         _local_9.scale(_local_7,_local_7);
         _local_9.rotate(2 * -_arg_3 * Math.PI / 180);
         _local_9.translate(_arg_3 * _arg_4 + 0.5 * _arg_4,0.5 * _arg_4);
         _arg_2.draw(_arg_1,_local_9,_local_8,_arg_5,null,true);
      }
      
      public function getTexture(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource) : BitmapData
      {
         var _local_4:Gus = this.kudewif(_arg_1,_arg_2,_arg_3);
         ++_local_4.funu;
         return _local_4.texture;
      }
      
      public function rebujeq(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource) : void
      {
         var _local_4:String = luf(_arg_1,_arg_2,_arg_3);
         var _local_5:Gus = this.cache[_local_4];
         if(_local_5 != null)
         {
            --_local_5.funu;
            if(_local_5.funu == 0)
            {
               _local_5.texture.dispose();
               delete this.cache[_local_4];
            }
         }
      }
      
      private function kudewif(_arg_1:ImageResource, _arg_2:ImageResource, _arg_3:ImageResource) : Gus
      {
         var _local_4:String = luf(_arg_1,_arg_2,_arg_3);
         var _local_5:Gus = this.cache[_local_4];
         if(_local_5 == null)
         {
            _local_5 = new Gus();
            _local_5.texture = createTexture(_arg_1,_arg_2,_arg_3);
            this.cache[_local_4] = _local_5;
         }
         return _local_5;
      }
   }
}

