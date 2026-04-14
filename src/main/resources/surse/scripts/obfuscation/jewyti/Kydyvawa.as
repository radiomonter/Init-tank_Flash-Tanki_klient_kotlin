package obfuscation.jewyti
{
   import alternativa.tanks.camera.CameraBookmark;
   import alternativa.tanks.camera.CameraBookmarks;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import flash.utils.Dictionary;
   
   public class Kydyvawa implements Gonatedog
   {
      
      private var tokuzoz:Object = new CameraBookmarks(10);
      
      private var jogu:Dictionary = new Dictionary();
      
      private var controller:Duso;
      
      public function Kydyvawa(_arg_1:Duso)
      {
         super();
         this.controller = _arg_1;
         this.pewag();
      }
      
      public function tabuduhy(_arg_1:KeyboardEvent) : void
      {
         var _local_2:* = this.jogu[_arg_1.keyCode];
         if(_local_2 != null)
         {
            if(_arg_1.ctrlKey)
            {
               this.saveCurrentPositionCameraToBookmark(_local_2);
            }
            else
            {
               this.firy(_local_2);
            }
         }
      }
      
      public function mokuby(_arg_1:KeyboardEvent) : void
      {
      }
      
      private function pewag() : void
      {
         this.jogu[Keyboard.NUMBER_0] = 0;
         this.jogu[Keyboard.NUMBER_1] = 1;
         this.jogu[Keyboard.NUMBER_2] = 2;
         this.jogu[Keyboard.NUMBER_3] = 3;
         this.jogu[Keyboard.NUMBER_4] = 4;
         this.jogu[Keyboard.NUMBER_5] = 5;
         this.jogu[Keyboard.NUMBER_6] = 6;
         this.jogu[Keyboard.NUMBER_7] = 7;
         this.jogu[Keyboard.NUMBER_8] = 8;
         this.jogu[Keyboard.NUMBER_9] = 9;
      }
      
      private function saveCurrentPositionCameraToBookmark(_arg_1:int) : void
      {
         this.tokuzoz.saveCurrentPositionCameraToBookmark(_arg_1);
      }
      
      private function firy(_arg_1:int) : void
      {
         var _local_2:CameraBookmark = this.tokuzoz.getBookmark(_arg_1);
         if(_local_2 != null)
         {
            this.controller.biv(_local_2.position,_local_2.puzacydab);
         }
      }
   }
}

