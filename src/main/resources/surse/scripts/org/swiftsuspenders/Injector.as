package org.swiftsuspenders
{
   import flash.system.ApplicationDomain;
   import flash.utils.Dictionary;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import org.swiftsuspenders.injectionpoints.ConstructorInjectionPoint;
   import org.swiftsuspenders.injectionpoints.InjectionPoint;
   import org.swiftsuspenders.injectionpoints.MethodInjectionPoint;
   import org.swiftsuspenders.injectionpoints.NoParamsConstructorInjectionPoint;
   import org.swiftsuspenders.injectionpoints.PostConstructInjectionPoint;
   import org.swiftsuspenders.injectionpoints.PropertyInjectionPoint;
   import org.swiftsuspenders.injectionresults.InjectClassResult;
   import org.swiftsuspenders.injectionresults.InjectOtherRuleResult;
   import org.swiftsuspenders.injectionresults.InjectSingletonResult;
   import org.swiftsuspenders.injectionresults.InjectValueResult;
   
   public class Injector
   {
      
      private static var INJECTION_POINTS_CACHE:Dictionary = new Dictionary(true);
      
      private var m_parentInjector:Injector;
      
      private var m_applicationDomain:ApplicationDomain;
      
      private var m_mappings:Dictionary;
      
      private var m_injecteeDescriptions:Dictionary;
      
      private var m_attendedToInjectees:Dictionary;
      
      private var m_xmlMetadata:XML;
      
      public function Injector(_arg_1:XML = null)
      {
         super();
         this.m_mappings = new Dictionary();
         if(_arg_1 != null)
         {
            this.m_injecteeDescriptions = new Dictionary(true);
         }
         else
         {
            this.m_injecteeDescriptions = INJECTION_POINTS_CACHE;
         }
         this.m_attendedToInjectees = new Dictionary(true);
         this.m_xmlMetadata = _arg_1;
      }
      
      public static function purgeInjectionPointsCache() : void
      {
         INJECTION_POINTS_CACHE = new Dictionary(true);
      }
      
      public function mapValue(_arg_1:Class, _arg_2:Object, _arg_3:String = "") : *
      {
         var _local_4:InjectionConfig = this.getMapping(_arg_1,_arg_3);
         _local_4.setResult(new InjectValueResult(_arg_2));
         return _local_4;
      }
      
      public function mapClass(_arg_1:Class, _arg_2:Class, _arg_3:String = "") : *
      {
         var _local_4:InjectionConfig = this.getMapping(_arg_1,_arg_3);
         _local_4.setResult(new InjectClassResult(_arg_2));
         return _local_4;
      }
      
      public function mapSingleton(_arg_1:Class, _arg_2:String = "") : *
      {
         return this.mapSingletonOf(_arg_1,_arg_1,_arg_2);
      }
      
      public function mapSingletonOf(_arg_1:Class, _arg_2:Class, _arg_3:String = "") : *
      {
         var _local_4:InjectionConfig = this.getMapping(_arg_1,_arg_3);
         _local_4.setResult(new InjectSingletonResult(_arg_2));
         return _local_4;
      }
      
      public function mapRule(_arg_1:Class, _arg_2:*, _arg_3:String = "") : *
      {
         var _local_4:InjectionConfig = this.getMapping(_arg_1,_arg_3);
         _local_4.setResult(new InjectOtherRuleResult(_arg_2));
         return _arg_2;
      }
      
      public function getMapping(_arg_1:Class, _arg_2:String = "") : InjectionConfig
      {
         var _local_3:String = getQualifiedClassName(_arg_1);
         var _local_4:InjectionConfig = this.m_mappings[_local_3 + "#" + _arg_2];
         if(!_local_4)
         {
            _local_4 = this.m_mappings[_local_3 + "#" + _arg_2] = new InjectionConfig(_arg_1,_arg_2);
         }
         return _local_4;
      }
      
      public function injectInto(_arg_1:Object) : void
      {
         var _local_2:InjectionPoint = null;
         var _local_7:int = 0;
         if(Boolean(this.m_attendedToInjectees[_arg_1]))
         {
            return;
         }
         this.m_attendedToInjectees[_arg_1] = true;
         var _local_3:Class = getConstructor(_arg_1);
         var _local_4:InjecteeDescription = this.m_injecteeDescriptions[_local_3] || this.getInjectionPoints(_local_3);
         var _local_5:Array = _local_4.injectionPoints;
         var _local_6:int = int(_local_5.length);
         while(_local_7 < _local_6)
         {
            _local_2 = _local_5[_local_7];
            _local_2.applyInjection(_arg_1,this);
            _local_7++;
         }
      }
      
      public function instantiate(_arg_1:Class) : *
      {
         var _local_2:InjecteeDescription = this.m_injecteeDescriptions[_arg_1];
         if(!_local_2)
         {
            _local_2 = this.getInjectionPoints(_arg_1);
         }
         var _local_3:InjectionPoint = _local_2.ctor;
         var _local_4:* = _local_3.applyInjection(_arg_1,this);
         this.injectInto(_local_4);
         return _local_4;
      }
      
      public function unmap(_arg_1:Class, _arg_2:String = "") : void
      {
         var _local_3:InjectionConfig = this.getConfigurationForRequest(_arg_1,_arg_2);
         if(!_local_3)
         {
            throw new InjectorError("Error while removing an injector mapping: " + "No mapping defined for class " + getQualifiedClassName(_arg_1) + ", named \"" + _arg_2 + "\"");
         }
         _local_3.setResult(null);
      }
      
      public function hasMapping(_arg_1:Class, _arg_2:String = "") : Boolean
      {
         var _local_3:InjectionConfig = this.getConfigurationForRequest(_arg_1,_arg_2);
         if(!_local_3)
         {
            return false;
         }
         return _local_3.hasResponse(this);
      }
      
      public function getInstance(_arg_1:Class, _arg_2:String = "") : *
      {
         var _local_3:InjectionConfig = this.getConfigurationForRequest(_arg_1,_arg_2);
         if(!_local_3 || !_local_3.hasResponse(this))
         {
            throw new InjectorError("Error while getting mapping response: " + "No mapping defined for class " + getQualifiedClassName(_arg_1) + ", named \"" + _arg_2 + "\"");
         }
         return _local_3.getResponse(this);
      }
      
      public function createChildInjector(_arg_1:ApplicationDomain = null) : Injector
      {
         var _local_2:Injector = new Injector();
         _local_2.setApplicationDomain(_arg_1);
         _local_2.setParentInjector(this);
         return _local_2;
      }
      
      public function setApplicationDomain(_arg_1:ApplicationDomain) : void
      {
         this.m_applicationDomain = _arg_1;
      }
      
      public function getApplicationDomain() : ApplicationDomain
      {
         return Boolean(this.m_applicationDomain) ? this.m_applicationDomain : ApplicationDomain.currentDomain;
      }
      
      public function setParentInjector(_arg_1:Injector) : void
      {
         if(Boolean(this.m_parentInjector) && !_arg_1)
         {
            this.m_attendedToInjectees = new Dictionary(true);
         }
         this.m_parentInjector = _arg_1;
         if(Boolean(_arg_1))
         {
            this.m_attendedToInjectees = _arg_1.attendedToInjectees;
         }
      }
      
      public function getParentInjector() : Injector
      {
         return this.m_parentInjector;
      }
      
      internal function getAncestorMapping(_arg_1:Class, _arg_2:String = null) : InjectionConfig
      {
         var _local_3:InjectionConfig = null;
         var _local_4:Injector = this.m_parentInjector;
         while(Boolean(_local_4))
         {
            _local_3 = _local_4.getConfigurationForRequest(_arg_1,_arg_2,false);
            if(Boolean(_local_3) && _local_3.hasOwnResponse())
            {
               return _local_3;
            }
            _local_4 = _local_4.getParentInjector();
         }
         return null;
      }
      
      internal function get attendedToInjectees() : Dictionary
      {
         return this.m_attendedToInjectees;
      }
      
      private function getInjectionPoints(clazz:Class) : InjecteeDescription
      {
         var injectionPoints:Array;
         var injecteeDescription:InjecteeDescription;
         var node:XML = null;
         var ctorInjectionPoint:InjectionPoint = null;
         var injectionPoint:InjectionPoint = null;
         var postConstructMethodPoints:Array = null;
         var description:XML = describeType(clazz);
         if(description.@name != "Object" && description.factory.extendsClass.length() == 0)
         {
            throw new InjectorError("Interfaces can\'t be used as instantiatable classes.");
         }
         injectionPoints = [];
         if(Boolean(this.m_xmlMetadata))
         {
            this.createInjectionPointsFromConfigXML(description);
            this.addParentInjectionPoints(description,injectionPoints);
         }
         node = description.factory.constructor[0];
         if(Boolean(node))
         {
            ctorInjectionPoint = new ConstructorInjectionPoint(node,clazz,this);
         }
         else
         {
            ctorInjectionPoint = new NoParamsConstructorInjectionPoint();
         }
         for each(node in description.factory.*.(name() == "variable" || name() == "accessor").metadata.(@name == "Inject"))
         {
            injectionPoint = new PropertyInjectionPoint(node);
            injectionPoints.push(injectionPoint);
         }
         for each(node in description.factory.method.metadata.(@name == "Inject"))
         {
            injectionPoint = new MethodInjectionPoint(node,this);
            injectionPoints.push(injectionPoint);
         }
         postConstructMethodPoints = [];
         for each(node in description.factory.method.metadata.(@name == "PostConstruct"))
         {
            injectionPoint = new PostConstructInjectionPoint(node,this);
            postConstructMethodPoints.push(injectionPoint);
         }
         if(postConstructMethodPoints.length > 0)
         {
            postConstructMethodPoints.sortOn("order",Array.NUMERIC);
            injectionPoints.push.apply(injectionPoints,postConstructMethodPoints);
         }
         injecteeDescription = new InjecteeDescription(ctorInjectionPoint,injectionPoints);
         this.m_injecteeDescriptions[clazz] = injecteeDescription;
         return injecteeDescription;
      }
      
      private function getConfigurationForRequest(_arg_1:Class, _arg_2:String, _arg_3:Boolean = true) : InjectionConfig
      {
         var _local_4:String = getQualifiedClassName(_arg_1);
         var _local_5:InjectionConfig = this.m_mappings[_local_4 + "#" + _arg_2];
         if(Boolean(!_local_5 && _arg_3) && Boolean(this.m_parentInjector) && this.m_parentInjector.hasMapping(_arg_1,_arg_2))
         {
            _local_5 = this.getAncestorMapping(_arg_1,_arg_2);
         }
         return _local_5;
      }
      
      private function createInjectionPointsFromConfigXML(description:XML) : void
      {
         var node:XML = null;
         var className:String = null;
         var metaNode:XML = null;
         var typeNode:XML = null;
         var arg:XML = null;
         for each(node in description..metadata.(@name == "Inject" || @name == "PostConstruct"))
         {
            delete node.parent().metadata.(@name == "Inject" || @name == "PostConstruct")[0];
         }
         className = description.factory.@type;
         for each(node in this.m_xmlMetadata.type.(@name == className).children())
         {
            metaNode = <metadata/>;
            if(node.name() == "postconstruct")
            {
               metaNode.@name = "PostConstruct";
               if(Boolean(node.@order.length()))
               {
                  metaNode.appendChild(<arg key='order' value="{node.@order}"/>);
               }
            }
            else
            {
               metaNode.@name = "Inject";
               if(Boolean(node.@injectionname.length()))
               {
                  metaNode.appendChild(<arg key='name' value="{node.@injectionname}"/>);
               }
               for each(arg in node.arg)
               {
                  metaNode.appendChild(<arg key='name' value="{arg.@injectionname}"/>);
               }
            }
            if(node.name() == "constructor")
            {
               typeNode = description.factory[0];
            }
            else
            {
               typeNode = description.factory.*.(attribute("name") == node.@name)[0];
               if(!typeNode)
               {
                  throw new InjectorError("Error in XML configuration: Class \"" + className + "\" doesn\'t contain the instance member \"" + node.@name + "\"");
               }
            }
            typeNode.appendChild(metaNode);
         }
      }
      
      private function addParentInjectionPoints(_arg_1:XML, _arg_2:Array) : void
      {
         var _local_3:String = _arg_1.factory.extendsClass.@type[0];
         if(!_local_3)
         {
            return;
         }
         var _local_4:Class = Class(getDefinitionByName(_local_3));
         var _local_5:InjecteeDescription = this.m_injecteeDescriptions[_local_4] || this.getInjectionPoints(_local_4);
         var _local_6:Array = _local_5.injectionPoints;
         _arg_2.push.apply(_arg_2,_local_6);
      }
   }
}

import org.swiftsuspenders.injectionpoints.InjectionPoint;

final class InjecteeDescription
{
   
   public var ctor:InjectionPoint;
   
   public var injectionPoints:Array;
   
   public function InjecteeDescription(_arg_1:InjectionPoint, _arg_2:Array)
   {
      super();
      this.ctor = _arg_1;
      this.injectionPoints = _arg_2;
   }
}
