package mvzClasses.elements.bullets
{
	public class BulletGreen03 extends Bullet
	{
		public function BulletGreen03()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 100;
			sheetID = 10;
			hitWidth = 45;
			hitHeight = 45;
			xOffset = -25;
			yOffset = -25;
			return;
		}
	}
}