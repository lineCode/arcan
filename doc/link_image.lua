-- link_image
-- @short: Reassign the property-space to be relative another object
-- @inargs: vid:id, vid:newparent
-- @inargs: vid:id, vid:newparent, int:panchor
-- @longdescr: By default, all objects defines their properties relative to
-- an invisible WORLDID object. By the use of this function, this object can
-- be switched to another dynamically, allowing you to build complex
-- hierarchies.
--
-- The default properties that are relative to another object in this way
-- are opacity, position, orientation and lifetime, though this set can be
-- changed with the use of ref:image_mask_set, ref:image_mask_clear,
-- ref:image_mask_clearall, ref:image_mask_toggle
--
-- The *vid* argument refers to the object that shall be reassigned, and
-- the *newparent* arguments specified the object that it should be made
-- relative to.
--
-- If the *panchor* argument is specified, it defines the positional
-- anchoring space based on one of the following values:
--
-- ANCHOR_UL : upper-left, ANCHOR_CR : upper-center, ANCHOR_UR : upper-right,
-- ANCHOR_CL : center-left, ANCHOR_C : center, ANCHOR_CR : center-right,
-- ANCHOR_LL : lower-left, ANCHOR_LC : lower-center, ANCHOR_LR : lower-right.
--
-- @note: Changing link ownership resets all scheduled transformations
-- except for blending.
-- @note: Rotation transforms do not take the positional anchor point
-- into account, only its mask.
-- @note: Link to self is equivalent to linking back to WORLDID.
-- @group: image
-- @cfunction: linkimage
function main()
#ifdef MAIN
	a = fill_surface(64, 64, 255, 0, 0);
	b = fill_surface(32, 32, 0, 255, 0);
	link_image(b, a);
	show_image(b);
	blend_image(a, 1.0, 50);
	move_image(a, VRESW, VRESH, 100);
	rotate_image(a, 100, 100);
	expire_image(a, 100);
#endif
end
