package mvzClasses.elements.bullets
{
	public class BulletRed02 extends Bullet
	{
		public function BulletRed02()
		{
			isRotating = false;
			animate = loop;
			endFrame = 6;
			damage = 100;
			sheetID = 17;
			hitHeight = 27;
			hitWidth = 27;
			xOffset = -15;
			yOffset = -15;
			return;
		}
	}
}