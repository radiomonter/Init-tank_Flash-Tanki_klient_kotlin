package obfuscation.rilid
{
   import obfuscation.kisagehy.Dyrur;
   import obfuscation.kisagehy.Holij;
   import obfuscation.kisagehy.Joqece;
   import obfuscation.kisagehy.Waqi;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Tepysy implements Kuqedeqi
   {
      
      private var object:IGameObject;
      
      private var impl:Kuqedeqi;
      
      public function Tepysy(_arg_1:IGameObject, _arg_2:Kuqedeqi)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function kof() : MapResource
      {
         var pify:MapResource = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.kof();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function vodu() : SoundResource
      {
         var pify:SoundResource = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.vodu();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function bobenequp() : Joqece
      {
         var pify:Joqece = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.bobenequp();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function nifa() : Number
      {
         var pify:Number = NaN;
         try
         {
            Model.object = this.object;
            pify = this.impl.nifa();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function vem() : Vector3d
      {
         var pify:Vector3d = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.vem();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function fiqal() : Number
      {
         var pify:Number = NaN;
         try
         {
            Model.object = this.object;
            pify = this.impl.fiqal();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function meru() : Dyrur
      {
         var pify:Dyrur = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.meru();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function fis() : Holij
      {
         var pify:Holij = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.fis();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function gyl() : Waqi
      {
         var pify:Waqi = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.gyl();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function jufem() : uint
      {
         var pify:uint = 0;
         try
         {
            Model.object = this.object;
            pify = this.impl.jufem();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

