package platform.client.fp10.core.resource.types
{
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundLoaderContext;
   import flash.media.SoundTransform;
   import flash.net.URLRequest;
   
   public class SoundEmptyWrapper extends Sound
   {
      
      public function SoundEmptyWrapper()
      {
         super();
      }
      
      override public function toString() : String
      {
         return "[SoundEmptyWrapper]";
      }
      
      override public function play(_arg_1:Number = 0, _arg_2:int = 0, _arg_3:SoundTransform = null) : SoundChannel
      {
         return null;
      }
      
      override public function load(_arg_1:URLRequest, _arg_2:SoundLoaderContext = null) : void
      {
      }
   }
}

