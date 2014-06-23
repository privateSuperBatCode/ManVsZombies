package mvzClasses.elements.bullets
{
	public class BulletRed03 extends Bullet
	{
		public function BulletRed03()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 140;
			sheetID = 16;
			hitWidth = 45;
			hitHeight = 45;
			xOffset = -25;
			yOffset = -35;
			return;
		}
	}
}