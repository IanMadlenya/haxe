/*
 * Copyright (C)2005-2012 Haxe Foundation
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
package haxe;
using haxe.Int64Data;
private typedef NativeInt64 = Int;

@:coreApi
@:nativeGen class Int64Data
{
	@:extern private static inline function asNative(i:Int64Data):NativeInt64 return untyped i;
	@:extern private static inline function ofNative(i:NativeInt64):Int64Data return untyped i;
	@:extern private static inline function mkNative(i:Dynamic):NativeInt64 return i;

	public static inline function make( high : Int, low : Int ) : Int64Data
	{
		return ((cast(high, NativeInt64) << 32 ) | (low & untyped __java__('0xffffffffL'))).ofNative();
	}

	public static inline function getLow( x : Int64Data ) : Int
	{
		return cast (x.asNative() & untyped __java__("0xFFFFFFFFL"));
	}

	public static inline function getHigh( x : Int64Data ) : Int
	{
		return cast(cast(x,NativeInt64) >>> cast(32,NativeInt64), Int);
	}

	public static inline function ofInt( x : Int ) : Int64Data {
		return cast x;
	}

	public static inline function toInt( x : Int64Data ) : Int
	{
		return cast x;
	}

	public static inline function add( a : Int64Data, b : Int64Data ) : Int64Data
	{
		return (a.asNative() + b.asNative()).ofNative();
	}

	public static inline function sub( a : Int64Data, b : Int64Data ) : Int64Data
	{
		return (a.asNative() - b.asNative()).ofNative();
	}

	public static inline function mul( a : Int64Data, b : Int64Data ) : Int64Data {
		return (a.asNative() * b.asNative()).ofNative();
	}

	static function divMod( modulus : Int64Data, divisor : Int64Data ) : { quotient : Int64Data, modulus : Int64Data }
	{
		var q:Int64Data = (modulus.asNative() / divisor.asNative()).mkNative().ofNative();
		var m:Int64Data = (modulus.asNative() % divisor.asNative()).mkNative().ofNative();
		return { quotient : q, modulus : m };
	}

	public static inline function div( a : Int64Data, b : Int64Data ) : Int64Data {
		return (a.asNative() / b.asNative()).mkNative().ofNative();
	}

	public static inline function mod( a : Int64Data, b : Int64Data ) : Int64Data {
		return (a.asNative() % b.asNative()).mkNative().ofNative();
	}

	public static inline function shl( a : Int64Data, b : Int ) : Int64Data {
		return (a.asNative() << b).ofNative();
	}

	public static inline function shr( a : Int64Data, b : Int ) : Int64Data {
		return (a.asNative() >> b).ofNative();
	}

	public static inline function ushr( a : Int64Data, b : Int ) : Int64Data {
		return (a.asNative() >>> b).ofNative();
	}

	public static inline function and( a : Int64Data, b : Int64Data ) : Int64Data
	{
		return (a.asNative() & b.asNative()).ofNative();
	}

	public static inline function or( a : Int64Data, b : Int64Data ) : Int64Data
	{
		return (a.asNative() | b.asNative()).ofNative();
	}

	public static inline function xor( a : Int64Data, b : Int64Data ) : Int64Data
	{
		return (a.asNative() ^ b.asNative()).ofNative();
	}

	public static inline function neg( a : Int64Data ) : Int64Data
	{
		return (~a.asNative()).ofNative();
	}

	public static inline function isNeg( a : Int64Data ) : Bool
	{
		return (a.asNative() < 0.mkNative());
	}

	public static inline function isZero( a : Int64Data ) : Bool
	{
		return (a.asNative() == 0.mkNative());
	}

	public static inline function compare( a : Int64Data, b : Int64Data ) : Int
	{
		return cast(a.asNative() - b.asNative(), Int);
	}

	public static function ucompare( a : Int64Data, b : Int64Data ) : Int
	{
		if (a.asNative() < 0.mkNative())
			return (b.asNative() < 0.mkNative()) ? compare( (~a.asNative()).ofNative(), (~b.asNative()).ofNative()) : 1;
		return (b.asNative() < 0.mkNative()) ? -1 : compare(a, b);
	}

	public static inline function toStr( a : Int64Data ) : String {
		return a + "";
	}
}