package bullet;

#if eval
class Generator {

	static var INCLUDE = "
#ifdef _WIN32
#pragma warning(disable:4305)
#pragma warning(disable:4244)
#pragma warning(disable:4316)
#undef min
#undef max
#endif
#include <btBulletDynamicsCommon.h>
#include <BulletSoftBody/btSoftBody.h>
#include <BulletSoftBody/btSoftBodyRigidBodyCollisionConfiguration.h>
#include <BulletSoftBody/btDefaultSoftBodySolver.h>
#include <BulletSoftBody/btSoftBodyHelpers.h>
#include <BulletSoftBody/btSoftRigidDynamicsWorld.h>
#include <BulletCollision/CollisionShapes/btHeightfieldTerrainShape.h>
#include <BulletCollision/CollisionDispatch/btGhostObject.h>
#include <BulletDynamics/Character/btKinematicCharacterController.h>

";

	static var options = { idlFile : "bullet/bullet.idl", nativeLib : "bullet", outputDir : ".", includeCode : INCLUDE, autoGC : false };

	public static function generateCpp() {
		webidl.Generate.generateCpp(options);
	}

	public static function getFiles() {
		var prj = new haxe.xml.Access(Xml.parse(sys.io.File.getContent("bullet.vcxproj.filters")).firstElement());
		var sources = [];
		for( i in prj.elements )
			if( i.name == "ItemGroup" )
				for( f in i.elements ) {
					if( f.name != "ClCompile" ) continue;
					var fname = f.att.Include.split("\\").join("/");
					sources.push(fname);
				}
		return sources;
	}

	public static function generateJs() {
		// ammo.js params
		var debug = true;
		var defines = debug ? [] : ["NO_EXIT_RUNTIME=1", "LEGACY_VM_SUPPORT=1", "BINARYEN_IGNORE_IMPLICIT_TRAPS=1", "ALLOW_MEMORY_GROWTH=1", "NO_FILESYSTEM=1", "AGGRESSIVE_VARIABLE_ELIMINATION=1", "ELIMINATE_DUPLICATE_FUNCTIONS=1", "NO_DYNAMIC_EXECUTION=1"];
		var params = ["-O"+(debug?0:3), "--llvm-lto", "1", "-I", "src/bullet/src", "-Wno-unused-command-line-argument", "-g3", "-gsource-map" ];
		for( d in defines ) {
			params.push("-s");
			params.push(d);
		}
		webidl.Generate.generateJs(options, getFiles(), params);
	}

}
#end