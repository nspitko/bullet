package bullet;

enum abstract CollisionFlags(Int) from Int to Int
{
	public var CF_DYNAMIC_OBJECT = 0;
	public var CF_STATIC_OBJECT = 1;
	public var CF_KINEMATIC_OBJECT = 2;
	public var CF_NO_CONTACT_RESPONSE = 4;
	public var CF_CUSTOM_MATERIAL_CALLBACK = 8;  //this allows per-triangle material (friction/restitution)
	public var CF_CHARACTER_OBJECT = 16;
	public var CF_DISABLE_VISUALIZE_OBJECT = 32;          //disable debug drawing
	public var CF_DISABLE_SPU_COLLISION_PROCESSING = 64;  //disable parallel/SPU processing
	public var CF_HAS_CONTACT_STIFFNESS_DAMPING = 128;
	public var CF_HAS_CUSTOM_DEBUG_RENDERING_COLOR = 256;
	public var CF_HAS_FRICTION_ANCHOR = 512;
	public var CF_HAS_COLLISION_SOUND_TRIGGER = 1024;
}

enum abstract CollisionObjectTypes(Int) from Int to Int
{
	public var CO_COLLISION_OBJECT = 1;
	public var CO_RIGID_BODY = 2;
	///CO_GHOST_OBJECT keeps track of all objects overlapping its AABB and that pass its collision filter
	///It is useful for collision sensors; explosion objects; character controller etc.
	public var CO_GHOST_OBJECT = 4;
	public var CO_SOFT_BODY = 8;
	public var CO_HF_FLUID = 16;
	public var CO_USER_TYPE = 32;
	public var CO_FEATHERSTONE_LINK = 64;
}

enum abstract AnisotropicFrictionFlags(Int) from Int to Int
{
	public var CF_ANISOTROPIC_FRICTION_DISABLED = 0;
	public var CF_ANISOTROPIC_FRICTION = 1;
	public var CF_ANISOTROPIC_ROLLING_FRICTION = 2;
}
