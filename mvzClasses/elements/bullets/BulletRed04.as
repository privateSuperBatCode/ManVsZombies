package mvzClasses.elements.bullets
{
	public class BulletRed04 extends Bullet
	{
		public function BulletRed04()
		{
			isRotating = false;
			animate = pingPong;
			endFrame = 3;
			damage = 80;
			sheetID = 15;
			hitWidth = 11;
			hitHeight = 11;
			xOffset = -7;
			yOffset = -7;
			return;
		}
	}
}