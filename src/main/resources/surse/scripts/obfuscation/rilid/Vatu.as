package obfuscation.rilid
{
   import obfuscation.kisagehy.Dyrur;
   import obfuscation.kisagehy.Holij;
   import obfuscation.kisagehy.Joqece;
   import obfuscation.kisagehy.Waqi;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.resource.types.SoundResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.clients.flash.resources.resource.MapResource;
   
   public class Vatu implements Kuqedeqi
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Kuqedeqi>;
      
      public function Vatu(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Kuqedeqi>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function kof() : MapResource
      {
         var pify:MapResource = null;
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.kof();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.vodu();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.bobenequp();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function nifa() : Number
      {
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         var pify:Number = NaN;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.nifa();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.vem();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
      
      public function fiqal() : Number
      {
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         var pify:Number = NaN;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.fiqal();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.meru();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.fis();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.gyl();
               hutace += 1;
            }
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
         var hutace:int = 0;
         var nyfusi:Kuqedeqi = null;
         try
         {
            Model.object = this.object;
            hutace = 0;
            while(hutace < this.impl.length)
            {
               nyfusi = this.impl[hutace];
               pify = nyfusi.jufem();
               hutace += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

