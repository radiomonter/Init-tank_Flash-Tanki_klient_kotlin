package alternativa.tanks.engine3d
{
   import alternativa.tanks.services.colortransform.Bajoryta;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.utils.Dictionary;
   import org1.osflash.signals.Signal;
   
   public class Qelen implements Poco
   {
      
      private static const kupif:ColorTransform = new ColorTransform();
      
      private const jywo:Signal = new Signal();
      
      private const textures:Dictionary = new Dictionary();
      
      private var colorTransform:ColorTransform;
      
      public function Qelen()
      {
         super();
      }
      
      public function clear() : void
      {
         var _local_1:int = 0;
         var _local_3:BitmapData = null;
         var _local_2:* = undefined;
         if(this.colorTransform == null)
         {
            this.clearDictionary(this.textures);
         }
         else
         {
            _local_1 = 0;
            for(_local_2 in this.textures)
            {
               _local_3 = this.textures[_local_2];
               _local_3.dispose();
               delete this.textures[_local_2];
               _local_1++;
            }
         }
      }
      
      public function getTexture(_arg_1:BitmapData, _arg_2:Boolean = true) : BitmapData
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("Texture is null");
         }
         var _local_3:BitmapData = this.textures[_arg_1];
         if(_local_3 == null)
         {
            _local_3 = this.venubaky(_arg_1,_arg_2);
            this.textures[_arg_1] = _local_3;
         }
         return _local_3;
      }
      
      private function venubaky(_arg_1:BitmapData, _arg_2:Boolean = true) : BitmapData
      {
         if(this.colorTransform == null)
         {
            return _arg_1;
         }
         if(_arg_2)
         {
            return Bajoryta.sulusocuc(_arg_1,this.colorTransform);
         }
         return _arg_1.clone();
      }
      
      public function zynucis(_arg_1:Function) : void
      {
         this.jywo.add(_arg_1);
      }
      
      public function setColorTransform(_arg_1:ColorTransform) : void
      {
         var _local_2:ColorTransform = this.basowav(_arg_1);
         if(!Bajoryta.diba(this.colorTransform,_local_2))
         {
            this.colorTransform = _local_2;
            this.fuzarule();
            this.jywo.dispatch();
         }
      }
      
      public function clearDictionary(_arg_1:Dictionary) : void
      {
         var _local_2:* = undefined;
         for(_local_2 in _arg_1)
         {
            delete _arg_1[_local_2];
         }
      }
      
      private function basowav(_arg_1:ColorTransform) : ColorTransform
      {
         var _local_2:ColorTransform = Bajoryta.clone(_arg_1);
         if(Bajoryta.diba(_local_2,kupif))
         {
            return null;
         }
         return _local_2;
      }
      
      private function fuzarule() : void
      {
         var _local_2:BitmapData = null;
         var _local_3:int = 0;
         var _local_1:* = undefined;
         for(_local_1 in this.textures)
         {
            _local_2 = this.textures[_local_1];
            if(_local_2 != _local_1)
            {
               _local_2.dispose();
               _local_3++;
            }
            this.textures[_local_1] = this.venubaky(_local_1);
         }
      }
   }
}

