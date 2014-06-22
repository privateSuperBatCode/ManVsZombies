package mvzClasses.elements.bullets
{
	import mvzClasses.elements.*;
	
	public class Bullet extends Animable
	{
		public var isRotating:Boolean = false;
		public var xSpeed:Number;
		public var ySpeed:Number;
		public var damage:uint = 10;
		public var isFollow:Boolean = true;
		
		public function Bullet() //again redundant initializations due to reversation.
		{
			
			damage = 10;
			isRotating = false;
			isFollow = true;
			return;
		}
		
		private function checkBounds() : void
		{
			if (this.x < -80 || this.x >800 || this.y < -80 || this.y > 630)
			{
				this.dead = true;
			}
		}
		
		public function setFrame(rotationSpeed:Number)
		{
			var roundedNumber:Number = 0;
			this.animate = doNothing;
			roundedNumber = Math.round(rotationSpeed * 180 / Math.PI / 10 );
			
			while (roundedNumber < 0)
			{
				roundedNumber = roundedNumber + 36;
			}
			while (roundedNumber >= 36)
			{
				roundedNumber = roundedNumber - 36;
			}
			if (roundedNumber == 35)
			{
				roundedNumber = 0;
			}
			this.cFrame = roundedNumber;
			return;
		}
		
		public function doMove(timeDifference:int)
		{
			x = x + xSpeed * timeDifference;
			y = y + ySpeed * timeDifference;
			checkBounds();
			return;
		}
		
		public function setSpeeds(speed:Number, angle:Number)
		{
			xSpeed = angle * Math.cos(speed);
			ySpeed = angle * Math.sin(speed);
			
			if (isRotating)
			{
				setFrame(speed);
			}
			return;
		}
		
		public function setPos(xPosition:Number, yPosition:Number) : void
		{
			x = xPosition;
			y = yPosition;
			return;
		}
		
		
		
		
	}
}