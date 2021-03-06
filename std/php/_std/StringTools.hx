/*
 * Copyright (C)2005-2015 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */
@:coreApi class StringTools {

	public inline static function urlEncode( s : String ) : String untyped {
		return __call__("rawurlencode", s);
	}

	public inline static function urlDecode( s : String ) : String untyped {
		return __call__("urldecode", s);
	}

	public static function htmlEscape( s : String, ?quotes : Bool ) : String {
		s = s.split("&").join("&amp;").split("<").join("&lt;").split(">").join("&gt;");
		return quotes ? s.split('"').join("&quot;").split("'").join("&#039;") : s;
	}

	public inline static function htmlUnescape( s : String ) : String {
		return untyped __call__("htmlspecialchars_decode", s ,__php__("ENT_QUOTES"));
	}

	public static function startsWith( s : String, start : String ) : Bool {
		return( s.length >= start.length && s.substr(0,start.length) == start );
	}

	public static function endsWith( s : String, end : String ) : Bool {
		var elen = end.length;
		var slen = s.length;
		return( slen >= elen && s.substr(slen-elen,elen) == end );
	}

	public static function isSpace( s : String, pos : Int ) : Bool {
		var c = s.charCodeAt( pos );
		return (c >= 9 && c <= 13) || c == 32;
	}

	public inline static function ltrim( s : String ) : String {
		return untyped __call__("ltrim", s);
	}

	public inline static function rtrim( s : String ) : String {
		return untyped __call__("rtrim", s);
	}

	public inline static function trim( s : String ) : String {
		return untyped __call__("trim", s);
	}

	public inline static function rpad( s : String, c : String, l : Int ) : String {
		return c.length == 0 || s.length >= l ? s : untyped __call__("str_pad", s, Math.ceil((l-s.length) / c.length) * c.length + s.length , c, __php__("STR_PAD_RIGHT"));
	}

	public inline static function lpad( s : String, c : String, l : Int ) : String {
		return c.length == 0 || s.length >= l ? s : untyped __call__("str_pad", s, Math.ceil((l-s.length) / c.length) * c.length + s.length , c, __php__("STR_PAD_LEFT"));
	}

	public inline static function replace( s : String, sub : String, by : String ) : String {
		return untyped sub=="" ? __call__("implode", __call__("str_split ", s) , by) : __call__("str_replace", sub, by, s);
	}

	public static function hex( n : Int, ?digits : Int ) : String {
		var s : String = untyped __call__("dechex", n),
			len = 8;
		if (s.length > (null == digits ? len : (len = digits > len ? digits : len)))
			s = s.substr(-len);
		else if ( digits != null )
			s = lpad(s, '0', digits);
		return s.toUpperCase();
	}

	public static inline function fastCodeAt( s : String, index : Int ) : Int {
		return untyped s.cca(index);
	}

	public static inline function isEof( c : Int ) : Bool {
		return untyped __physeq__(c, 0);
	}

}
