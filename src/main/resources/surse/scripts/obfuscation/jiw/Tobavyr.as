package obfuscation.jiw
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   import obfuscation.ligy.Zyjova;
   
   public class Tobavyr
   {
      
      private static const himyhage:Class = Dusaz;
      
      private static const licuh:BitmapData = new himyhage().bitmapData;
      
      private static const nuhuzimy:Class = Gydofot;
      
      private static const pycifotiw:BitmapData = new nuhuzimy().bitmapData;
      
      private static const jipufame:Class = Bezuqy;
      
      private static const nipepoko:BitmapData = new jipufame().bitmapData;
      
      private static const fakoceb:Class = Motomiwyz;
      
      private static const pihiwacat:Dictionary = new Dictionary();
      
      private static const dyves:int = nipepoko.width;
      
      private static const kusacipuk:BitmapData = new fakoceb().bitmapData;
      
      private static const dyg:Dictionary = new Dictionary();
      
      pihiwacat[Zyjova.NEUTRAL] = pycifotiw;
      pihiwacat[Zyjova.BLUE] = licuh;
      pihiwacat[Zyjova.RED] = nipepoko;
      
      public function Tobavyr()
      {
         super();
      }
      
      public static function zimory(_arg_1:Zyjova) : BitmapData
      {
         return pihiwacat[_arg_1];
      }
      
      public static function nigurarip(_arg_1:String) : BitmapData
      {
         var _local_2:Number = _arg_1.charCodeAt(0) - "A".charCodeAt(0);
         var _local_3:BitmapData = dyg[_local_2];
         if(_local_3 == null)
         {
            _local_3 = new BitmapData(dyves,kusacipuk.height,true,0);
            _local_3.copyPixels(kusacipuk,new Rectangle(_local_2 * dyves,0,dyves,kusacipuk.height),new Point());
            dyg[_local_2] = _local_3;
         }
         return _local_3;
      }
   }
}

