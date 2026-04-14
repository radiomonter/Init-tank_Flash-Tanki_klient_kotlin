package alternativa.proplib
{
   import alternativa.proplib.objects.PropMesh;
   import alternativa.proplib.objects.PropObject;
   import alternativa.proplib.objects.PropSprite;
   import alternativa.proplib.types.PropData;
   import alternativa.proplib.types.PropGroup;
   import alternativa.proplib.types.PropState;
   import alternativa.proplib.utils.ByteArrayMap;
   import alternativa.proplib.utils.TextureByteDataMap;
   import alternativa.utils.XMLUtils;
   import alternativa.utils.textureutils.TextureByteData;
   import flash.utils.ByteArray;
   
   public class PropLibrary
   {
      
      public static const LIB_FILE_NAME:String = "library.xml";
      
      public static const IMG_FILE_NAME:String = "images.xml";
      
      private var _rootGroup:PropGroup;
      
      private var files:ByteArrayMap;
      
      private var imageMap:TextureByteDataMap;
      
      public function PropLibrary(_arg_1:ByteArrayMap)
      {
         super();
         if(_arg_1 == null)
         {
            throw new ArgumentError("Parameter files is null");
         }
         this.files = _arg_1;
         var _local_2:ByteArray = _arg_1.getValue(IMG_FILE_NAME);
         if(_local_2 != null)
         {
            this.imageMap = this.parseImageMap(XML(_local_2.toString()));
         }
         this._rootGroup = this.parseGroup(XML(_arg_1.getValue(LIB_FILE_NAME).toString()));
      }
      
      public function get name() : String
      {
         return this._rootGroup == null ? null : this._rootGroup.name;
      }
      
      public function get rootGroup() : PropGroup
      {
         return this._rootGroup;
      }
      
      private function parseImageMap(_arg_1:XML) : TextureByteDataMap
      {
         var _local_2:XML = null;
         var _local_3:String = null;
         var _local_4:String = null;
         var _local_5:String = null;
         var _local_6:TextureByteDataMap = new TextureByteDataMap();
         for each(_local_2 in _arg_1.image)
         {
            _local_3 = _local_2.@name;
            _local_4 = _local_2.attribute("new-name").toString().toLowerCase();
            _local_5 = XMLUtils.getAttributeAsString(_local_2,"alpha",null);
            if(_local_5 != null)
            {
               _local_5 = _local_5.toLowerCase();
            }
            _local_6.putValue(_local_3,new TextureByteData(this.files.getValue(_local_4),this.files.getValue(_local_5)));
         }
         return _local_6;
      }
      
      private function parseGroup(_arg_1:XML) : PropGroup
      {
         var _local_2:XML = null;
         var _local_3:XML = null;
         var _local_4:PropGroup = new PropGroup(XMLUtils.copyXMLString(_arg_1.@name));
         for each(_local_2 in _arg_1.prop)
         {
            _local_4.addProp(this.parseProp(_local_2));
         }
         for each(_local_3 in _arg_1.elements("prop-group"))
         {
            _local_4.addGroup(this.parseGroup(_local_3));
         }
         return _local_4;
      }
      
      private function parseProp(_arg_1:XML) : PropData
      {
         var _local_2:XML = null;
         var _local_3:PropData = new PropData(XMLUtils.copyXMLString(_arg_1.@name));
         var _local_4:XMLList = _arg_1.state;
         if(_local_4.length() > 0)
         {
            for each(_local_2 in _local_4)
            {
               _local_3.addState(XMLUtils.copyXMLString(_local_2.@name),this.parseState(_local_2));
            }
         }
         else
         {
            _local_3.addState(PropState.DEFAULT_NAME,this.parseState(_arg_1));
         }
         return _local_3;
      }
      
      private function parseState(_arg_1:XML) : PropState
      {
         var _local_2:XML = null;
         var _local_3:PropState = new PropState();
         var _local_4:XMLList = _arg_1.lod;
         if(_local_4.length() > 0)
         {
            for each(_local_2 in _local_4)
            {
               _local_3.addLOD(this.parsePropObject(_local_2),Number(_local_2.@distance));
            }
         }
         else
         {
            _local_3.addLOD(this.parsePropObject(_arg_1),0);
         }
         return _local_3;
      }
      
      private function parsePropObject(_arg_1:XML) : PropObject
      {
         if(_arg_1.mesh.length() > 0)
         {
            return this.parsePropMesh(_arg_1.mesh[0]);
         }
         if(_arg_1.sprite.length() > 0)
         {
            return this.parsePropSprite(_arg_1.sprite[0]);
         }
         throw new Error("Unknown prop type");
      }
      
      private function parsePropMesh(_arg_1:XML) : PropMesh
      {
         var _local_2:XML = null;
         var _local_4:Object = null;
         var _local_3:ByteArray = this.files.getValue(_arg_1.@file.toString().toLowerCase());
         if(_arg_1.texture.length() > 0)
         {
            _local_4 = {};
            for each(_local_2 in _arg_1.texture)
            {
               _local_4[XMLUtils.copyXMLString(_local_2.@name)] = _local_2.attribute("diffuse-map").toString().toLowerCase();
            }
         }
         var _local_5:String = XMLUtils.getAttributeAsString(_arg_1,"object",null);
         return new PropMesh(_local_3,_local_5,_local_4,this.files,this.imageMap);
      }
      
      private function parsePropSprite(_arg_1:XML) : PropSprite
      {
         var _local_2:String = _arg_1.@file.toString().toLowerCase();
         var _local_3:TextureByteData = this.imageMap == null ? new TextureByteData(this.files.getValue(_local_2)) : this.imageMap.getValue(_local_2);
         var _local_4:Number = XMLUtils.getAttributeAsNumber(_arg_1,"origin-x",0.5);
         var _local_5:Number = XMLUtils.getAttributeAsNumber(_arg_1,"origin-y",0.5);
         var _local_6:Number = XMLUtils.getAttributeAsNumber(_arg_1,"scale",1);
         return new PropSprite(_local_3,_local_4,_local_5,_local_6);
      }
   }
}

