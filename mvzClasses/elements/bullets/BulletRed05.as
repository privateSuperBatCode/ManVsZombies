package mvzClasses.elements.bullets
{
	public class BulletRed05 extends Bullet
	{
		public function BulletRed05()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 55;
			sheetID = 14;
			hitWidth = 10;
			hitHeight = 10;
			xOffset = -6;
			yOffset = -6;
			return;
		}
	}
}