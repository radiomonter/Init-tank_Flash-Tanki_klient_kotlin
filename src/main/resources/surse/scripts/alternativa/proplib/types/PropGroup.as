package alternativa.proplib.types
{
   public class PropGroup
   {
      
      public var name:String;
      
      public var props:Vector.<PropData>;
      
      public var groups:Vector.<PropGroup>;
      
      public function PropGroup(_arg_1:String)
      {
         super();
         this.name = _arg_1;
      }
      
      public function getPropByName(_arg_1:String) : PropData
      {
         var _local_2:PropData = null;
         if(this.props == null)
         {
            return null;
         }
         for each(_local_2 in this.props)
         {
            if(_local_2.name == _arg_1)
            {
               return _local_2;
            }
         }
         return null;
      }
      
      public function getGroupByName(_arg_1:String) : PropGroup
      {
         var _local_2:PropGroup = null;
         if(this.groups == null)
         {
            return null;
         }
         for each(_local_2 in this.groups)
         {
            if(_local_2.name == _arg_1)
            {
               return _local_2;
            }
         }
         return null;
      }
      
      public function addProp(_arg_1:PropData) : void
      {
         if(this.props == null)
         {
            this.props = new Vector.<PropData>();
         }
         this.props.push(_arg_1);
      }
      
      public function addGroup(_arg_1:PropGroup) : void
      {
         if(this.groups == null)
         {
            this.groups = new Vector.<PropGroup>();
         }
         this.groups.push(_arg_1);
      }
      
      public function traceGroup() : void
      {
         var _local_1:PropGroup = null;
         var _local_2:PropData = null;
         if(this.groups != null)
         {
            for each(_local_1 in this.groups)
            {
               _local_1.traceGroup();
            }
         }
         if(this.props != null)
         {
            for each(_local_2 in this.props)
            {
               _local_2.traceProp();
            }
         }
      }
   }
}

