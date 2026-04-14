package obfuscation.raryzuzif
{
   import alternativa.engine3d.objects.BSP;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.engine3d.objects.Sprite3D;
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.utils.clearDictionary;
   import flash.utils.Dictionary;
   
   public class Deceg
   {
      
      private var non:Dictionary = new Dictionary();
      
      private var fiqahof:Dictionary = new Dictionary();
      
      private var dudis:Dictionary = new Dictionary();
      
      public function Deceg()
      {
         super();
      }
      
      public function pigi(_arg_1:PropMesh, _arg_2:String, _arg_3:BSP) : void
      {
         var _local_4:Syfysyhi = this.lulosyj(_arg_1,_arg_2);
         _local_4.jakef(_arg_3);
      }
      
      private function lulosyj(_arg_1:PropMesh, _arg_2:String) : Syfysyhi
      {
         return Syfysyhi(this.cepezuz(this.non,_arg_1,_arg_2,Syfysyhi));
      }
      
      public function bykyziku(_arg_1:PropMesh, _arg_2:String, _arg_3:Mesh, _arg_4:String = null) : void
      {
         var _local_5:Zegyqoga = this.wuhycyso(_arg_1,_arg_2);
         _local_5.add(_arg_3,_arg_4);
      }
      
      private function wuhycyso(_arg_1:PropMesh, _arg_2:String) : Zegyqoga
      {
         return Zegyqoga(this.cepezuz(this.fiqahof,_arg_1,_arg_2,Zegyqoga));
      }
      
      public function mynu(_arg_1:PropSprite, _arg_2:Sprite3D) : void
      {
         var _local_3:Hifiry = this.cytyzah(_arg_1);
         _local_3.mynu(_arg_2);
      }
      
      private function cytyzah(_arg_1:PropSprite) : Hifiry
      {
         return Hifiry(this.cepezuz(this.dudis,_arg_1,null,Hifiry));
      }
      
      private function cepezuz(_arg_1:Dictionary, _arg_2:PropObject, _arg_3:String, _arg_4:Class) : Kedetino
      {
         var _local_5:Dictionary = _arg_1[_arg_2];
         if(_local_5 == null)
         {
            _local_5 = new Dictionary();
            _arg_1[_arg_2] = _local_5;
         }
         var _local_6:Kedetino = _local_5[_arg_3];
         if(_local_6 == null)
         {
            _local_6 = new _arg_4(_arg_2,_arg_3);
            _local_5[_arg_3] = _local_6;
         }
         return _local_6;
      }
      
      public function hahizory() : Vector.<Kedetino>
      {
         var _local_1:Vector.<Kedetino> = new Vector.<Kedetino>();
         this.wimejof(this.non,_local_1);
         this.wimejof(this.fiqahof,_local_1);
         this.wimejof(this.dudis,_local_1);
         return _local_1;
      }
      
      private function wimejof(_arg_1:Dictionary, _arg_2:Vector.<Kedetino>) : void
      {
         var _local_3:Dictionary = null;
         var _local_4:Kedetino = null;
         for each(_local_3 in _arg_1)
         {
            for each(_local_4 in _local_3)
            {
               _arg_2.push(_local_4);
            }
         }
      }
      
      public function clear() : void
      {
         this.gukanaz(this.fiqahof);
         this.gukanaz(this.non);
         this.gukanaz(this.dudis);
      }
      
      private function gukanaz(_arg_1:Dictionary) : void
      {
         var _local_2:* = undefined;
         for(_local_2 in _arg_1)
         {
            clearDictionary(_arg_1[_local_2]);
            delete _arg_1[_local_2];
         }
      }
   }
}

