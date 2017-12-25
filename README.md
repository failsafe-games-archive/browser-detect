# browser-detect
Simple HTML5 browser detection for Haxe, kind of like Modernizr

Example
```haxe
// Check for OGG support
if ( BrowserDetect.hasOGG() )
{
  trace("Yup");
}
else
{
  trace("Nope");
}
```