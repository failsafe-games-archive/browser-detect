package;

import browser.BrowserDetect;

import statistics.TraceTimer;
import statistics.Stats;

// Tests
enum Tests
{
  TestOGG;
}

/**
 * Class used to Test / Compile haxe-browser-detect library
 */
class TestSave
{
  // Stats
  var stats = new Stats();

  // Run some tests
  public function new()
  {
    trace("Test Browser Detect Launch!");

    TraceTimer.activate();

    var test = TestOGG;

    switch (test)
    {
      case TestOGG: testOGG();
    }
  }

  // Test OGG Support
  function testOGG()
  {
    trace("Testing OGG");
    trace("Supported:", BrowserDetect.hasOGG());
  }
}