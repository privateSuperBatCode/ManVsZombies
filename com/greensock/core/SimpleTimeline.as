package com.greensock.core
{

    public class SimpleTimeline extends TweenCore
    {
        public var autoRemoveChildren:Boolean;
        protected var _lastChild:TweenCore;
        protected var _firstChild:TweenCore;

        public function SimpleTimeline(param1:Object = null)
        {
            super(0, param1);
            return;
        }// end function

        override public function renderTime(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
        {
            var _loc_4:* = null;
            var _loc_5:* = NaN;
            var _loc_6:* = null;
            _loc_4 = _firstChild;
            this.cachedTotalTime = param1;
            this.cachedTime = param1;
            while (_loc_4)
            {
                
                _loc_6 = _loc_4.nextNode;
                if (_loc_4.active || param1 >= _loc_4.cachedStartTime && !_loc_4.cachedPaused && !_loc_4.gc)
                {
                    if (!_loc_4.cachedReversed)
                    {
                        _loc_4.renderTime((param1 - _loc_4.cachedStartTime) * _loc_4.cachedTimeScale, param2, false);
                    }
                    else
                    {
                        _loc_5 = _loc_4.cacheIsDirty ? (_loc_4.totalDuration) : (_loc_4.cachedTotalDuration);
                        _loc_4.renderTime(_loc_5 - (param1 - _loc_4.cachedStartTime) * _loc_4.cachedTimeScale, param2, false);
                    }
                }
                _loc_4 = _loc_6;
            }
            return;
        }// end function

        public function addChild(param1:TweenCore) : void
        {
            if (!param1.gc && param1.timeline)
            {
                param1.timeline.remove(param1, true);
            }
            param1.timeline = this;
            if (param1.gc)
            {
                param1.setEnabled(true, true);
            }
            if (_firstChild)
            {
                _firstChild.prevNode = param1;
            }
            param1.nextNode = _firstChild;
            _firstChild = param1;
            param1.prevNode = null;
            return;
        }// end function

        public function get rawTime() : Number
        {
            return this.cachedTotalTime;
        }// end function

        public function remove(param1:TweenCore, param2:Boolean = false) : void
        {
            if (!param1.gc && !param2)
            {
                param1.setEnabled(false, true);
            }
            if (param1.nextNode)
            {
                param1.nextNode.prevNode = param1.prevNode;
            }
            else if (_lastChild == param1)
            {
                _lastChild = param1.prevNode;
            }
            if (param1.prevNode)
            {
                param1.prevNode.nextNode = param1.nextNode;
            }
            else if (_firstChild == param1)
            {
                _firstChild = param1.nextNode;
            }
            return;
        }// end function

    }
}
