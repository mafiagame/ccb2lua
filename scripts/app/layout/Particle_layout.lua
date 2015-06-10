
local Particle_layout = class("Particle_layout",function()
    return display.newLayer()
end)





function Particle_layout:ctor(_owner)
	 _owner = _owner or self
	self:setAnchorPoint(cc.p(0.5,0.5))
	self:setContentSize(cc.size(display.width * 1.0, display.height * 1.0))
	self:ignoreAnchorPointForPosition(true)

	local ccparticlesystemquad_1 = cc.ParticleSystemQuad:create()

	ccparticlesystemquad_1:setTexture(cc.Director:getInstance():getTextureCache():addImage("ccbParticleSmoke.png"));
	ccparticlesystemquad_1:setBlendAdditive(true);
	ccparticlesystemquad_1:setTotalParticles(250);

	ccparticlesystemquad_1:setDuration(-1);
	ccparticlesystemquad_1:setEmissionRate(20);
	ccparticlesystemquad_1:setEmitterMode(0);
	ccparticlesystemquad_1:setEndColor(cc.c4f(0.0,0.0,0.0,0.01));
	ccparticlesystemquad_1:setEndColorVar(cc.c4f(0.0,0.0,0.0,0.0));
	ccparticlesystemquad_1:setStartColor(cc.c4f(1,1,1,0.2));
	ccparticlesystemquad_1:setStartColorVar(cc.c4f(0.0,0.0,0.0,0.0));

	ccparticlesystemquad_1:setPosVar(cc.p(40,40));

	ccparticlesystemquad_1:setGravity(cc.p(0.0,0.0));
	ccparticlesystemquad_1:setSpeed(60);
	ccparticlesystemquad_1:setSpeedVar(20);
	ccparticlesystemquad_1:setTangentialAccel(0.0);
	ccparticlesystemquad_1:setTangentialAccelVar(0.0);
	ccparticlesystemquad_1:setRadialAccel(0.0);
	ccparticlesystemquad_1:setRadialAccelVar(0.0);
	ccparticlesystemquad_1:setLife(3);
	ccparticlesystemquad_1:setLifeVar(0.25);
	ccparticlesystemquad_1:setStartSize(35);
	ccparticlesystemquad_1:setStartSizeVar(10);
	ccparticlesystemquad_1:setEndSize(0.0);
	ccparticlesystemquad_1:setEndSizeVar(0.0);
	ccparticlesystemquad_1:setStartSpin(0.0);
	ccparticlesystemquad_1:setStartSpinVar(0.0);
	ccparticlesystemquad_1:setEndSpin(0.0);
	ccparticlesystemquad_1:setEndSpinVar(0.0);
	ccparticlesystemquad_1:setAngle(90);
	ccparticlesystemquad_1:setAngleVar(10);
	ccparticlesystemquad_1:setBlendFunc(1, 1)
	ccparticlesystemquad_1:ignoreAnchorPointForPosition(false)
	ccparticlesystemquad_1:setAnchorPoint(cc.p(0.0,0.0))
	ccparticlesystemquad_1:setPosition(cc.p(self:getContentSize().width * 0.5, self:getContentSize().height * 0.5))

	self:addChild(ccparticlesystemquad_1)


end



return Particle_layout