package mvzClasses.mechanics
{
	
	public class Ticker extends Object
	{
		public var delay:int = 100;
		public var delayNow:int;
		
		public function Ticker(delayBy:uint)
		{
			delay = 100;
			delayNow = delay;
			delay = delayBy;
			delayNow = delayBy;
			return;
			
		}//end function Ticker
		
		public function setDelay(delayParameter:uint)
		{
			delay = delayParameter;
			return;
		}//end function setDelay
		
		public function setCurrentDelay(currentDelayParameter:uint)
		{
			delayNow = currentDelayParameter;
			if (delayNow > delay)
			{
				delayNow = delay
			}
			return;
		}//end function setCurrentDelay
		
		public function reset()
		{
			delayNow = delay;
			return;
		}//end function reset
		
		public function getCompletion() : Number
		{
			return delayNow / delay;
			
		}//end function getCompletion
		
		public function tick(tickParameter:uint) : Boolean
		{
			delayNow = delayNow - tickParameter;
			if (delayNow <= 0)
			{
				delayNow = delay;
				return true;
				
			}
			return false;
		}//end function tick
		
		
	}
	
}