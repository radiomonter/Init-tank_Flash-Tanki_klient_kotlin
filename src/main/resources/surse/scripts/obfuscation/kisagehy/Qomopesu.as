package obfuscation.kisagehy
{
   import obfuscation.kofen.Vector3d;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Qomopesu
   {
      
      private var ruditazyh:Waqi;
      
      private var kar:Holij;
      
      private var kabigo:Dyrur;
      
      private var sygytaje:Number;
      
      private var cuwujyr:MapResource;
      
      private var wuse:Vector3d;
      
      private var qarekuf:Number;
      
      private var kaqapi:Joqece;
      
      private var dovud:int;
      
      public function Qomopesu(_arg_1:Waqi = null, _arg_2:Holij = null, _arg_3:Dyrur = null, _arg_4:Number = 0, _arg_5:MapResource = null, _arg_6:Vector3d = null, _arg_7:Number = 0, _arg_8:Joqece = null, _arg_9:int = 0)
      {
         super();
         this.ruditazyh = _arg_1;
         this.kar = _arg_2;
         this.kabigo = _arg_3;
         this.sygytaje = _arg_4;
         this.cuwujyr = _arg_5;
         this.wuse = _arg_6;
         this.qarekuf = _arg_7;
         this.kaqapi = _arg_8;
         this.dovud = _arg_9;
      }
      
      public function get bobu() : Waqi
      {
         return this.ruditazyh;
      }
      
      public function set bobu(_arg_1:Waqi) : void
      {
         this.ruditazyh = _arg_1;
      }
      
      public function get nosisaw() : Holij
      {
         return this.kar;
      }
      
      public function set nosisaw(_arg_1:Holij) : void
      {
         this.kar = _arg_1;
      }
      
      public function get fogParams() : Dyrur
      {
         return this.kabigo;
      }
      
      public function set fogParams(_arg_1:Dyrur) : void
      {
         this.kabigo = _arg_1;
      }
      
      public function get gravity() : Number
      {
         return this.sygytaje;
      }
      
      public function set gravity(_arg_1:Number) : void
      {
         this.sygytaje = _arg_1;
      }
      
      public function get gatitozez() : MapResource
      {
         return this.cuwujyr;
      }
      
      public function set gatitozez(_arg_1:MapResource) : void
      {
         this.cuwujyr = _arg_1;
      }
      
      public function get joneb() : Vector3d
      {
         return this.wuse;
      }
      
      public function set joneb(_arg_1:Vector3d) : void
      {
         this.wuse = _arg_1;
      }
      
      public function get comacena() : Number
      {
         return this.qarekuf;
      }
      
      public function set comacena(_arg_1:Number) : void
      {
         this.qarekuf = _arg_1;
      }
      
      public function get nopoh() : Joqece
      {
         return this.kaqapi;
      }
      
      public function set nopoh(_arg_1:Joqece) : void
      {
         this.kaqapi = _arg_1;
      }
      
      public function get ssaoColor() : int
      {
         return this.dovud;
      }
      
      public function set ssaoColor(_arg_1:int) : void
      {
         this.dovud = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BattleMapCC [";
         _local_1 += "dynamicShadowParams = " + this.nosisaw + " ";
         _local_1 += "fogParams = " + this.fogParams + " ";
         _local_1 += "gravity = " + this.gravity + " ";
         _local_1 += "mapResource = " + this.gatitozez + " ";
         _local_1 += "skyBoxRevolutionAxis = " + this.joneb + " ";
         _local_1 += "skyBoxRevolutionSpeed = " + this.comacena + " ";
         _local_1 += "skybox = " + this.nopoh + " ";
         _local_1 += "ssaoColor = " + this.ssaoColor + " ";
         return _local_1 + "]";
      }
   }
}

