package org.robotlegs.adapters
{
   import flash.system.ApplicationDomain;
   import org.robotlegs.core.IInjector;
   import org.swiftsuspenders.Injector;
   
   public class SwiftSuspendersInjector extends Injector implements IInjector
   {
      
      protected static const XML_CONFIG:XML = <types>
				<type name='org.robotlegs.mvcs::Actor'>
					<field name='eventDispatcher'/>
				</type>
				<type name='org.robotlegs.mvcs::Command'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
					<field name='injector'/>
					<field name='commandMap'/>
				</type>
				<type name='org.robotlegs.mvcs::Mediator'>
					<field name='contextView'/>
					<field name='mediatorMap'/>
					<field name='eventDispatcher'/>
				</type>
			</types>;
      
      public function SwiftSuspendersInjector(_arg_1:XML = null)
      {
         var _local_2:XML = null;
         if(Boolean(_arg_1))
         {
            for each(_local_2 in XML_CONFIG.children())
            {
               _arg_1.appendChild(_local_2);
            }
         }
         super(_arg_1);
      }
      
      public function createChild(_arg_1:ApplicationDomain = null) : IInjector
      {
         var _local_2:SwiftSuspendersInjector = new SwiftSuspendersInjector();
         _local_2.setApplicationDomain(_arg_1);
         _local_2.setParentInjector(this);
         return _local_2;
      }
      
      public function get applicationDomain() : ApplicationDomain
      {
         return getApplicationDomain();
      }
      
      public function set applicationDomain(_arg_1:ApplicationDomain) : void
      {
         setApplicationDomain(_arg_1);
      }
   }
}

