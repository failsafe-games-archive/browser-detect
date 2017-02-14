package;

import openfl.display.Sprite;

/**
 * Test the browser-detect library in OpenFL
 */
class MainOpenFL extends Sprite
{
  var test:TestDetect;

  // Run some tests
	public function new()
  {
		super();

		test = new TestDetect();
	}
}