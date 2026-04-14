package utils.tweener.core
{
   public class SimpleTimeline extends TweenCore
   {
      
      protected var _firstChild:TweenCore;
      
      protected var _lastChild:TweenCore;
      
      public var autoRemoveChildren:Boolean;
      
      public function SimpleTimeline(_arg_1:Object = null)
      {
         super(0,_arg_1);
      }
      
      public function insert(_arg_1:TweenCore, _arg_2:* = 0) : TweenCore
      {
         var _local_3:SimpleTimeline = _arg_1.timeline;
         if(!_arg_1.cachedOrphan && Boolean(_local_3))
         {
            _local_3.remove(_arg_1,true);
         }
         _arg_1.timeline = this;
         _arg_1.cachedStartTime = Number(_arg_2) + _arg_1.delay;
         if(_arg_1.gc)
         {
            _arg_1.setEnabled(true,true);
         }
         if(_arg_1.cachedPaused && _local_3 != this)
         {
            _arg_1.cachedPauseTime = _arg_1.cachedStartTime + (this.rawTime - _arg_1.cachedStartTime) / _arg_1.cachedTimeScale;
         }
         if(Boolean(this._lastChild))
         {
            this._lastChild.nextNode = _arg_1;
         }
         else
         {
            this._firstChild = _arg_1;
         }
         _arg_1.prevNode = this._lastChild;
         this._lastChild = _arg_1;
         _arg_1.nextNode = null;
         _arg_1.cachedOrphan = false;
         return _arg_1;
      }
      
      public function remove(_arg_1:TweenCore, _arg_2:Boolean = false) : void
      {
         if(_arg_1.cachedOrphan)
         {
            return;
         }
         if(!_arg_2)
         {
            _arg_1.setEnabled(false,true);
         }
         if(Boolean(_arg_1.nextNode))
         {
            _arg_1.nextNode.prevNode = _arg_1.prevNode;
         }
         else if(this._lastChild == _arg_1)
         {
            this._lastChild = _arg_1.prevNode;
         }
         if(Boolean(_arg_1.prevNode))
         {
            _arg_1.prevNode.nextNode = _arg_1.nextNode;
         }
         else if(this._firstChild == _arg_1)
         {
            this._firstChild = _arg_1.nextNode;
         }
         _arg_1.cachedOrphan = true;
      }
      
      override public function renderTime(_arg_1:Number, _arg_2:Boolean = false, _arg_3:Boolean = false) : void
      {
         var _local_5:TweenCore = null;
         var _local_4:Number = NaN;
         var _local_6:TweenCore = this._firstChild;
         this.cachedTotalTime = _arg_1;
         this.cachedTime = _arg_1;
         while(Boolean(_local_6))
         {
            _local_5 = _local_6.nextNode;
            if(_local_6.active || _arg_1 >= _local_6.cachedStartTime && !_local_6.cachedPaused && !_local_6.gc)
            {
               if(!_local_6.cachedReversed)
               {
                  _local_6.renderTime((_arg_1 - _local_6.cachedStartTime) * _local_6.cachedTimeScale,_arg_2,false);
               }
               else
               {
                  _local_4 = !_local_6.cacheIsDirty ? Number(_local_6.cachedTotalDuration) : Number(_local_6.totalDuration);
                  _local_6.renderTime(_local_4 - (_arg_1 - _local_6.cachedStartTime) * _local_6.cachedTimeScale,_arg_2,false);
               }
            }
            _local_6 = _local_5;
         }
      }
      
      public function get rawTime() : Number
      {
         return this.cachedTotalTime;
      }
   }
}

