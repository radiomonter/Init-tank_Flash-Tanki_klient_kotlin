package obfuscation.vecuhamep
{
   import alternativa.osgi.service.logging.LogService;
   import flash.filters.BitmapFilter;
   import flash.filters.ColorMatrixFilter;
   import obfuscation.wadili.Cupudiw;
   import obfuscation.wadili.Qypapeliz;
   import obfuscation.wadili.Vysip;
   import platform.client.fp10.core.model.ObjectLoadListener;
   
   public class Meqof extends Qypapeliz implements Vysip, ObjectLoadListener, Jijapib
   {
      
      [Inject]
      public static var logService:LogService;
      
      private static var cor:ColorMatrixFilter = new ColorMatrixFilter();
      
      public function Meqof()
      {
         super();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         var _local_1:Cupudiw = null;
         var _local_2:Object = {};
         var _local_3:Vector.<Cupudiw> = getInitParam().data;
         for each(_local_1 in _local_3)
         {
            _local_2[_local_1.key] = new Maby(_local_1);
         }
         putData(Object,_local_2);
      }
      
      public function createFilter(_arg_1:String) : BitmapFilter
      {
         var _local_2:Object = Object(getData(Object));
         var _local_3:Maby = _local_2[_arg_1];
         if(_local_3 != null)
         {
            return _local_3.createFilter();
         }
         return cor;
      }
   }
}

