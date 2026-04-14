package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.GameCamera;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   
   public class Maga implements ISound3DEffect
   {
      
      private static const myc:Vector3 = new Vector3();
      
      private var pyke:Tank;
      
      private var vugale:Pinasegi;
      
      private var tynep:Sound3D;
      
      private var letatuf:int = 1;
      
      private var _enabled:Boolean = false;
      
      private var rapi:Boolean;
      
      public function Maga(_arg_1:Sound, _arg_2:Sound, _arg_3:Sound, _arg_4:Sound)
      {
         super();
         this.vugale = new Pinasegi(_arg_1,_arg_2,_arg_3);
         this.tynep = Sound3D.create(_arg_4,0.5,500,2000,5);
      }
      
      public function rezotun() : void
      {
         this.letatuf = Pinasegi.IDLE;
         if(this._enabled)
         {
            this.vugale.rezotun();
         }
      }
      
      public function qucez() : void
      {
         this.letatuf = Pinasegi.numiwi;
         if(this._enabled)
         {
            this.vugale.qucez();
         }
      }
      
      public function vafavokan() : void
      {
         this.letatuf = Pinasegi.ryvukaba;
         if(this._enabled)
         {
            this.vugale.vafavokan();
         }
      }
      
      public function nevenugu(_arg_1:Tank) : void
      {
         this.pyke = _arg_1;
      }
      
      public function kuvavo(_arg_1:Boolean) : void
      {
         var _local_2:SoundChannel = null;
         if(this._enabled)
         {
            if(_arg_1 && this.rapi)
            {
               if(!this.tynep.rehyv())
               {
                  _local_2 = this.tynep.play(100,0);
                  if(_local_2 != null)
                  {
                     _local_2.addEventListener(Event.SOUND_COMPLETE,this.lunam);
                  }
               }
            }
            else if(this.tynep.rehyv())
            {
               this.tynep.stop();
            }
         }
      }
      
      private function lunam(_arg_1:Event) : void
      {
         if(this.rapi)
         {
            this.tynep.play(3000,9999);
         }
      }
      
      public function set bowohig(_arg_1:Boolean) : void
      {
         if(this.rapi != _arg_1)
         {
            this.rapi = _arg_1;
            if(!this.rapi)
            {
               this.tynep.stop();
            }
         }
      }
      
      public function play(_arg_1:int, _arg_2:GameCamera) : void
      {
         if(this.pyke != null && this._enabled)
         {
            myc.copy(this.pyke.qiniwu().state.position);
            this.vugale.update(_arg_1,_arg_2.position,myc,_arg_2.ziko);
            this.tynep.guma(_arg_2.position,myc,_arg_2.ziko);
         }
      }
      
      public function destroy() : void
      {
         this.vugale.stop();
         this.tynep.stop();
      }
      
      public function kill() : void
      {
      }
      
      public function get bag() : int
      {
         return 2;
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.copy(this.pyke.qiniwu().state.position);
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         if(this._enabled != _arg_1)
         {
            this._enabled = _arg_1;
            this.galazoby();
         }
      }
      
      private function galazoby() : void
      {
         if(this._enabled)
         {
            switch(this.letatuf)
            {
               case Pinasegi.IDLE:
                  this.vugale.rezotun();
                  break;
               case Pinasegi.numiwi:
                  this.vugale.qucez();
                  break;
               case Pinasegi.ryvukaba:
                  this.vugale.vafavokan();
            }
         }
         else
         {
            this.tynep.stop();
            this.vugale.hebuk();
         }
      }
   }
}

