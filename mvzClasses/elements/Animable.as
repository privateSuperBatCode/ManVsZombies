package mvzClasses.elements
{
	
	public class Animable extends Object
	{
		public var currentAnimDelay:int = 50;
		public var startFrame:uint = 0;
		public var cFrame:uint = 0;
		public var dead:Boolean = false;
		public var endFrame:uint = 13;
		public var hitHeight:uint = 100;
		public var animDelay:uint = 50;
		public var animate:Function;
		public var effectSpeedX:Number = 0;
		public var effectSpeedY:Number = 0;
		public var xOffset:int = -50;
		public var yOffset:int = -50;
		public var animSign:int = 1;
		public var hitWidth:uint = 100;
		public var x:Number = 200;
		public var y:Number = 200;
		public var sheetID:uint = 2;
		
		
		public function Animable() //copious reassignment not necessary, still done, following the reversed template
		{
			x = 200;
			y = 200;
			effectSpeedX = 0;
			effectSpeedY = 0;
			hitWidth = 100;
			hitHeight = 100;
			xOffset = -50;
			yOffset = -50;
			sheetID = 2;
			cFrame = 0;
			animSign = 1;
			animate = doNothing;
			animDelay = 50;
			currentAnimDelay = 50;
			startFrame = 0;
			endFrame = 13;
			dead = false;
			return;
			
			
		}
		
		public function moveEffect()
		{
			x = x + effectSpeedX;
			y = y + effectSpeedY;
			return;
		}
		
		private function animTick(delay:uint) : Boolean
		{
			
			currentAnimDelay = currentAnimDelay - delay
			if (currentAnimDelay <= 0 )
			{
				currentAnimDelay = currentAnimDelay + animDelay;
				return true;
			}
			return false;
			
		}
		
		public function setAnim
		
		
		
	}
}