package mvzClasses.elements.bullets
{
	public class BulletGreen05 extends Bullet
	{
		public function BulletGreen05()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 20;
			sheetID = 12;
			hitWidth = 10;
			hitHeight = 10;
			xOffset = -6;
			yOffset = -6;
			return;
		}
	}
	
}