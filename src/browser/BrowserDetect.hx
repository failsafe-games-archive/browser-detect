package browser;

#if js
import js.Browser;
import js.html.Audio;
import js.html.audio.AudioContext;
#end

/**
 * Simple HTML5 browser detection for Haxe, kind of like Modernizr
 *
 * Return false if on another platform than js
 */
class BrowserDetect
{
  // No need to instantiate
  private function new() {}

  /* Misc */

  // Check if we have a promise based browser
  static var _hasPromise = 0;
  public static function hasPromise()
  {
    #if !js
    return false;
    #else
    if ( _hasPromise > 0 ) return _hasPromise == 1;

    if ( untyped __js__('typeof Promise !== "undefined" && Promise.toString().indexOf("[native code]") !== -1') )
    {
      _hasPromise = 1;
      return true;
    }

    _hasPromise = 2;
    return false;
    #end
  }

  /* Audio */

  // Check AudioContext
  static var _hasAudioContext = 0;
  public static function hasAudioContext()
  {
    #if !js
    return false;
    #else
    if ( _hasAudioContext > 0 ) return _hasAudioContext == 1;

    // webkitAudioContext
    if ( untyped __js__("'AudioContext' in window") )
    {
      _hasAudioContext = 1;
      return true;
    }

    _hasAudioContext = 2;
    return false;
    #end
  }

  // Check if we can use decodeAudioData
  static var _hasDecodeAudioData = 0;
  public static function hasDecodeAudioData()
  {
    #if !js
    return false;
    #else
    if ( !hasAudioContext() ) return false;
    if ( _hasDecodeAudioData > 0 ) return _hasDecodeAudioData == 1;

    var ctx = new AudioContext();
    if ( untyped js.Syntax.typeof(ctx.decodeAudioData) == "function" )
    {
      ctx.close();
      _hasDecodeAudioData = 1;
      return true;
    }

    ctx.close();
    _hasDecodeAudioData = 2;
    return false;
    #end
  }

  // Check if we can play / decode OGG
  static var _hasOGG = 0;
  public static function hasOGG()
  {
    #if !js
    return false;
    #else
    if ( !hasAudioContext() ) return false;
    if ( _hasOGG > 0 ) return _hasOGG == 1;

    var support = new Audio().canPlayType('audio/ogg; codecs="vorbis"');
    if ( support == 'probably' ) // Ignore maybe / no / empty
    {
      _hasOGG = 1;
      return true;
    }

    _hasOGG = 2;
    return false;
    #end
  }

  // Check if we can play / decode MP3
  static var _hasMP3 = 0;
  public static function hasMP3()
  {
    #if !js
    return false;
    #else
    if ( !hasAudioContext() ) return false;
    if ( _hasMP3 > 0 ) return _hasMP3 == 1;

    var support = new Audio().canPlayType('audio/mpeg; codecs="mp3"');
    if ( support == 'probably' ) // Ignore maybe / no / empty
    {
      _hasMP3 = 1;
      return true;
    }

    _hasMP3 = 2;
    return false;
    #end
  }
}